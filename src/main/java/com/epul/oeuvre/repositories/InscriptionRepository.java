package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.InscriptionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InscriptionRepository extends JpaRepository<InscriptionEntity, Long> {

    public List<InscriptionEntity> findByFkLearner(int fkLearner);
}
