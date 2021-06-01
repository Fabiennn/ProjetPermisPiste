package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.MissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.persistence.criteria.CriteriaBuilder;

public interface MissionRepository extends JpaRepository<MissionEntity, Integer> {
}
