package com.epul.oeuvre.controller;

import com.epul.oeuvre.domains.*;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.repositories.*;
import com.epul.oeuvre.service.MissionService;
import com.epul.oeuvre.utilitaires.FonctionsUtiles;
import org.apache.coyote.Request;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.*;

@RequestMapping("/mission")
@RestController
@CrossOrigin
public class ControllerMission {

    @Autowired
    private MissionService missionService;

    @Autowired
    private ApprenantRepository apprenantRepository;

    @Autowired
    private InscriptionRepository inscriptionRepository;

    @Autowired
    private InscriptionActionRepository inscriptionActionRepository;

    @Autowired
    private ActionRepository actionRepository;

    @Autowired
    private ActionMissionRepository actionMissionRepository;

    @RequestMapping(method = RequestMethod.GET, value = "/getAllMissionAdmin")
    public ModelAndView pageMissionsGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage = "";
        List<MissionEntity> mesMissions = null;
        try {
            mesMissions= missionService.getToutesLesMissions();
            request.setAttribute("missions", mesMissions);
            request.setAttribute("allActions", actionRepository.findAll());
            destinationPage = "vues/listerMissions";
        }  catch (MonException e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        }
        catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "vues/Erreur";
        }
        return new ModelAndView(destinationPage);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/getAllMissionAdmin")
    public ModelAndView pageMissionsPOST(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if(request.getParameter("addAction") != null){
            int missionId = Integer.parseInt(request.getParameter("addAction"));
            int actionId = Integer.parseInt(request.getParameter("idAction"));
            ActionMissionEntity actionMission = new ActionMissionEntity();
            actionMission.setFkMission(missionId);
            actionMission.setFkAction(actionId);
            try {
                actionMissionRepository.save(actionMission);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if(request.getParameter("updateId") != null) {
            int missionId = Integer.parseInt(request.getParameter("updateId"));
            MissionEntity missionEntity = missionService.findById(Long.valueOf(missionId));
            String wording = missionEntity.getWording() != null ? missionEntity.getWording() : "" ;
            if (wording.equals(request.getParameter("wording")) || missionService.getByWording(request.getParameter("wording")) == null) {
                missionEntity.setWording(request.getParameter("wording"));
                missionService.modifier(missionEntity);
            } else {
                request.setAttribute("updateError", "Nom de mission déjà prit");
                return this.pageMissionsGET(request, response);
            }
        }
        return new ModelAndView("redirect:/mission/getAllMissionAdmin");
    }

    @RequestMapping("/ajouterUneMission")
    public ModelAndView ajouterMission(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage = "";
        try {
            MissionEntity missionEntity = new MissionEntity();
            if (this.missionService.getByWording(request.getParameter("wording")) != null) {
                request.setAttribute("addError", "Nom de mission déjà pris");
                return this.pageMissionsGET(request, response);
            }
            missionEntity.setWording(request.getParameter("wording"));
            this.missionService.inserer(missionEntity);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        }
        destinationPage = "redirect:/mission/getAllMissionAdmin";
        return new ModelAndView(destinationPage);
    }

    @RequestMapping(method= RequestMethod.POST, value="/inscrireMissionApprenant")
    public ModelAndView inscrireMissionApprenant(HttpServletRequest request, HttpServletResponse response){
        Integer idMission = Integer.valueOf(request.getParameter("idMission"));
        Integer idLearner = Integer.valueOf(request.getParameter("idLearner"));
        InscriptionEntity inscriptionEntity = new InscriptionEntity();
        inscriptionEntity.setFkMission(idMission);
        inscriptionEntity.setFkLearner(idLearner);
        inscriptionRepository.save(inscriptionEntity);
        return new ModelAndView("redirect:/mission/consulterMissionApprenant/"+idLearner);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/consulterMissionApprenant/{id}")
    public ModelAndView getMissionParApprenant(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*List<MissionEntity> missionEntities = this.missionService.getMissionParApprenant(id);
        request.setAttribute("mesMissions", missionEntities);*/
        LearnerEntity learner = apprenantRepository.getOne(id);
        request.setAttribute("apprenant", learner);
        List<InscriptionEntity> inscriptionMade = inscriptionRepository.getPreviousInscriptionsOfLearner(id.intValue());
        request.setAttribute("mesInscriptions", inscriptionMade);
        List<InscriptionEntity> inscriptionNotMade = inscriptionRepository.getNextInscriptionsOfLearner(id.intValue());
        request.setAttribute("mesMissionNonEffectues", inscriptionNotMade);
        HttpSession session = request.getSession();
        if(session.getAttribute("role").equals("admin"))
            request.setAttribute("allMissions", missionService.getToutesLesMissions());
        return new ModelAndView("/vues/listerMissionParApprenant");
    }

    @RequestMapping(method = RequestMethod.POST, value="consulterMissionApprenant/{id}")
    public ModelAndView supprimerInscription(@PathVariable(value = "id")Long id, HttpServletRequest request, HttpServletResponse response){
        inscriptionRepository.deleteById(Long.valueOf(request.getParameter("deleteId")));
        return new ModelAndView("redirect:/mission/consulterMissionApprenant/{id}");
    }

    @RequestMapping("/supprimerMission/{id}")
    public ModelAndView supprimerMission(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        this.missionService.supprimer(this.missionService.findById(id));
        return new ModelAndView("redirect:/mission/getAllMissionAdmin");
    }


    @RequestMapping(method = RequestMethod.GET, value = "/mesMissions")
    public ModelAndView pageConsulterMesMissions(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession session = request.getSession();
        return new ModelAndView("forward:/mission/consulterMissionApprenant/"+session.getAttribute("id"));
    }

    @RequestMapping(method = RequestMethod.GET, value = "/mesMissions/{id}/commencer")
    public ModelAndView pageCommencerMission(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response){
        InscriptionEntity inscriptionEntity = inscriptionRepository.getOne(id);
        request.setAttribute("mission", inscriptionEntity.getMissionByFkMission());
        request.setAttribute("inscription", inscriptionEntity);
        return new ModelAndView("vues/commencerMission");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/mesMissions/{id}/simuler")
    public ModelAndView simulationMission(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response){
        InscriptionEntity inscriptionEntity = inscriptionRepository.getOne(id);
        MissionEntity missionEntity = inscriptionEntity.getMissionByFkMission();
        List<ActionMissionEntity> actionMissionEntities = (List<ActionMissionEntity>) missionEntity.getActionMissionsById();
        actionMissionEntities.forEach(actionMissionEntity ->{
            ActionEntity action = actionMissionEntity.getActionByFkAction();
            int score = FonctionsUtiles.simulerAction(action);
            int sort = score >= action.getScoreMinimum() ? 1 : -1;
            InscriptionActionEntity inscriptionActionEntity = new InscriptionActionEntity();
            inscriptionActionEntity.setFkAction(action.getId().intValue());
            inscriptionActionEntity.setFkInscription(inscriptionEntity.getId().intValue());
            inscriptionActionEntity.setScore(score);
            inscriptionActionEntity.setSort(sort);
            inscriptionActionRepository.save(inscriptionActionEntity);
        });
        LocalDate today = LocalDate.now();
        inscriptionEntity.setDate(java.sql.Date.valueOf(today));
        inscriptionRepository.save(inscriptionEntity);
        return new ModelAndView("redirect:/mission/mesMissions/{id}/resultat");
    }

    @RequestMapping(method=RequestMethod.GET, value = "mesMissions/{id}/resultat")
    public ModelAndView pageResultatMission(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response){
        InscriptionEntity inscriptionEntity = inscriptionRepository.getOne(id);
        request.setAttribute("inscription", inscriptionEntity);
        List <InscriptionActionEntity> inscriptionActionEntities = (List<InscriptionActionEntity>) inscriptionEntity.getInscriptionActionsById();
        request.setAttribute("actions",inscriptionActionEntities);
        int nbSuccess = (int) inscriptionActionEntities.stream().filter(inscriptionActionEntity -> inscriptionActionEntity.getSort() == 1).count();
        request.setAttribute("nbActionSuccess", nbSuccess);
        return new ModelAndView("vues/resultatMission");
    }

}
