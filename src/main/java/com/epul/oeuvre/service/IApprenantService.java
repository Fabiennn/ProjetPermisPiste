package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.LearnerEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IApprenantService {

    public List<LearnerEntity> getTousLesApprenants();

}
