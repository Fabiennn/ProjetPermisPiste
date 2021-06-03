package com.epul.oeuvre.domains;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "action__mission", schema = "projetpermis", catalog = "")
@IdClass(ActionMissionEntityPK.class)
public class ActionMissionEntity {
    private Integer fkAction;
    private Integer fkMission;
    private ActionEntity actionByFkAction;
    private MissionEntity missionByFkMission;

    @Id
    @Column(name = "fk_action", nullable = false)
    public Integer getFkAction() {
        return fkAction;
    }

    public void setFkAction(Integer fkAction) {
        this.fkAction = fkAction;
    }

    @Id
    @Column(name = "fk_mission", nullable = false)
    public Integer getFkMission() {
        return fkMission;
    }

    public void setFkMission(Integer fkMission) {
        this.fkMission = fkMission;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ActionMissionEntity that = (ActionMissionEntity) o;
        return Objects.equals(fkAction, that.fkAction) && Objects.equals(fkMission, that.fkMission);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fkAction, fkMission);
    }

    @ManyToOne
    @JoinColumn(name = "fk_action", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    public ActionEntity getActionByFkAction() {
        return actionByFkAction;
    }

    public void setActionByFkAction(ActionEntity actionByFkAction) {
        this.actionByFkAction = actionByFkAction;
    }

    @ManyToOne
    @JoinColumn(name = "fk_mission", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    public MissionEntity getMissionByFkMission() {
        return missionByFkMission;
    }

    public void setMissionByFkMission(MissionEntity missionByFkMission) {
        this.missionByFkMission = missionByFkMission;
    }
}
