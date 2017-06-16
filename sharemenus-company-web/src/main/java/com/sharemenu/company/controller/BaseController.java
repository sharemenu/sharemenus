package com.sharemenu.company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.sharemenu.company.entity.ServiceResult;
import com.sharemenu.company.entity.TestEntity;
import com.sharemenu.company.service.TestService;


@Controller
@RequestMapping("/company")
public class BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	private TestService testService;
   
	@RequestMapping("/index")
    public String index(Model model, HttpServletRequest request){
       System.err.println("************************************************************************");
       ServiceResult<List<TestEntity>>  serviceResult = testService.getTestEntityListByCount(10L);
       System.out.println(JSONObject.toJSONString(serviceResult));
       model.addAttribute("testData", serviceResult);
       logger.info("wenli.zhao print info log:"+JSONObject.toJSONString(serviceResult));
        return "company/index";
    }
}
