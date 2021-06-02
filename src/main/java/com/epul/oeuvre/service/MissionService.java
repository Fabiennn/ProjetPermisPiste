package com.epul.oeuvre.service;

import com.epul.oeuvre.domains.InscriptionEntity;
import com.epul.oeuvre.domains.MissionEntity;
import com.epul.oeuvre.mesExceptions.MonException;
import com.epul.oeuvre.repositories.InscriptionRepository;
import com.epul.oeuvre.repositories.MissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MissionService implements IMissionService {


    @Autowired
    private MissionRepository missionRepository;

    @Autowired
    private InscriptionRepository inscriptionRepository;

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

    @Override
    public void supprimer(MissionEntity missionEntity) {
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
}

