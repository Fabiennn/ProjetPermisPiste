package com.polypist.projet.domains;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "mission", schema = "projetpermis", catalog = "")
public class MissionEntity {
    private Long id;
    private String wording;
    private Collection<ActionMissionEntity> actionMissionsById;
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
    @Column(name = "wording", nullable = true, length = 25)
    public String getWording() {
        return wording;
    }

    public void setWording(String wording) {
        this.wording = wording;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MissionEntity that = (MissionEntity) o;
        return Objects.equals(id, that.id) && Objects.equals(wording, that.wording);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, wording);
    }

    @OneToMany(mappedBy = "missionByFkMission")
    public Collection<ActionMissionEntity> getActionMissionsById() {
        return actionMissionsById;
    }

    public void setActionMissionsById(Collection<ActionMissionEntity> actionMissionsById) {
        this.actionMissionsById = actionMissionsById;
    }

    @OneToMany(mappedBy = "missionByFkMission")
    public Collection<InscriptionEntity> getInscriptionsById() {
        return inscriptionsById;
    }

    public void setInscriptionsById(Collection<InscriptionEntity> inscriptionsById) {
        this.inscriptionsById = inscriptionsById;
    }
}
