package com.gd.workpp.approval.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.workpp.approval.model.service.ApprovalServiceImpl;
import com.gd.workpp.approval.model.vo.Approval;
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
	 * 결재 내역 검색 결과 조회 요청을 처리하는 메소드
	 * @param currentPage : 사용자가 보고자 하는 페이지 번호
	 * @param keyword : 사용자가 입력한 검색 키워드
	 */
	@ResponseBody
	@RequestMapping(value="searchApproval.ap", produces="application/json; charset=UTF-8")
	public String searchApproval(@RequestParam(value="cpage", defaultValue="1")int currentPage,
			                     String keyword, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.searchApprovalCount(userNo, keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.searchApprovalList(pi, userNo, keyword);

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
	public String deleteSaveList(String changeName, String no, HttpSession session) {
		
		String[] noArr = no.split(",");
		String[] fileArr = changeName.split(",");
		
		int result = apService.deleteSaveList(noArr);
		
		String msg = "";
		
		if(result > 0) {
			for(int i = 0; i < fileArr.length; i++) {
				if(!fileArr[i].equals("")) {
					new File(session.getServletContext().getRealPath(fileArr[i])).delete();
				}	
			}
			
			msg = "임시저장문서를 삭제 했습니다.";
			return new Gson().toJson(msg);
		}else {
			msg = "임시저장문서 삭제에 실패했습니다.";
			return new Gson().toJson(msg);
		}
	}
	
	/**
	 * Author : 최영헌
	 * 임시저장문서 검색 결과 조회 요청을 처리하는 메소드
	 * @param currentPage : 사용자가 보고자 하는 페이지 번호
	 * @param keyword : 사용자가 입력한 검색 키워드
	 */
	@ResponseBody
	@RequestMapping(value="searchSaveList.ap", produces="application/json; charset=UTF-8")
	public String searchSaveList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
		                         String keyword, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.searchSaveListCount(userNo, keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.searchSaveList(pi, userNo, keyword);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * Author : 최영헌
	 * 참조문서 검색 결과 조회 요청을 처리하는 메소드
	 * @param currentPage : 사용자가 보고자 하는 페이지 번호
	 * @param keyword : 사용자가 입력한 검색 키워드
	 */
	@ResponseBody
	@RequestMapping(value="searchReference.ap", produces="application/json; charset=UTF-8")
	public String searchReference(@RequestParam(value="cpage", defaultValue="1")int currentPage,
		                         String keyword, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.searchReferenceCount(userNo, keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.searchReferenceList(pi, userNo, keyword);
		
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
	
	/**
	 * Author : 최영헌
	 * 결재선, 참조자 조회 요청을 처리하는 메소드
	 * @param documentNo : 결재선, 참조자를 조회하고자 하는 결재 번호
	 */
	@ResponseBody
	@RequestMapping(value="approvalLineView.ap", produces="application/json; charset=UTF-8")
	public String approvalLineView(int documentNo) {
		ArrayList<Approval> list = apService.approvalLineView(documentNo);

		return new Gson().toJson(list);
	}
	
	/**
	 * Author : 최영헌
	 * 체크한 멤버를 결재선, 참조 부분으로 이동하려는 요청을 처리해주는 메소드
	 * @param checkUserNo : 선택한 멤버의 번호 묶음
	 */
	@ResponseBody
	@RequestMapping(value="insertCheck.ap", produces="application/json; charset=UTF-8")
	public String insertCheck(String checkUserNo) {
		String[] userNoArr = checkUserNo.split(",");
		ArrayList<Member> list = apService.insertCheck(userNoArr);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * AUthor : 최영헌
	 * 결재선, 참조 부분에서 체크 멤버를 제외하려는 요청을 처리하는 메소드
	 * @param unCheckMember : 결재선에서 제외하지 않을 멤버 번호 묶음
	 */
	@ResponseBody
	@RequestMapping(value="excludeCheckMember.ap", produces="application/json; charset=UTF-8")
	public String excludeCheckMember(String unCheckMember) {
		String[] userNoArr = unCheckMember.split(",");
		ArrayList<Member> list = apService.excludeCheck(userNoArr);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="insertApprovalAndReference.ap", produces="application/json; charset=UTF-8")
	public void insertApprovalAndReference(String approvalMember, String referenceMember, int documentNo) {
		String[] approvalArr = approvalMember.split(",");
		String[] referenceArr = referenceMember.split(",");
		
		int result = apService.insertApprovalAndReference(approvalArr, referenceArr, documentNo);
		
		if(result > 0) {
//			return "결재선, 참조자를 등록 했습니다.";
		}else {
//			return "등록할 수 없습니다";
		}
	}
}