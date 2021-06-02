package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.ActionEntity;
import com.epul.oeuvre.repositories.ActionMissionRepository;
import com.epul.oeuvre.repositories.ActionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActionService implements IActionService {

    @Autowired
    private ActionRepository actionRepository;

    @Autowired
    private ActionMissionRepository actionMissionRepository;

    public List<ActionEntity> getAllActions() {
        return this.actionRepository.findAll();
    }
}
