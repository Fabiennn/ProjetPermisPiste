package com.polypist.projet.repositories;

import com.polypist.projet.domains.MissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.persistence.criteria.CriteriaBuilder;

public interface MissionRepository extends JpaRepository<MissionEntity, Integer> {
}
