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
	
	// 진행중인설문 리스트 상세
	@RequestMapping("listDetail.su")
	public String surveyListDetail() {
		return "survey/surveyListDetail";
	}
	
	// 마감된설문 리스트
	@RequestMapping("endList.su")
	public String surveyEndList() {
		return "survey/surveyEndList";
	}
	
	// 마감된설문 리스트 상세
	@RequestMapping("endListDetail.su")
	public String survyeEndListDetail() {
		return "survey/survyeEndListDetail";
	}

}
