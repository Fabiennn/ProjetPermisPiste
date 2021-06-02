package com.epul.oeuvre.controller;


import com.epul.oeuvre.domains.ActionEntity;
import com.epul.oeuvre.service.ActionService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/action")
@RestController
@CrossOrigin
public class ControllerAction {

    @Autowired
    private ActionService actionService;

    @RequestMapping("/getAllActionsAdmin")
    public ModelAndView pageActions(HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<ActionEntity> actionEntityList = this.actionService.getAllActions();
        request.setAttribute("mesActions", actionEntityList);


        return new ModelAndView("vues/listerActions");
    }


}
