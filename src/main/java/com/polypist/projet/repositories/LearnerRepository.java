package com.polypist.projet.repositories;

import com.polypist.projet.domains.LearnerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface LearnerRepository extends JpaRepository<LearnerEntity, Integer> {

    public LearnerEntity rechercheNom(String login);

    public List<LearnerEntity> findByRole(String role);

}
