package com.gd.workpp.project.controller;

import java.io.File;
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

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;
import com.gd.workpp.project.model.service.ProjectService;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.ProMember;
import com.gd.workpp.project.model.vo.Project;

@Controller
public class ProjectController {
		
	@Autowired
	private ProjectService pService;
	
	// [김은지] 내프로젝트 리스트 (로그인한 회원의 부서명 전달받기, sql에도 전달하고 컨트롤러서부터 계속 부서명을 전달해야됨 (jsp는 조건문x))
	// 프로젝트 관리자 승인리스트
	@RequestMapping(value="myProject.pr", produces="application/json; charset=utf-8")
	public ModelAndView myProjectList(ModelAndView mv, HttpSession session, Project pp, ProMember pm) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String depName = m.getDepName();
		String userNo = m.getUserNo();
		
		int projectNo = pm.getProjectNo();
		String proApprove = pm.getProApprove();
				
		ArrayList<Project> list = pService.selectList(depName, userNo);	
		ArrayList<Project> appList = pService.adminProApproveList(userNo);
		Project approveP = pService.adminApproveMember(projectNo);		
		ArrayList<Project> list2 = pService.selectList2(depName);
				
		mv.addObject("list", list)
		  .addObject("depName", depName)
		  .addObject("pp", pp)		  
		  .addObject("appList", appList)
		  .addObject("approveP", approveP)
		  .addObject("pm", pm)		  
		  .addObject("proApprove", proApprove)
		  .addObject("list2", list2)
		  .addObject("userNo", userNo)
		  .addObject(list)
		  .addObject(list2)
		  .setViewName("project/myProjectList");
								
