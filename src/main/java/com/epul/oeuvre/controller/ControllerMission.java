package com.epul.oeuvre.controller;

import com.epul.oeuvre.domains.*;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.repositories.ApprenantRepository;
import com.epul.oeuvre.repositories.InscriptionActionRepository;
import com.epul.oeuvre.repositories.InscriptionRepository;
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

    @RequestMapping("/getAllMissionAdmin")
    public ModelAndView pageMissions(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage = "";
        List<MissionEntity> mesMissions = null;
        try {
            mesMissions= missionService.getToutesLesMissions();
            request.setAttribute("mesMissions", mesMissions);
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

    @RequestMapping("/ajoutMissionAdmin")
    public ModelAndView pageAjout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("vues/ajouterMission");

    }

    @RequestMapping("/ajouterUneMission")
    public ModelAndView ajouterMission(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setAttribute("alerte", "");
        String destinationPage = "";
        try {
            MissionEntity missionEntity = new MissionEntity();
            if (this.missionService.getByWording(request.getParameter("wording")) != null) {
                request.setAttribute("alerte", "Deja prit");
                return this.pageAjout(request, response);
            }
            missionEntity.setWording(request.getParameter("wording"));
            this.missionService.inserer(missionEntity);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        }
        destinationPage = "/vues/listerMissions";
        return this.pageMissions(request, response);
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

    @RequestMapping("/consulterMissionApprenant/{id}")
    public ModelAndView getMissionParApprenant(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*List<MissionEntity> missionEntities = this.missionService.getMissionParApprenant(id);
        request.setAttribute("mesMissions", missionEntities);*/
        LearnerEntity learner = apprenantRepository.getOne(id);
        request.setAttribute("apprenant", learner);
        Map<InscriptionEntity, List<InscriptionActionEntity>> inscriptionActionByMissionMap = this.missionService.getinscriptionActionForMissionByApprenant(id);
        request.setAttribute("mesMissions", inscriptionActionByMissionMap);
        List<InscriptionEntity> missionsNotMade = this.missionService.getMissionsNotMade(id);
        request.setAttribute("mesMissionNonEffectues", missionsNotMade);
        request.setAttribute("allMissions", missionService.getToutesLesMissions());
        return new ModelAndView("/vues/listerMissionParApprenant");

    }

    @RequestMapping("/supprimerMission/{id}")
    public ModelAndView supprimerMission(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        this.missionService.supprimer(this.missionService.findById(id));
        return this.pageMissions(request, response);
    }

    @GetMapping("/modifierMission/{id}")
    public ModelAndView pageModifierMission(@PathVariable(value = "id") Long id, HttpServletRequest request,
                                             HttpServletResponse response) throws Exception {
        MissionEntity missionEntity = this.missionService.findById(id);
        request.setAttribute("maMission", missionEntity);
        return new ModelAndView("vues/modifierMission");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/modifierMission/modifier")
    public ModelAndView modifierMission(HttpServletRequest request,
                                          HttpServletResponse response) throws Exception {

        request.setAttribute("alerte", "");
        MissionEntity missionEntity = missionService.findById(Long.valueOf(request.getParameter("id")));
        if (missionEntity.getWording().equals(request.getParameter("wording")) || missionService.getByWording(request.getParameter("wording")) == null) {
            missionEntity.setWording(request.getParameter("wording"));
            missionService.modifier(missionEntity);
        } else {
            request.setAttribute("alerte", "Nom de mission déjà prit");
            return this.pageModifierMission(Long.valueOf(request.getParameter("id")), request, response);
        }
        return this.pageMissions(request, response);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/mesMissions")
    public ModelAndView pageConsulterMesMissions(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession session = request.getSession();
        return new ModelAndView("forward:/mission/consulterMissionApprenant/"+session.getAttribute("id"));
    }

    @RequestMapping(method = RequestMethod.GET, value = "/mesMissions/{id}/commencer")
    public ModelAndView pageCommencerMission(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response){
        InscriptionEntity inscriptionEntity = inscriptionRepository.getOne(id);
        MissionEntity missionEntity = this.missionService.findById(id);
        request.setAttribute("mission", missionEntity);
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
        request.setAttribute("actions", inscriptionEntity.getInscriptionActionsById());
        return new ModelAndView("vues/resultatMission");
    }

}
