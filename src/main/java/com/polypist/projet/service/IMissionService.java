package com.polypist.projet.service;


import com.polypist.projet.domains.MissionEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IMissionService {

    public List<MissionEntity> getToutesLesMissions();

    public void inserer (MissionEntity missionEntity);
}
