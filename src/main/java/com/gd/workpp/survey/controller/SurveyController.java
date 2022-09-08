package com.gd.workpp.survey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SurveyController {
	
	// 설문조사 등록페이지
	@RequestMapping("enrollForm.su")
	public String surveyEnrollForm() {
		return "survey/surveyEnrollForm";
	}
	
	// 진행중인설문 리스트
	@RequestMapping("list.su")
	public String surveyList() {
		return "survey/surveyList";
	}

}
