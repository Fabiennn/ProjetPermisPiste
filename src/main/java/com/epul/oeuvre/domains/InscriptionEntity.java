package com.epul.oeuvre.domains;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "inscription", schema = "projetpermis", catalog = "")
public class InscriptionEntity {
    private Long id;
    private Integer fkLearner;
    private Integer fkMission;
    private Date date;
    private LearnerEntity learnerByFkLearner;
    private MissionEntity missionByFkMission;
    private Collection<InscriptionActionEntity> inscriptionActionsById;

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
    @Column(name = "fk_learner", nullable = false)
    public Integer getFkLearner() {
        return fkLearner;
    }

    public void setFkLearner(Integer fkLearner) {
        this.fkLearner = fkLearner;
    }

    @Basic
    @Column(name = "fk_mission", nullable = false)
    public Integer getFkMission() {
        return fkMission;
    }

    public void setFkMission(Integer fkMission) {
        this.fkMission = fkMission;
    }

    @Basic
    @Column(name = "date", nullable = true)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InscriptionEntity that = (InscriptionEntity) o;
        return Objects.equals(id, that.id) && Objects.equals(fkLearner, that.fkLearner) && Objects.equals(fkMission, that.fkMission) && Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, fkLearner, fkMission, date);
    }

    @ManyToOne
    @JoinColumn(name = "fk_learner", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    public LearnerEntity getLearnerByFkLearner() {
        return learnerByFkLearner;
    }

    public void setLearnerByFkLearner(LearnerEntity learnerByFkLearner) {
        this.learnerByFkLearner = learnerByFkLearner;
    }

    @ManyToOne
    @JoinColumn(name = "fk_mission", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    public MissionEntity getMissionByFkMission() {
        return missionByFkMission;
    }

    public void setMissionByFkMission(MissionEntity missionByFkMission) {
        this.missionByFkMission = missionByFkMission;
    }

    @OneToMany(mappedBy = "inscriptionByFkInscription")
    public Collection<InscriptionActionEntity> getInscriptionActionsById() {
        return inscriptionActionsById;
    }

    public void setInscriptionActionsById(Collection<InscriptionActionEntity> inscriptionActionsById) {
        this.inscriptionActionsById = inscriptionActionsById;
    }
}
