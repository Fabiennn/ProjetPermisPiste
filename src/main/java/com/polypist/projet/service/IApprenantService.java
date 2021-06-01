package com.polypist.projet.service;


import com.polypist.projet.domains.LearnerEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IApprenantService {

    public List<LearnerEntity> getTousLesApprenants();

}
