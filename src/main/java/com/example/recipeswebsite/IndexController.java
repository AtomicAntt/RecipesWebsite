package com.example.recipeswebsite;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping("/")
    public String index(Model model){
        return "main";
    }

    @GetMapping("/about")
    public String about(Model model){
        return "about";
    }


}
