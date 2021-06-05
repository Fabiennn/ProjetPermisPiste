package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.ActionMissionEntity;
import com.epul.oeuvre.domains.InscriptionActionEntity;
import com.epul.oeuvre.domains.InscriptionEntity;
import com.epul.oeuvre.domains.MissionEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface IMissionService {

    public List<MissionEntity> getToutesLesMissions();

    public void inserer (MissionEntity missionEntity);

    public MissionEntity getByWording(String wording);

    public void supprimer(MissionEntity missionEntity);

    public MissionEntity findById(Long id);

    public void modifier(MissionEntity missionEntity);

    public List<MissionEntity> getMissionParApprenant(Long id);

    public List<ActionMissionEntity> getByFkMission(int fkMission);

    public List<ActionMissionEntity> getByFkAction(int fkAction);

    Map<InscriptionEntity, List<InscriptionActionEntity>> getinscriptionActionForMissionByApprenant(Long fkLearner);

    List<InscriptionEntity> getMissionsNotMade(Long fkLearner);
}
