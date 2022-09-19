package com.gd.workpp.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.approval.model.service.ApprovalServiceImpl;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.approval.model.vo.Plan;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;

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
                                     @RequestParam(value="category", defaultValue="1")int category,
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
	public String insertApprovalPlan(Document document, Plan plan, MultipartFile upfile,
			                   HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		// 전달된 첨부파일 존재할 경우에 파일명 수정 후 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = FileUpload.saveFile(upfile, session, "resources/approval_upfiles/");
			document.setOriginName(upfile.getOriginalFilename());
			document.setChangeName(changeName);
		}
		
		int result = apService.insertApprovalPlan(document, plan);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "결재 상신 완료");
			return "redirect:approvalList.ap";
		}else {
			model.addAttribute("errorMsg", "결재 상신 과정 중 오류 발생");
			return "common/errorPage";
		}
	}
		
	
		
		
		
		
		
		
		
		
		

}