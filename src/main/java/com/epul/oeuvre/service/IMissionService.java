package com.epul.oeuvre.service;


import com.epul.oeuvre.domains.MissionEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IMissionService {

    public List<MissionEntity> getToutesLesMissions();

    public void inserer (MissionEntity missionEntity);

    public MissionEntity getByWording(String wording);

    public void supprimer(MissionEntity missionEntity);

    public MissionEntity findById(Long id);

    public void modifier(MissionEntity missionEntity);

    public List<MissionEntity> getMissionParApprenant(Long id);
}
