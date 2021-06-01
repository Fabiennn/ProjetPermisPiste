package com.epul.oeuvre.controller;


import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.service.ApprenantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/apprenant")
@RestController
@CrossOrigin
public class ControllerApprenant {

    @Autowired
    private ApprenantService apprenantService;

    @RequestMapping("/getAllApprenantAdmin")
    public ModelAndView pageMissions(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage = "";
        List<LearnerEntity> apprenantList = new ArrayList<>();
        try {
            apprenantList = apprenantService.getTousLesApprenants();
            request.setAttribute("mesApprenants", apprenantList);
            destinationPage = "vues/listerApprenants";
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

        @RequestMapping(method = RequestMethod.POST, value = "/modifierApprenant")
    public ModelAndView modifierApprenant(HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        return new ModelAndView("index");


        }
}
