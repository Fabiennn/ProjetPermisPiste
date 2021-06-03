package com.epul.oeuvre.service;

import com.epul.oeuvre.domains.LearnerEntity;
import com.epul.oeuvre.domains.LoginParam;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

@Service
public interface IAuthentificationService {

    public LearnerEntity authentification(@RequestBody LoginParam unUti) throws Exception;

}
