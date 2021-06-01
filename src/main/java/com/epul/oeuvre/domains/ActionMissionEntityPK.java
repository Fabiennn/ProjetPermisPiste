package com.epul.oeuvre.domains;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class ActionMissionEntityPK implements Serializable {
    private Integer fkAction;
    private Integer fkMission;

    @Column(name = "fk_action", nullable = false)
    @Id
    public Integer getFkAction() {
        return fkAction;
    }

    public void setFkAction(Integer fkAction) {
        this.fkAction = fkAction;
    }

    @Column(name = "fk_mission", nullable = false)
    @Id
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
        ActionMissionEntityPK that = (ActionMissionEntityPK) o;
        return Objects.equals(fkAction, that.fkAction) && Objects.equals(fkMission, that.fkMission);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fkAction, fkMission);
    }
}
