package com.gd.workpp.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.approval.model.service.ApprovalServiceImpl;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class AjaxApprovalController {
	@Autowired
	private ApprovalServiceImpl apService;
	
	/**
	 * Author : 최영헌
	 * 각 카테고리별 결재 내역 조회 요청을 처리하는 메소드
	 * @param currentPage : 사용자가 보고자 하는 페이지 번호
	 * @param category : 사용자가 보고자 하는 카테고리
	 */
	@ResponseBody
	@RequestMapping(value="approvalListView.ap", produces="application/json; charset=UTF-8")
	public String approvalListView(@RequestParam(value="cpage", defaultValue="1")int currentPage,
			                     @RequestParam(value="category", defaultValue="1")int category,
			                     HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.selectApprovalCount(category, userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.selectApprovalList(pi, category, userNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * Author : 최영헌
	 * 부서별 멤버 조회 요청을 처리하는 메소드
	 * @param dept : 조회 하고자 하는 멤버의 부서명
	 */
	@ResponseBody
	@RequestMapping(value="memberList.ap", produces="application/json; charset=UTF-8")
	public String memberList(String dept) {
		ArrayList<Member> list = apService.selectMemberList(dept);
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="saveListView.ap", produces="application/json; charset=UTF-8")
	public String saveListView(@RequestParam(value="cpage", defaultValue="1")int currentPate,
                                     ModelAndView mv, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.selectSaveListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPate, 5, 10);
		ArrayList<Document> list = apService.selectSaveList(pi, userNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
		}
	
	/**
	 * Author : 최영헌
	 * 임시저장문서 삭제 요청을 처리해주는 메소드
	 * @param no : 삭제 하고자 하는 문서번호
	 */
	@ResponseBody
	@RequestMapping(value="deleteSaveList.ap", produces="application/json; charset=UTF-8")
	public String deleteSaveList(String no) {
		
		String[] noArr = no.split(",");
		
		int result = apService.deleteSaveList(noArr);
		
		String msg = "";
		
		if(result > 0) {
			msg = "임시저장문서를 삭제 했습니다.";
			return new Gson().toJson(msg);
		}else {
			msg = "임시저장문서 삭제에 실패했습니다.";
			return new Gson().toJson(msg);
		}
	}
}
