package com.gd.workpp.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.approval.model.service.ApprovalServiceImpl;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.Pagination;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalServiceImpl apService;
	
	/**
	 * Author : 최영헌
	 * 결재 내역 조회페이지 이동 요청 처리를 해주는 메소드
	 * @param currentPage : 사용자가 이동하고자 하는 페이지 번호(기본값 1)
	 * @param viewPage : 사용자가 이동하고자 하는 페이지 카테고리\
	 *                    1:전체, 2:진행, 3:완료, 4:반려, 5:대기
	 */
	@RequestMapping("approvalList.ap")
	public ModelAndView approvalListView(@RequestParam(value="cpage", defaultValue="1")int currentPage,
								         @RequestParam(value="page", defaultValue="1")int viewPage,
								         ModelAndView mv){
		int listCount = apService.selectApprovalCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.selectApprovalList(pi);
		
		mv.addObject("list", list);
		mv.setViewName("approval/approvalList");
		return mv;
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