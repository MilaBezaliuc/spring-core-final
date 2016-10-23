package com.endava.spring.controller;

import com.endava.spring.entity.Dance;
import com.endava.spring.entity.Man;
import com.endava.spring.entity.Woman;
import com.endava.spring.service.DanceServiceImpl;
import com.endava.spring.service.ManServiceImpl;
import com.endava.spring.service.WomanServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("party")
public class DanceController {

    @Autowired
    private DanceServiceImpl danceService;

    @Autowired
    private ManServiceImpl manService;

    @Autowired
    private WomanServiceImpl womanService;

    @RequestMapping(method = RequestMethod.GET)
    public String listDances(Model model) {
        model.addAttribute("dance", new Dance());
        model.addAttribute("listOfDances", danceService.listOfDances());
        model.addAttribute("man", new Man());
        model.addAttribute("listOfMen", manService.getListOfMen());
        model.addAttribute("woman", new Woman());
        model.addAttribute("listOfWomen", womanService.getListOfWomen());
        return "party";
    }

    @RequestMapping(value = "/add-dance", method = RequestMethod.POST)
    public String addDance(@ModelAttribute("dance") Dance dance) {
        danceService.addDance(dance);
        return "redirect:/party";
    }

    @RequestMapping(value = "/delete-dance/{id}")
    public String deleteDance(@PathVariable("id") int id) {
        danceService.deleteDance(id);
        return "redirect:/party";
    }
}
