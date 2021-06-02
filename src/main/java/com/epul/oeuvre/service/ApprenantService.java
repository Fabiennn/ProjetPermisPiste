package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.repositories.LearnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ApprenantService implements IApprenantService{

    @Autowired
    LearnerRepository learnerRepository;


    @Override
    public List<LearnerEntity> getTousLesApprenants() {
        List<LearnerEntity> learnerEntityList = new ArrayList<>();
        try {
            learnerEntityList = learnerRepository.findByRole("apprenant");
        } catch (Exception e) {
            throw new MonException("getAll", "Sql", e.getMessage());
        }

        return learnerEntityList;
    }

    @Override
    public LearnerEntity getLearnerId(Long id) {
        return learnerRepository.findById(id);
    }

    @Override
    public LearnerEntity getLearnerSurname(String surname) {
        return learnerRepository.findBySurname(surname);
    }

    @Override
    public void modifier(LearnerEntity entity) {
        learnerRepository.save(entity);
    }

    //    @Override
//    public void inserer(OeuvreventeEntity uneOV) {
//        try {
//
//            ProprietaireEntity unProprio = new ProprietaireEntity();
//            ProprietaireEntity finalUnProprio = unProprio;
//            unProprio = unProprietaireRepository.findById(uneOV.getIdProprietaire()).orElseThrow(
//                    () -> new MonException("¨Proprietaire", "id", finalUnProprio.getIdProprietaire())
//            );
//            uneOV.setIdProprietaire(unProprio.getIdProprietaire());
//            this.uneOeuvreRepository.save(uneOV);
//        } catch (Exception e) {
//            throw new MonException("Insert", "Sql", e.getMessage());
//        }
//    }


}
