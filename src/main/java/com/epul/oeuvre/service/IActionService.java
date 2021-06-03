package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.ActionEntity;
import org.springframework.stereotype.Service;

@Service
public interface IActionService {

    public void supprimer(Long id);

    public ActionEntity findById(Long id);

    public ActionEntity findByWording(String wording);

    public void modifier(ActionEntity actionEntity);


}
