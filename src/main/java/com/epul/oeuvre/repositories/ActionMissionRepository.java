package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.ActionEntity;
import com.epul.oeuvre.domains.ActionMissionEntity;
import org.hibernate.persister.entity.SingleTableEntityPersister;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActionMissionRepository extends JpaRepository<ActionMissionEntity, Integer> {


    public List<ActionMissionEntity> findByFkAction(int fkAction);

    public List<ActionMissionEntity> getActionMissionEntitiesByFkMission(int fkMission);

    public ActionMissionEntity findByFkActionAndFkMission(int fkAction, int fkMission);
}
