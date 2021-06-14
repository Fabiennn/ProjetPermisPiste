package com.epul.oeuvre.controller;

import com.epul.oeuvre.domains.InscriptionActionEntity;
import com.epul.oeuvre.domains.InscriptionEntity;
import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.domains.LoginParam;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.repositories.ApprenantRepository;
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
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RequestMapping("/authentification")
@RestController
@CrossOrigin
public class ControllerLogin {
    // on initialise
    @Autowired
    private AuthentificationService unAuthenService;

    @Autowired
    private ApprenantRepository apprenantRepository;

    @RequestMapping(value = "/accueil", method = RequestMethod.GET)
    public ModelAndView pageIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("id")==null)
            return new ModelAndView("vues/home");
        LearnerEntity learner = apprenantRepository.getOne((Long) session.getAttribute("id"));
        List<InscriptionEntity> inscriptions = (List<InscriptionEntity>) learner.getInscriptionsById().stream().filter(inscription -> inscription.getDate() != null).collect(Collectors.toList());
        request.setAttribute("inscriptions", inscriptions);
        List<Float> successRates = inscriptions.stream().map(inscription -> {
            List<InscriptionActionEntity> actions = (List<InscriptionActionEntity>) inscription.getInscriptionActionsById();
            Stream<InscriptionActionEntity> actionSucceed = actions.stream().filter(inscriptionAction -> inscriptionAction.getSort() == 1);
            float v = (float) actionSucceed.count()/actions.size();
            return v;
        }).collect(Collectors.toList());
        request.setAttribute("successRatesString", successRates.stream().map(i->i.toString()).reduce((i,j)->i+", "+j).stream().findFirst().orElse(null));
        int nbInscriptionSucceed = (int) successRates.stream().filter(rate -> rate==1.0).count();
        request.setAttribute("nbInscriptionSucceed", nbInscriptionSucceed);
        Optional<String> datesString = inscriptions.stream().map(i->"\""+i.getDate().toString()+"\"").reduce((i, j)->i+", "+j);
        request.setAttribute("datesString", datesString.stream().findFirst().orElse(null));
        return new ModelAndView("index");
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
                session.setAttribute("id", unUtilisateur.getId());
                session.setAttribute("username", unUtilisateur.getForname());
                session.setAttribute("email", unUtilisateur.getEmail());
                session.setAttribute("login", unUtilisateur.getSurname());
                destinationPage = "redirect:/authentification/accueil";
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


