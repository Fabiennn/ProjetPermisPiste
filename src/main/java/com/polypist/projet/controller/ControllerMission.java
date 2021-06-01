package com.polypist.projet.controller;

import com.polypist.projet.domains.MissionEntity;
import com.polypist.projet.mesExceptions.MonException;
import com.polypist.projet.service.MissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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

        String destinationPage = "";
        try {
            MissionEntity missionEntity = new MissionEntity();
            missionEntity.setWording(request.getParameter("wording"));
            this.missionService.inserer(missionEntity);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        }
        destinationPage = "/vues/listerMissions";
        return this.pageMissions(request, response);
    }

    }
