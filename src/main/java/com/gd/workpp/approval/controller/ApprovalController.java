package com.gd.workpp.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.approval.model.service.ApprovalServiceImpl;
import com.gd.workpp.approval.model.vo.Absence;
import com.gd.workpp.approval.model.vo.Approval;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.approval.model.vo.Overtime;
import com.gd.workpp.approval.model.vo.Plan;
import com.gd.workpp.approval.model.vo.Vacation;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalServiceImpl apService;
	
	/**
	 * Author : 최영헌
	 * 결재 내역 조회 페이지 이동요청을 처리해주는 메소드
	 * @param currentPage : 사용자가 보고자 하는 페이지 번호
	 * @param category : 사용자가 보고자 하는 카테고리
	 * @return
	 */
	@RequestMapping("approvalList.ap")
	public ModelAndView approvalList(@RequestParam(value="cpage", defaultValue="1")int currentPage,
                                     @RequestParam(value="category", defaultValue="4")int category,
                                     HttpSession session,ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.selectApprovalCount(category, userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.selectApprovalList(pi, category, userNo);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("approval/approvalList");
		
		return mv;
	}
	
	/**
	 * Author : 최영헌
	 * 참조 문서 조회 페이지 이동 요청을 처리하는 메소드
	 * @param currentPage : 사용자가 보고자 하는 페이지 번호
	 */
	@RequestMapping("referenceList.ap")
	public ModelAndView referenceListView(@RequestParam(value="cpage", defaultValue="1")int currentPage,
                                          HttpSession session, ModelAndView mv) {
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
	 * 임시저장문서 페이지 이동, 조회 요청을 처리해주는 메소드
	 * @param currentPage : 사용자가 보고자 하는 페이지 번호
	 */
	@RequestMapping("saveList.ap")
	public ModelAndView saveListView(@RequestParam(value="cpage", defaultValue="1")int currentPage,
                                     HttpSession session, ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		int listCount = apService.selectSaveListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = apService.selectSaveList(pi, userNo);
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("approval/saveList");
		
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
	 * 양식 작성페이지 이동 요청을 처리해주는 메소드
	 * @param form : 사용자가 선택한 양식 명
	 */
	@RequestMapping("document.ap")
	public String planView(String form, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		// 약식으로 작성된 결재문서 유무 확인
		Document document = apService.selectTemporaryApproval(userNo);
		
		if(document != null) {
			model.addAttribute("document", document);
			model.addAttribute("member", m);
			
			if(form.equals("연장근무신청서")) {
				return "approval/overtime";			
			}else if(form.equals("휴가신청서")) {
				return "approval/vacation";			
			}else if(form.equals("결근사유서")) {
				return "approval/absence";			
			}else if(form.equals("업무기안서")) {
				return "approval/plan";					
			}
		}else {
			int result = apService.insertTemporaryApproval(userNo, form);	
			Document newDocument = apService.selectTemporaryApproval(userNo);
			if(result > 0) {
				model.addAttribute("document", newDocument);
				model.addAttribute("member", m);
				
				if(form.equals("연장근무신청서")) {
					return "approval/overtime";			
				}else if(form.equals("휴가신청서")) {
					return "approval/vacation";			
				}else if(form.equals("결근사유서")) {
					return "approval/absence";			
				}else if(form.equals("업무기안서")) {
					return "approval/plan";					
				}
			}else {
				model.addAttribute("errorMsg", "Approval Error");
				return "common/errorPage";
			}
		}
		
		model.addAttribute("errorMsg", "Approval Error");
		return "common/errorPage";
	}
	
	/**
	 * Author : 최영헌
	 * 결재문서 작성 중 뒤로가기 요청을 처리하는 메소드
	 */
	@RequestMapping("backPage.ap")
	public String backPage(HttpSession session, int documentNo) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		apService.backPage(userNo, documentNo);

		return "approval/documentList";
	}
	
	/**
	 * Author : 최영헌
	 * 업무기안 결재 등록 요청을 처리하는 메소드
	 * @param document : 사용자가 입력한 결재문서 내용이 담겨있는 객체
	 * @param planStart : 사용자가 입력한 시행일자
	 * @param upfile : 사용자가 업로드한 파일
	 */
	@RequestMapping("insertApprovalPlan.ap")
	public String insertApprovalPlan(@RequestParam(value="status", defaultValue="1")int status,
			                         Document document, Plan plan, MultipartFile upfile, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		document.setStatus(status);
		
		// 전달된 첨부파일 존재할 경우에 파일명 수정 후 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = FileUpload.saveFile(upfile, session, "resources/approval_upfiles/");
			document.setOriginName(upfile.getOriginalFilename());
			document.setChangeName(changeName);
		}
		
		int result = apService.insertApprovalPlan(document, plan);
		
		if(result > 0) {
			if(document.getStatus() == 2) {
				session.setAttribute("alertMsg", "임시저장 완료");	
				return "redirect:saveList.ap";
			}else {
				session.setAttribute("alertMsg", "결재상신 완료");				
				return "redirect:approvalList.ap";
			}
		}else {
			if(document.getStatus() == 2) {
				model.addAttribute("errorMsg", "임시저장 과정 중 오류 발생");
			}else {
				model.addAttribute("errorMsg", "결재상신 과정 중 오류 발생");			
			}
			return "common/errorPage";
		}
	}
	
	/**
	 * Author : 최영헌
	 * 업무기안 결재 등록 요청을 처리하는 메소드
	 * @param document : 사용자가 입력한 결재문서 내용이 담겨있는 객체
	 * @param planStart : 사용자가 입력한 시행일자
	 * @param upfile : 사용자가 업로드한 파일
	 */
	@RequestMapping("insertApprovalOvertime.ap")
	public String insertApprovalOvertime(@RequestParam(value="status", defaultValue="1")int status,
			                         Document document, Overtime overtime, MultipartFile upfile, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		document.setStatus(status);
		
		// 전달된 첨부파일 존재할 경우에 파일명 수정 후 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = FileUpload.saveFile(upfile, session, "resources/approval_upfiles/");
			document.setOriginName(upfile.getOriginalFilename());
			document.setChangeName(changeName);
		}
		
		int result = apService.insertApprovalOvertime(document, overtime);
		
		if(result > 0) {
			if(document.getStatus() == 2) {
				session.setAttribute("alertMsg", "임시저장 완료");	
				return "redirect:saveList.ap";
			}else {
				session.setAttribute("alertMsg", "결재상신 완료");				
				return "redirect:approvalList.ap";
			}
		}else {
			if(document.getStatus() == 2) {
				model.addAttribute("errorMsg", "임시저장 과정 중 오류 발생");
			}else {
				model.addAttribute("errorMsg", "결재상신 과정 중 오류 발생");			
			}
			return "common/errorPage";
		}
	}
	
	/**
	 * Author : 최영헌
	 * 업무기안 결재 등록 요청을 처리하는 메소드
	 * @param document : 사용자가 입력한 결재문서 내용이 담겨있는 객체
	 * @param planStart : 사용자가 입력한 시행일자
	 * @param upfile : 사용자가 업로드한 파일
	 */
	@RequestMapping("insertApprovalAbsence.ap")
	public String insertApprovalAbsence(@RequestParam(value="status", defaultValue="1")int status,
			                         Document document, Absence absence, MultipartFile upfile, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		document.setStatus(status);
		
		// 전달된 첨부파일 존재할 경우에 파일명 수정 후 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = FileUpload.saveFile(upfile, session, "resources/approval_upfiles/");
			document.setOriginName(upfile.getOriginalFilename());
			document.setChangeName(changeName);
		}
		
		int result = apService.insertApprovalAbsence(document, absence);
		
		if(result > 0) {
			if(document.getStatus() == 2) {
				session.setAttribute("alertMsg", "임시저장 완료");	
				return "redirect:saveList.ap";
			}else {
				session.setAttribute("alertMsg", "결재상신 완료");				
				return "redirect:approvalList.ap";
			}
		}else {
			if(document.getStatus() == 2) {
				model.addAttribute("errorMsg", "임시저장 과정 중 오류 발생");
			}else {
				model.addAttribute("errorMsg", "결재상신 과정 중 오류 발생");			
			}
			return "common/errorPage";
		}
	}
	
	/**
	 * Author : 최영헌
	 * 업무기안 결재 등록 요청을 처리하는 메소드
	 * @param document : 사용자가 입력한 결재문서 내용이 담겨있는 객체
	 * @param planStart : 사용자가 입력한 시행일자
	 * @param upfile : 사용자가 업로드한 파일
	 */
	@RequestMapping("insertApprovalVacation.ap")
	public String insertApprovalVacation(@RequestParam(value="status", defaultValue="1")int status,
			                         Document document, Vacation vacation, MultipartFile upfile, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		document.setStatus(status);
		
		// 전달된 첨부파일 존재할 경우에 파일명 수정 후 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = FileUpload.saveFile(upfile, session, "resources/approval_upfiles/");
			document.setOriginName(upfile.getOriginalFilename());
			document.setChangeName(changeName);
		}
		
		int result = apService.insertApprovalVacation(document, vacation);
		
		if(result > 0) {
			if(document.getStatus() == 2) {
				session.setAttribute("alertMsg", "임시저장 완료");	
				return "redirect:saveList.ap";
			}else {
				session.setAttribute("alertMsg", "결재상신 완료");				
				return "redirect:approvalList.ap";
			}
		}else {
			if(document.getStatus() == 2) {
				model.addAttribute("errorMsg", "임시저장 과정 중 오류 발생");
			}else {
				model.addAttribute("errorMsg", "결재상신 과정 중 오류 발생");			
			}
			return "common/errorPage";
		}
	}
		
	/**
	 * Author : 최영헌
	 * 결재내역 상세페이지 이동 요청을 처리하는 메소드
	 * @param no : 이동하고자 하는 결재내역 번호
	 * @param form : 양식 확인용도 양식 명
	 */
	@RequestMapping("approvalDetail.ap")
	public ModelAndView approvalDetail(int no, String form, HttpSession session, ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		// 공통부분 결재양식 조회
		Document document = apService.approvalDetail(no);
		
		// 해당 결재양식 조회
		Object obj = apService.approvalDetailForm(no, form);
		
		// 해당 결재 결재자 리스트 조회
		ArrayList<Approval> list = apService.approvalDetailLine(no);
		
		mv.addObject("document", document);
		mv.addObject("obj", obj);
		mv.addObject("list", list);
		mv.addObject("m", m);
		mv.setViewName("approval/approvalDetailView");
		
		
		System.out.println(document);
		System.out.println(obj);
		System.out.println(list);
		System.out.println(m);
		return mv;
	}
		
		
		
		
		
		
		
		
		

}