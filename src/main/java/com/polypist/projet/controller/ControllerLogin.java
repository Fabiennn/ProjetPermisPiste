package com.polypist.projet.controller;

import com.polypist.projet.domains.LearnerEntity;
import com.polypist.projet.domains.LogiParam;
import com.polypist.projet.mesExceptions.MonException;
import com.polypist.projet.service.AuthentificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequestMapping("/authentification")
@RestController
@CrossOrigin
public class ControllerLogin {
    // on initialise
    @Autowired
    private AuthentificationService unAuthenService;


    @RequestMapping("/login")
    public ModelAndView pageLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("vues/home");
    }

    @RequestMapping("/accueil")
    public ModelAndView pageIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("vues/home");
    }

    ///
    //
    //// Contrôle Login
    ///
    ////
    @RequestMapping(method = RequestMethod.POST, value = "/getLogin")
    public ModelAndView controleLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        LogiParam unUtiParam = new LogiParam();
        HttpSession session;
        System.out.println("test login " + request.getParameterNames());
        String login = request.getParameter("login");
        String pwd = request.getParameter("pwd");
        unUtiParam.setNomUtil(login);
        unUtiParam.setMotPasse(pwd);
        String message = "";
        try {
            LearnerEntity unUtilisateur = unAuthenService.authentification(unUtiParam);
            if (unUtilisateur != null) {
                session = request.getSession();
                if (unUtilisateur.getRole().equals("admin")) {
                    session.setAttribute("role", "admin");
                } else session.setAttribute("role", "apprenant");
                session = request.getSession();
                session.setAttribute("id", unUtilisateur.getId());
                destinationPage = "/index";
            } else {
                message = "mot de passe erroné";
                request.setAttribute("message", message);
                destinationPage = "/vues/formLogin";
            }
        } catch (MonException e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "/vues/Erreur";
        }

        return new ModelAndView(destinationPage);
    }

}


