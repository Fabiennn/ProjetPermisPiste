package com.polypist.projet.service;

import com.polypist.projet.domains.LearnerEntity;
import com.polypist.projet.domains.LogiParam;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

@Service
public interface IAuthentificationService {

    public LearnerEntity authentification(@RequestBody LogiParam unUti) throws Exception;

}
