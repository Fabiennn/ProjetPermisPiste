package com.epul.oeuvre.controller;


import com.epul.oeuvre.domains.IndicatorEntity;
import com.epul.oeuvre.repositories.IndicatorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/indicator")
@RestController
@CrossOrigin
public class ControllerIndicator {

    @Autowired
    private IndicatorRepository indicatorRepository;


    @RequestMapping("/getAllIndicator")
    public ModelAndView pageIndicators(HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<IndicatorEntity> indicatorEntityList = this.indicatorRepository.findAll();
        request.setAttribute("mesIndicateurs", indicatorEntityList);
        return new ModelAndView("/vues/listerIndicateurs");


    }
}
