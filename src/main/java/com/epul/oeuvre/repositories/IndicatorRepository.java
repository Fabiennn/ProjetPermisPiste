package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.IndicatorEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IndicatorRepository extends JpaRepository<IndicatorEntity, Integer> {

    public List<IndicatorEntity> findByFkAction(int fkAction);
}
