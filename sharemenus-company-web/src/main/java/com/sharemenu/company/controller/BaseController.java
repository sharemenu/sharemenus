package com.sharemenu.company.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/company")
public class BaseController {
   
	@RequestMapping("/index")
    public String index(Model model, HttpServletRequest request){
       System.err.println("************************************************************************");
        return "company/index";
    }
}
