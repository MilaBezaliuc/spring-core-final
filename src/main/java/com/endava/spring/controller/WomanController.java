package com.endava.spring.controller;

import com.endava.spring.entity.Woman;
import com.endava.spring.service.WomanServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("women")
public class WomanController {

    @Autowired
    WomanServiceImpl womanService;

    @RequestMapping(method = RequestMethod.GET)
    public String listOfWomen(Model model) {
        model.addAttribute("woman", new Woman());
        model.addAttribute("listOfWomen", womanService.getListOfWomen());
        return "women";
    }

    @RequestMapping(value = "/add-woman", method = RequestMethod.POST)
    public String addWoman(@ModelAttribute("woman") Woman woman) {
        if(woman.getId() == 0)
            womanService.addWoman(woman);
        else
            womanService.editWoman(woman);
        return "redirect:/women";
    }

    @RequestMapping(value = "/edit-woman/{id}")
    public String editWoman(@PathVariable("id") int id, Model model) {
        model.addAttribute("woman", womanService.getWomanById(id));
        model.addAttribute("listOfWomen", womanService.getListOfWomen());
        return "women";
    }

//    @RequestMapping(value = "/edit-woman/{name}", method = RequestMethod.POST)
//    public String editWoman(@PathVariable("name") String name, Model model) {
//        model.addAttribute("woman", womanService.getWomanByName(name));
//        model.addAttribute("listOfWomen", womanService.getListOfWomen());
//        return "women";
//    }

    @RequestMapping(value = "/delete-woman/{name}")
    public String deleteWoman(@PathVariable("name") String name) {
        womanService.deleteWomanByName(name);
        return "redirect:/women";
    }

}
