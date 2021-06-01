package com.polypist.projet.domains;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "learner", schema = "projetpermis", catalog = "")
@NamedQuery(name = "LearnerEntity.rechercheNom",query = "select ut  from LearnerEntity  ut where ut.surname = ?1")
public class LearnerEntity {
    private Long id;
    private String surname;
    private String forname;
    private String salt;
    private String email;
    private String mdp;
    private String role;
    private Collection<InscriptionEntity> inscriptionsById;

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false)
    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "surname", nullable = true, length = 25)
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    @Basic
    @Column(name = "forname", nullable = true, length = 25)
    public String getForname() {
        return forname;
    }

    public void setForname(String forname) {
        this.forname = forname;
    }

    @Basic
    @Column(name = "salt", nullable = true, length = 25)
    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 50)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "mdp", nullable = true, length = 80)
    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    @Basic
    @Column(name = "role", nullable = true, length = 25)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LearnerEntity that = (LearnerEntity) o;
        return Objects.equals(id, that.id) && Objects.equals(surname, that.surname) && Objects.equals(forname, that.forname) && Objects.equals(salt, that.salt) && Objects.equals(email, that.email) && Objects.equals(mdp, that.mdp) && Objects.equals(role, that.role);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, surname, forname, salt, email, mdp, role);
    }

    @OneToMany(mappedBy = "learnerByFkLearner")
    public Collection<InscriptionEntity> getInscriptionsById() {
        return inscriptionsById;
    }

    public void setInscriptionsById(Collection<InscriptionEntity> inscriptionsById) {
        this.inscriptionsById = inscriptionsById;
    }
}
