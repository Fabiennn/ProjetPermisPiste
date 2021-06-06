package com.epul.oeuvre.service;

import com.epul.oeuvre.domains.*;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.repositories.ActionMissionRepository;
import com.epul.oeuvre.repositories.InscriptionRepository;
import com.epul.oeuvre.repositories.MissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MissionService implements IMissionService {


    @Autowired
    private MissionRepository missionRepository;

    @Autowired
    private InscriptionRepository inscriptionRepository;

    @Autowired
    private ActionMissionRepository actionMissionRepository;


    @Override
    public List<MissionEntity> getToutesLesMissions() {
        List<MissionEntity> mesMissions = new ArrayList<>();
        try {

            mesMissions = missionRepository.findAll();
        } catch (Exception e) {
            throw new MonException("getAll", "Sql", e.getMessage());
        }
        return mesMissions;
    }

    @Override
    public void inserer(MissionEntity missionEntity) {
        try {
            this.missionRepository.save(missionEntity);
        } catch (Exception e) {
            throw new MonException("Insert", "Sql", e.getMessage());
        }
    }

    @Override
    public void supprimer(MissionEntity missionEntity) {
        List<ActionMissionEntity> actionMissionEntities = this.actionMissionRepository.getActionMissionEntitiesByFkMission(Math.toIntExact(missionEntity.getId()));
        for (ActionMissionEntity actionMissionEntity : actionMissionEntities) {
            this.actionMissionRepository.delete(actionMissionEntity);
        }
        this.missionRepository.delete(missionEntity);
    }

    @Override
    public MissionEntity findById(Long id) {
        return this.missionRepository.findById(id);
    }

    @Override
    public void modifier(MissionEntity missionEntity) {
        this.missionRepository.save(missionEntity);
    }


    @Override
    public List<MissionEntity> getMissionParApprenant(Long id) {
        List<MissionEntity> missionEntities = new ArrayList<>();
        List<InscriptionEntity> inscriptionEntityList = inscriptionRepository.findByFkLearner(id.intValue());
        for (InscriptionEntity inscriptionEntity : inscriptionEntityList) {
            missionEntities.add(missionRepository.findById(Long.valueOf(inscriptionEntity.getFkMission())));
        }
        return missionEntities;
    }

    @Override
    public MissionEntity getByWording(String wording) {
        return this.missionRepository.findByWording(wording);
    }

    @Override
    public List<ActionMissionEntity> getByFkMission(int fkMission) {
        return this.actionMissionRepository.getActionMissionEntitiesByFkMission(fkMission);
    }

    @Override
    public List<ActionMissionEntity> getByFkAction(int fkAction) {
        return this.actionMissionRepository.findByFkAction(fkAction);
    }

    @Override
    public Map<InscriptionEntity, List<InscriptionActionEntity>> getinscriptionActionForMissionByApprenant(Long fkLearner){
        Map<InscriptionEntity, List<InscriptionActionEntity>> inscriptionActionByMission = new HashMap<>();
        List<InscriptionEntity> inscriptionEntityList = inscriptionRepository.findByFkLearner(fkLearner.intValue());
        inscriptionEntityList.forEach(inscriptionEntity -> {
            List<InscriptionActionEntity> inscriptionActionEntities = (List<InscriptionActionEntity>) inscriptionEntity.getInscriptionActionsById();
            if(inscriptionActionEntities.size() == 0) return;
            inscriptionActionByMission.put(inscriptionEntity, inscriptionActionEntities);
        });
        return inscriptionActionByMission;
    }

    @Override
    public List<InscriptionEntity> getMissionsNotMade(Long fkLearner){
        List<InscriptionEntity> inscriptionEntityList = inscriptionRepository.findByFkLearner(fkLearner.intValue());
        List<InscriptionEntity> missionNotMade = new ArrayList<>();
        inscriptionEntityList.forEach(inscriptionEntity -> {
            List<InscriptionActionEntity> inscriptionActionEntities = (List<InscriptionActionEntity>) inscriptionEntity.getInscriptionActionsById();
            if(inscriptionActionEntities.size() == 0) missionNotMade.add(inscriptionEntity);
        });
        return missionNotMade;
    }

    @Override
    public void supprimerActionMission(int idAction, int idMission) {

        this.actionMissionRepository.delete(this.actionMissionRepository.findByFkActionAndFkMission(idAction, idMission));

    }
}

