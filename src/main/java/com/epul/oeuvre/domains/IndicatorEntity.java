package com.epul.oeuvre.domains;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "indicator", schema = "projetpermis", catalog = "")
public class IndicatorEntity {
    private Long id;
    private Integer fkAction;
    private String wording;
    private Integer valueIfCheck;
    private Integer valueIfUnCheck;
    private ActionEntity actionByFkAction;

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
    @Column(name = "fk_action", nullable = false)
    public Integer getFkAction() {
        return fkAction;
    }

    public void setFkAction(Integer fkAction) {
        this.fkAction = fkAction;
    }

    @Basic
    @Column(name = "wording", nullable = true, length = 50)
    public String getWording() {
        return wording;
    }

    public void setWording(String wording) {
        this.wording = wording;
    }

    @Basic
    @Column(name = "value_if_Check", nullable = true)
    public Integer getValueIfCheck() {
        return valueIfCheck;
    }

    public void setValueIfCheck(Integer valueIfCheck) {
        this.valueIfCheck = valueIfCheck;
    }

    @Basic
    @Column(name = "value_if_uncheck", nullable = true)
    public Integer getValueIfUnCheck() {
        return valueIfUnCheck;
    }

    public void setValueIfUnCheck(Integer valueIfUnCheck) {
        this.valueIfUnCheck = valueIfUnCheck;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        IndicatorEntity that = (IndicatorEntity) o;
        return Objects.equals(id, that.id) && Objects.equals(fkAction, that.fkAction) && Objects.equals(wording, that.wording) && Objects.equals(valueIfCheck, that.valueIfCheck) && Objects.equals(valueIfUnCheck, that.valueIfUnCheck);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, fkAction, wording, valueIfCheck, valueIfUnCheck);
    }

    @ManyToOne
    @JoinColumn(name = "fk_action", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    public ActionEntity getActionByFkAction() {
        return actionByFkAction;
    }

    public void setActionByFkAction(ActionEntity actionByFkAction) {
        this.actionByFkAction = actionByFkAction;
    }
}
