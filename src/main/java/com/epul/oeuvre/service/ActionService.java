package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.ActionEntity;
import com.epul.oeuvre.domains.ActionMissionEntity;
import com.epul.oeuvre.domains.IndicatorEntity;
import com.epul.oeuvre.domains.InscriptionActionEntity;
import com.epul.oeuvre.repositories.ActionMissionRepository;
import com.epul.oeuvre.repositories.ActionRepository;
import com.epul.oeuvre.repositories.IndicatorRepository;
import com.epul.oeuvre.repositories.InscriptionActionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActionService implements IActionService {

    @Autowired
    private ActionRepository actionRepository;

    @Autowired
    private ActionMissionRepository actionMissionRepository;

    @Autowired
    private IndicatorRepository indicatorRepository;

    @Autowired
    private InscriptionActionRepository inscriptionActionRepository;

    public List<ActionEntity> getAllActions() {
        return this.actionRepository.findAll();
    }


    @Override
    public void supprimer(Long id) {
        ActionEntity actionEntity = this.actionRepository.findById(id);
        if (actionEntity.getFkAction() == null || actionEntity.getFkAction() != 20) {
            actionEntity.setFkAction(null);
        }

        List<ActionEntity> actionEntityList = this.actionRepository.findByFkAction(Math.toIntExact(actionEntity.getId()));
        for (ActionEntity actionEntity1: actionEntityList) {
            actionEntity1.setFkAction(null);
            this.actionRepository.save(actionEntity1);
        }
        List<ActionMissionEntity> actionMissionEntities = this.actionMissionRepository.findByFkAction(Math.toIntExact(actionEntity.getId()));

        for (ActionMissionEntity actionMissionEntity : actionMissionEntities) {
            this.actionMissionRepository.delete(actionMissionEntity);
        }

        List<IndicatorEntity> indicatorEntities = this.indicatorRepository.findByFkAction(Math.toIntExact(actionEntity.getId()));
        for (IndicatorEntity indicatorEntity : indicatorEntities) {
            this.indicatorRepository.delete(indicatorEntity);
        }

        List<InscriptionActionEntity> inscriptionActionEntities = (List<InscriptionActionEntity>) actionEntity.getInscriptionActionsById();
        for(InscriptionActionEntity inscriptionActionEntity : inscriptionActionEntities){
            inscriptionActionEntity.setFkAction(20);
            inscriptionActionRepository.save(inscriptionActionEntity);
        }

        this.actionRepository.delete(actionEntity);
    }

    @Override
    public ActionEntity findById(Long id) {
        return this.actionRepository.findById(id);
    }

    @Override
    public ActionEntity findByWording(String wording) {
        return this.actionRepository.findByWording(wording);
    }

    @Override
    public void modifier(ActionEntity actionEntity) {
        this.actionRepository.save(actionEntity);
    }

    @Override
    public void inserer (int idAction, int idMission) {

        ActionMissionEntity actionMissionEntity = new ActionMissionEntity();
        actionMissionEntity.setFkAction(idAction);
        actionMissionEntity.setFkMission(idMission);
        this.actionMissionRepository.save(actionMissionEntity);

    }

}
