package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.ActionMissionEntity;
import org.hibernate.persister.entity.SingleTableEntityPersister;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActionMissionRepository extends JpaRepository<ActionMissionEntity, Integer> {


    public List<ActionMissionEntity> findByFkAction(int fkAction);

    public List<ActionMissionEntity> findByFkMission(int fkMission);
}
