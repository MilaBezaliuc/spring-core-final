package com.endava.spring.controller;

import com.endava.spring.entity.Man;
import com.endava.spring.service.ManServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("men")
public class ManController {

    @Autowired
    private ManServiceImpl manService;

    @RequestMapping(method = RequestMethod.GET)
    public String listOfMen(Model model) {
        model.addAttribute("man", new Man());
        model.addAttribute("listOfMen", manService.getListOfMen());
        return "men";
    }

    @RequestMapping(value = "/add-man", method = RequestMethod.POST)
    public String addMan(@ModelAttribute("man") Man man) {
        if(man.getId() == 0)
            manService.addMan(man);
        else
            manService.editMan(man);
        return "redirect:/men";
    }

    @RequestMapping(value = "/edit-man/{id}")
    public String editMan(@PathVariable("id") int id, Model model) {
        model.addAttribute("man", manService.getManById(id));
        model.addAttribute("listOfMen",  manService.getListOfMen());
        return "men";
    }
    
    @RequestMapping(value = "/delete-man/{name}")
    public String deleteMan(@PathVariable("name") String name) {
        manService.deleteManByName(name);
        return "redirect:/men";
    }
}
