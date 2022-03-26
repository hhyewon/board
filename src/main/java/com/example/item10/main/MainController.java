package com.example.item10.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    protected static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @RequestMapping("")
    public String index(HttpSession session, HttpServletRequest request, Model model) throws Exception{

        return "redirect:/list";
    }

}