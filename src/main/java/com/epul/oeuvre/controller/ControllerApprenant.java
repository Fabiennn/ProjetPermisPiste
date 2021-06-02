package com.epul.oeuvre.controller;


import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.domains.MissionEntity;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.service.ApprenantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RequestMapping("/apprenant")
@RestController
@CrossOrigin
public class ControllerApprenant {

    @Autowired
    private ApprenantService apprenantService;

    @RequestMapping("/getAllApprenantAdmin")
    public ModelAndView pageApprenants(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage = "";
        List<LearnerEntity> apprenantList = new ArrayList<>();
        try {
            apprenantList = apprenantService.getTousLesApprenants();
            request.setAttribute("mesApprenants", apprenantList);
            destinationPage = "vues/listerApprenants";
        } catch (MonException e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "vues/Erreur";
        }
        return new ModelAndView(destinationPage);
    }

    @GetMapping("/supprimerApprenant/{id}")
    public ModelAndView supprimerAdherent(@PathVariable(value = "id") Long id, HttpServletRequest request,
                                             HttpServletResponse response) throws Exception {

        this.apprenantService.supprimer(id);
        return this.pageApprenants(request, response);

    }

    @RequestMapping("/getApprenantByName")
    public ModelAndView getApprenantByName(HttpServletRequest request,
                                         HttpServletResponse response) throws Exception {

        LearnerEntity learnerEntity = this.apprenantService.getLearnerSurname(request.getParameter("nom"));
        if (learnerEntity != null && learnerEntity.getRole().equals("apprenant")) {
            request.setAttribute("monApprenant", learnerEntity);
        } else {
            request.setAttribute("alerte", "Aucun apprenant");
        }

        return new ModelAndView("vues/consulterApprenant");
    }


    @GetMapping("/modifierApprenant/{id}")
    public ModelAndView pageModifierAdherent(@PathVariable(value = "id") Long id, HttpServletRequest request,
                                             HttpServletResponse response) throws Exception {
        LearnerEntity learnerEntity = apprenantService.getLearnerId(id);
        request.setAttribute("monApprenant", learnerEntity);
        return new ModelAndView("vues/modifierApprenant");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/modifierApprenant/modifier")
    public ModelAndView modifierApprenant(HttpServletRequest request,
                                          HttpServletResponse response) throws Exception {

        request.setAttribute("alerte", "");
        LearnerEntity learnerEntity = apprenantService.getLearnerId(Long.valueOf(request.getParameter("id")));
        if (!learnerEntity.getForname().equals(request.getParameter("surname")) && apprenantService.getLearnerSurname(request.getParameter("surname")) == null) {
            learnerEntity.setSurname(request.getParameter("surname"));
            learnerEntity.setForname(request.getParameter("forname"));
            learnerEntity.setEmail(request.getParameter("email"));
            apprenantService.modifier(learnerEntity);
        } else {
            request.setAttribute("alerte", "Nom d'utilisateur déjà prit");
            return this.pageModifierAdherent(Long.valueOf(request.getParameter("id")), request, response);
        }
        return this.pageApprenants(request, response);
    }

    @RequestMapping("/ajouterApprenant")
    public ModelAndView pageAjout(HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {
        return new ModelAndView("/vues/ajouterApprenant");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/ajouter")
    public ModelAndView ajouterApprenant(HttpServletRequest request,
                                          HttpServletResponse response) throws Exception {
        request.setAttribute("alerte", "");
        String destinationPage = "";
        try {
            LearnerEntity learnerEntity = new LearnerEntity();
            if (this.apprenantService.getLearnerSurname(request.getParameter("surname")) != null) {
                request.setAttribute("alerte", "Deja prit");
                return this.pageAjout(request, response);
            }
            learnerEntity.setSurname(request.getParameter("surname"));
            learnerEntity.setForname(request.getParameter("forname"));
            learnerEntity.setEmail(request.getParameter("email"));
            learnerEntity.setMdp(request.getParameter("motdepasse"));
            this.apprenantService.inserer(learnerEntity);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        }
        destinationPage = "/vues/listerMissions";
        return this.pageApprenants(request, response);
    }





}
