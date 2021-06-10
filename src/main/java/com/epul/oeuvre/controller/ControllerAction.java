package com.epul.oeuvre.controller;


import com.epul.oeuvre.domains.ActionEntity;
import com.epul.oeuvre.domains.ActionMissionEntity;
import com.epul.oeuvre.domains.MissionEntity;
import com.epul.oeuvre.service.ActionService;
import com.epul.oeuvre.service.MissionService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/action")
@RestController
@CrossOrigin
public class ControllerAction {

    @Autowired
    private ActionService actionService;

    @Autowired
    private MissionService missionService;

    @RequestMapping("/getAllActionsAdmin")
    public ModelAndView pageActions(HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<ActionEntity> actionEntityList = this.actionService.getAllActions();
        request.setAttribute("mesActions", actionEntityList);


        return new ModelAndView("vues/listerActions");
    }

    @RequestMapping("/inscrireMissionAction")
    public ModelAndView inscrireMissionAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

        this.actionService.inserer(Integer.valueOf(request.getParameter("idAction")), Integer.valueOf(request.getParameter("idMission")));

        return this.pageActions(request, response);
    }

    @GetMapping("/ajouterMissionAAction/{id}")
    public ModelAndView pageAjouterMissions(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {


        ActionEntity actionEntity = this.actionService.findById(id);
        List<ActionMissionEntity> actionMissionEntities = this.missionService.getByFkAction(Math.toIntExact(actionEntity.getId()));
        List<MissionEntity> missionEntities = this.missionService.getToutesLesMissions();

        for (ActionMissionEntity actionMissionEntity : actionMissionEntities) {
            missionEntities.remove(actionMissionEntity.getMissionByFkMission());
        }


        request.setAttribute("action", actionEntity);
        request.setAttribute("allMissions", missionEntities);
        return new ModelAndView("vues/ajouterMissionAction");

    }
    @GetMapping("/supprimerAction/{id}")
    public ModelAndView supprimerAction(@PathVariable(value = "id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {

        this.actionService.supprimer(id);

        return this.pageActions(request,response);
    }

    @GetMapping("/modifierAction/{id}")
    public ModelAndView pageModifierAction(@PathVariable(value = "id") Long id, HttpServletRequest request,
                                            HttpServletResponse response) throws Exception {
        ActionEntity actionEntity = this.actionService.findById(id);
        request.setAttribute("monAction", actionEntity);
        return new ModelAndView("vues/modifierAction");
    }

    @GetMapping("/supprimerMissionAction/{id}/{idAction}")
    public ModelAndView supprimerMissionAction(@PathVariable(value = "id") Long id, @PathVariable(value = "idAction") Long idAction, HttpServletRequest request,
                                               HttpServletResponse response) throws Exception {

        this.missionService.supprimerActionMission(Math.toIntExact(idAction), Math.toIntExact(id));
        return this.pageActions(request, response);
    }

    @GetMapping("/consulterMission/{id}")
    public ModelAndView pageConsulterMission(@PathVariable(value = "id") Long id, HttpServletRequest request,
                                             HttpServletResponse response) throws Exception {

        List<MissionEntity> missionEntities = new ArrayList<>();
        ActionEntity actionEntity = this.actionService.findById(id);
        List<ActionMissionEntity> actionMissionEntities = this.missionService.getByFkAction(Math.toIntExact(actionEntity.getId()));
        for (ActionMissionEntity actionMissionEntity : actionMissionEntities) {
            missionEntities.add(this.missionService.findById(Long.valueOf(actionMissionEntity.getFkMission())));
        }
        request.setAttribute("monAction", actionEntity);
        request.setAttribute("mesMissions", missionEntities);
        return new ModelAndView("/vues/listerMissionsParAction");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/modifierAction/modifier")
    public ModelAndView modifierMission(HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        request.setAttribute("alerte", "");

        ActionEntity actionEntity = this.actionService.findById(Long.valueOf(request.getParameter("id")));
        if (actionEntity.getWording().equals(request.getParameter("wording")) || this.actionService.findByWording(request.getParameter("wording")) == null) {
            actionEntity.setWording(request.getParameter("wording"));
            actionEntity.setScoreMinimum(Integer.valueOf(request.getParameter("scoreMinimum")));
            this.actionService.modifier(actionEntity);
        } else {
            request.setAttribute("alerte", "Nom d'action' déjà prit");
            return this.pageModifierAction(Long.valueOf(request.getParameter("id")), request, response);
        }

        return this.pageActions(request, response);

    }


}
