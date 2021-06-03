package com.epul.oeuvre.controller;

import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.domains.LoginParam;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.service.AuthentificationService;
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


/* Si Pb renvoyer vers acceuil qui fait aussi login, route obeslète
    @RequestMapping("/login")
    public ModelAndView pageLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("vues/formLogin");
    }
*/

    @RequestMapping(value = "/accueil", method = RequestMethod.GET)
    public ModelAndView pageIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("vues/home");
    }

    ///
    //
    //// Contrôle Login
    ///
    ////
    @RequestMapping(method = RequestMethod.POST, value = "/accueil", params = {"sign-in"})
    public ModelAndView controleLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        LoginParam unUtiParam = new LoginParam();
        HttpSession session;

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
                message = "Identifiant ou mot de passe erroné";
                request.setAttribute("loginError", message);
                request.setAttribute("tab", "sign-in");
                request.setAttribute("login", login);
                destinationPage = "/vues/home";
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

    @RequestMapping(method = RequestMethod.POST, value = "/accueil", params = {"sign-up"})
    public ModelAndView controleSignUP(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("firstname", request.getParameter("firstname"));
        return new ModelAndView("vues/home");
    }

    @RequestMapping("/logout")
    public ModelAndView controlLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
        return new ModelAndView("redirect:/authentification/accueil");
    }



}


