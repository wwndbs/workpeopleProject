package com.gd.workpp.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.approval.model.service.ApprovalServiceImpl;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalServiceImpl apService;
	
	/**
	 * Author : 최영헌
	 * 결재 내역 조회 페이지 이동요청을 처리해주는 메소드
	 */
	@RequestMapping("approvalList.ap")
	public ModelAndView approvalList(ModelAndView mv) {
		mv.setViewName("approval/approvalList");
		return mv;
	}
	
	/**
	 * Author : 최영헌
	 * 참조 문서 조회 요청을 처리해주는 메소드
	 * @param currentPage : 사용자가 이동하고자 하는 페이지 번호(기본값 1)
	 */
	@RequestMapping("referenceList.ap")
	public ModelAndView referenceListView(@RequestParam(value="cpage", defaultValue="1")int currentPage,
			                              ModelAndView mv, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.selectReferenceCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.selectReferenceList(pi, userNo);

		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("approval/referenceList");
		
		return mv;
	}
	
	/**
	 * Author : 최영헌
	 * 양식 선택 페이지 이동 요청을 처리해주는 메소드
	 */
	@RequestMapping("documentList.ap")
	public ModelAndView documentListView(ModelAndView mv) {
		mv.setViewName("approval/documentList");
		return mv;
	}
	
	/**
	 * Author : 최영헌
	 * 임시저장문서 페이지 이동, 조회 요청을 처리해주는 메소드
	 */
	@RequestMapping("saveList.ap")
	public ModelAndView saveListView(ModelAndView mv) {
		mv.setViewName("approval/saveList");
		return mv;
	}
	
	/**
	 * Author : 최영헌
	 * 연장근무신청 결재 페이지 이동 요청을 처리해주는 메소드
	 * @param form : 사용자가 작성하고자 하는 양식
	 */
	@RequestMapping("overtime.ap")
	public ModelAndView overtimeView(ModelAndView mv, HttpSession session, String form) {
		Member m = (Member)session.getAttribute("loginUser");
		mv.addObject("member", m);
		mv.addObject("form", form);
		mv.setViewName("approval/overtime");
		return mv;
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