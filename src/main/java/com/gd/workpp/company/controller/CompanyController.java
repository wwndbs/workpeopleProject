package com.gd.workpp.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyController {
	
	@RequestMapping("orgchart.co")
	public ModelAndView documentListView(ModelAndView mv) {
		mv.setViewName("company/orgchartView");
		return mv;
	}

}
