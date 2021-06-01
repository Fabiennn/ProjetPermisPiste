package com.polypist.projet.repositories;

import com.polypist.projet.domains.LearnerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApprenantRepository extends JpaRepository<LearnerEntity, Integer> {
}
