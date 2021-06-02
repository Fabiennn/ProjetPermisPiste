package com.epul.oeuvre.repositories;

import com.epul.oeuvre.domains.LearnerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface LearnerRepository extends JpaRepository<LearnerEntity, Integer> {

    public LearnerEntity rechercheNom(String login);

    public List<LearnerEntity> findByRole(String role);

    public LearnerEntity findById(Long id);

    public LearnerEntity findBySurname(String surname);

}
