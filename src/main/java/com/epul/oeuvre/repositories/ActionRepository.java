package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.ActionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActionRepository extends JpaRepository<ActionEntity, Integer> {


    public ActionEntity findById(Long id);

    public ActionEntity findByWording(String wording);

    public List<ActionEntity> findByFkAction(int fkAction);

}
