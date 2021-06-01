package com.epul.oeuvre.service;

import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.domains.LogiParam;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.repositories.LearnerRepository;
import com.epul.oeuvre.utilitaires.MonMotPassHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthentificationService implements IAuthentificationService {

    private LearnerRepository learnerrepository;

    @Autowired
    public AuthentificationService(LearnerRepository utilisateurRepostory) {
        this.learnerrepository = utilisateurRepostory;
    }

    @Override
    public LearnerEntity authentification(LogiParam unUti) throws Exception {
        LearnerEntity unUtilisateur = null;
        String message;
        String login = unUti.getNomUtil();
        String pwd = unUti.getMotPasse();
        unUtilisateur = learnerrepository.rechercheNom(login);
        if (unUtilisateur != null) {
            try {
                // on récupère le sel
                String sel = unUtilisateur.getSalt();
                // on récupère le mot de passe
                String mdp = unUtilisateur.getMdp();
                // on génère le mot de passe avec les données de connexion
                byte[] salt = MonMotPassHash.transformeEnBytes(unUtilisateur.getSalt());
                char[] pwd_char = MonMotPassHash.converttoCharArray(pwd);
                byte[] monpwdCo = MonMotPassHash.generatePasswordHash(pwd_char, salt);
                // on récupère le mot de passe enregistré
                byte[] mdp_byte = MonMotPassHash.transformeEnBytes(mdp);
                if (!MonMotPassHash.verifyPassword(monpwdCo, mdp_byte)) {
                    message = "mot de passe erroné";
                    return null;
                }
            } catch (MonException e) {
                throw e;
            } catch (Exception e) {
                throw e;
            }
        }
        return unUtilisateur;
    }
}
