package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.ActionEntity;
import com.epul.oeuvre.domains.IndicatorEntity;
import com.epul.oeuvre.domains.InscriptionActionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InscriptionActionRepository extends JpaRepository<InscriptionActionEntity, Integer> {

    public List<InscriptionActionEntity> findByFkInscription(int fkInscription);

}
