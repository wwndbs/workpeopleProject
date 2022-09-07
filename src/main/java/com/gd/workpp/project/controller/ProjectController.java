package com.gd.workpp.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.workpp.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@RequestMapping("myProject.pr")
	public String myProjectList() {
		return "project/myProjectList";
	}

}
