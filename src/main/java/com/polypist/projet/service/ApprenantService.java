package com.polypist.projet.service;


import com.polypist.projet.domains.LearnerEntity;
import com.polypist.projet.mesExceptions.MonException;
import com.polypist.projet.repositories.LearnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
}
