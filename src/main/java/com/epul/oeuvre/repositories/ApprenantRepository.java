package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.LearnerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApprenantRepository extends JpaRepository<LearnerEntity, Integer> {
}
