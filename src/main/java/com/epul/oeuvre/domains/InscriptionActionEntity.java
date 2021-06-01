package com.epul.oeuvre.domains;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "inscription__action", schema = "projetpermis", catalog = "")
public class InscriptionActionEntity {
    private Long id;
    private Integer fkInscription;
    private Integer fkAction;
    private Integer sort;
    private Integer score;
    private InscriptionEntity inscriptionByFkInscription;
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
    @Column(name = "fk_inscription", nullable = false)
    public Integer getFkInscription() {
        return fkInscription;
    }

    public void setFkInscription(Integer fkInscription) {
        this.fkInscription = fkInscription;
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
    @Column(name = "sort", nullable = true)
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Basic
    @Column(name = "score", nullable = true)
    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InscriptionActionEntity that = (InscriptionActionEntity) o;
        return Objects.equals(id, that.id) && Objects.equals(fkInscription, that.fkInscription) && Objects.equals(fkAction, that.fkAction) && Objects.equals(sort, that.sort) && Objects.equals(score, that.score);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, fkInscription, fkAction, sort, score);
    }

    @ManyToOne
    @JoinColumn(name = "fk_inscription", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    public InscriptionEntity getInscriptionByFkInscription() {
        return inscriptionByFkInscription;
    }

    public void setInscriptionByFkInscription(InscriptionEntity inscriptionByFkInscription) {
        this.inscriptionByFkInscription = inscriptionByFkInscription;
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