		return mv;
	}
	
	// [김은지] 프로젝트 관리자 승인
	@RequestMapping("approve.pr")
	public String projectApprove(Model model, HttpSession session, ProMember pm) {
		int result = pService.projectApprove(pm);
		
		int projectNo = pm.getProjectNo();
		String userMemNo = pm.getUserMemNo();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "가입이 승인되었습니다.");
			return "redirect:myProject.pr";
		}else {
			model.addAttribute("errorMsg", "승인 실패");
			return "common/errorPage";
		}
	}
	
	// [김은지] 프로젝트 등록
	@RequestMapping("insert.pr")
	public String insertProject(Project p, HttpSession session, Model model) {
		int result = pService.insertProject(p);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:myProject.pr";
		}else {
			model.addAttribute("errorMsg", "등록실패");
			return "common/errorPage";
		}
	}
	
		
	// [김은지] 프로젝트 게시물리스트
	@ResponseBody
	@RequestMapping("proList.pr")
	public ModelAndView projectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, int no, String status, ModelAndView mv, Model model, ProBoard pb) {
		
		int listCount = pService.selectListCount(no, status); //넘어간 status로 sql문에 조건 추가해서갯수 조회
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);		
		ArrayList<ProBoard> list = pService.selectProBoardList(no, status, pi); // 넘어간 status로 sql문에 조건 추가해서 리스트조회
		ArrayList<Project> pList = pService.selectAdmin(no);
		ArrayList<ProMember> pmList = pService.selectMember(no);
				
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .addObject("no", no)
		  .addObject("pb", pb)
		  .addObject("pList", pList)
		  .addObject("pmList", pmList)
		  .addObject(list)
		  .addObject("status", status)
		  .setViewName("project/projectDetailList");
		
		return mv;
	}
	
	// [김은지] 프로젝트 검색기능
	@RequestMapping("search.pr")
	public ModelAndView selectSearchList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, String keyword, String condition, int no) {
		int listCount = pService.selectSearchCount(condition, keyword, no);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<ProBoard> list = pService.selectSearchList(condition, keyword, pi, no);
		ArrayList<Project> pList = pService.selectAdmin(no);
		ArrayList<ProMember> pmList = pService.selectMember(no);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("no", no)
		  .addObject("condition",condition)
		  .addObject("keyword", keyword)
		  .addObject("pList", pList)
		  .addObject("pmList", pmList)
		  .setViewName("project/projectDetailList");		
		
		return mv;
	}
		
	// [김은지] 프로젝트 게시물 등록화면
	@RequestMapping("enrollBoard.pr")
	public String proBoardEnrollForm(int no, Model model) {
		model.addAttribute("no", no);
		
		return "project/proBoardEnrollForm";				
	}
	
	// [김은지] 프로젝트 게시물 수정화면
	@RequestMapping("modifyBoard.pr")
	public ModelAndView proBoardModifyForm(int no, ModelAndView mv) { 
		
		int result = pService.increaseCount(no);
				
		if(result > 0) {
			ProBoard pb = pService.selectDetailProBoard(no);
			mv.addObject("pb", pb)
			  .addObject("no", no)
			  .setViewName("project/proBoardModifyForm");			
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
			
	// [김은지] 프로젝트 게시물 등록
	@RequestMapping("insertBoard.pr")
	public String insertProBoard(ProBoard pb, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) { // 전달된 파일이 있을 경우
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/project_upfiles/");
			
			pb.setAttachOrigin(upfile.getOriginalFilename());
			pb.setAttachModify(saveFilePath);			
		}
		
		int result = pService.insertProBoard(pb);
		
		if(result > 0) { // 성공시
			session.setAttribute("alertMsg", "성공적으로 게시물이 등록되었습니다.");
			return "redirect:proList.pr?no=8";
		}else {
			model.addAttribute("errorMsg", "게시글등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// [김은지] 프로젝트 게시물 상세조회
	@RequestMapping("boardDetail.pr")
	public ModelAndView proBoardDetail(int no, ModelAndView mv) {
		
		int result = pService.increaseCount(no);
								
		if(result > 0) {
			ProBoard pb = pService.selectDetailProBoard(no);
			mv.addObject("pb", pb)
			  .addObject("no", no)
			  .setViewName("project/proBoardDetail");		
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");	
		}
		
		return mv;		

	}	
	
	// [김은지] 프로젝트 게시물 수정
	@RequestMapping("updateBoard.pr")
	public String updateProBoard(ProBoard pb, MultipartFile reupfile, HttpSession session, Model model) {
						
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일이 있을 경우
			if(pb.getAttachOrigin() != null) {
				new File( session.getServletContext().getRealPath(pb.getAttachModify()) ).delete();
			}
			
			// 새로 넘어온 첨부파일 업로드시키기
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/project_upfiles/");
			
			pb.setAttachOrigin(reupfile.getOriginalFilename());
			pb.setAttachModify(saveFilePath);
		}
		
		int result = pService.updateProBoard(pb);
		
		System.out.println(pb);
		System.out.println(result);
				
		if(result > 0) {
			//session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:boardDetail.pr?no=" + pb.getProBoardNo();
		}else {
			model.addAttribute("errorMsg", "게시물 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	// [김은지] 프로젝트 게시물 삭제요청
	@RequestMapping("deleteBoard.pr")
	public String deleteProBoard(int no, String filePath, Model model, HttpSession session) {
		int result = pService.deleteProBoard(no);
		
		if(result > 0) { // 삭제 성공시			
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:proList.pr?no=8";
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// [김은지] 프로젝트 등록 폼
	@RequestMapping("enrollPro.pr")
	public String projectEnrollForm() {
		return "project/projectEnrollForm";
	}
		
	// 전체프로젝트 조회리스트
	@RequestMapping("totalList.pr")
	public ModelAndView selectTotalProject(ModelAndView mv, HttpSession session, Project pp, ProMember pm) {
		
		int projectNo = pm.getProjectNo();
		
		Member m = (Member)session.getAttribute("loginUser");
		String depName = m.getDepName();
		String userNo = m.getUserNo();		
		String userMemNo = m.getUserNo(); 
				
		ArrayList<Project> list = pService.selectTotalProject(depName, userNo);
		int sizeList = list.size();
			
		mv.addObject("list", list)
          .addObject("userMemNo", userMemNo)
          .addObject("projectNo", projectNo)
		  .addObject(list)
		  .addObject("sizeList",sizeList)
		  .setViewName("project/projectTotalList");
		
		return mv;
	}	

	// [김은지] 사용자 프로젝트 가입신청
	@RequestMapping("approveRequest.pr")
	public String proApproveRequest(ProMember pm, HttpSession session, Model model) {
		int result = pService.proApproveRequest(pm);
		int projectNo = pm.getProjectNo();
		String userMemNo = pm.getUserMemNo();
		
		model.addAttribute(projectNo);
		model.addAttribute(userMemNo);
				
		if(result > 0) {
			session.setAttribute("alertMsg", "승인요청되었습니다.");
			return "redirect:totalList.pr";
		}else {
			model.addAttribute("errorMsg", "요청실패");
			return "common/errorpage";
		}
	}
	
}











