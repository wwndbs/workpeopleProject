package com.gd.workpp.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.approval.model.service.ApprovalServiceImpl;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalServiceImpl apService;
	
	@RequestMapping("approvalList.ap")
	public String approvalListView() {
		return "approval/approvalList";
	}
	
	@RequestMapping("documentList.ap")
	public ModelAndView documentListView(ModelAndView mv) {
		mv.setViewName("approval/documentList");
		return mv;
	}
	
	@RequestMapping("referenceList.ap")
	public ModelAndView referenceListView(ModelAndView mv) {
		mv.setViewName("approval/referenceList");
		return mv;
	}
	
	@RequestMapping("saveList.ap")
	public ModelAndView saveListView(ModelAndView mv) {
		mv.setViewName("approval/saveList");
		return mv;
	}
	
	@RequestMapping("overtime.ap")
	public String overtimeView() {
		return "approval/overtime";
	}
	
	@RequestMapping("vacation.ap")
	public String vacationView() {
		return "approval/vacation";
	}
	
	@RequestMapping("absence.ap")
	public String absenceView() {
		return "approval/absence";
	}
	
	@RequestMapping("plan.ap")
	public String planView() {
		return "approval/plan";
	}
}