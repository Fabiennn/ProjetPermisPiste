package com.polypist.projet.service;

import com.polypist.projet.domains.MissionEntity;
import com.polypist.projet.mesExceptions.MonException;
import com.polypist.projet.repositories.MissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MissionService implements IMissionService {


    @Autowired
    private MissionRepository missionRepository;

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

            List<MissionEntity> missionEntities = new ArrayList<>();
            missionEntities = getToutesLesMissions();
            Long id = Long.valueOf(missionEntities.size() + 1);
            missionEntity.setId(id);
            this.missionRepository.save(missionEntity);
        } catch (Exception e) {
            throw new MonException("Insert", "Sql", e.getMessage());
        }
    }
}

