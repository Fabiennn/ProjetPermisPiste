package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.InscriptionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface InscriptionRepository extends JpaRepository<InscriptionEntity, Long> {

    public List<InscriptionEntity> findByFkLearner(int fkLearner);

    @Query("SELECT u FROM InscriptionEntity u WHERE u.fkLearner = ?1 and u.date is not null")
    public List<InscriptionEntity> getPreviousInscriptionsOfLearner(int id);

    @Query("SELECT u FROM InscriptionEntity u WHERE u.fkLearner = ?1 and u.date is null")
    public List<InscriptionEntity> getNextInscriptionsOfLearner(int id);
}
