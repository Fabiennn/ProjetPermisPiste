package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.LearnerEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface IApprenantService {

    public List<LearnerEntity> getTousLesApprenants();

    public LearnerEntity getLearnerId(Long id);

    public LearnerEntity getLearnerSurname(String surname);

    public void modifier(LearnerEntity entity);

    public void inserer(LearnerEntity entity);

    public void supprimer(Long id);

}
