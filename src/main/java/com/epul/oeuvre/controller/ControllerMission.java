package com.epul.oeuvre.controller;

import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.domains.MissionEntity;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.service.MissionService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/mission")
@RestController
@CrossOrigin
public class ControllerMission {

    @Autowired
    private MissionService missionService;

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

    @RequestMapping("/consulterMissionApprenant/{id}")
    public ModelAndView getMissionParApprenant(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {


        List<MissionEntity> missionEntities = this.missionService.getMissionParApprenant(id);
        request.setAttribute("mesMissions", missionEntities);
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

    }
