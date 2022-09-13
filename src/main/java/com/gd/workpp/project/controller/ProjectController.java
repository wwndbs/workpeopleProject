package com.gd.workpp.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.project.model.service.ProjectService;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	// 내프로젝트 화면띄우기
	@RequestMapping("myProject.pr")
	public String myProjectList() {
		return "project/myProjectList";
	}
	
	// 내프로젝트 리스트
	@RequestMapping("myList.pr")
	public ModelAndView selectList(ModelAndView mv) {
		ArrayList<Project> list = pService.selectList();
		return mv;
	}
	
	// 프로젝트 상세리스트 화면
	@ResponseBody
	@RequestMapping("proList.pr")
	public ModelAndView projectList(int no, ModelAndView mv) {
		ArrayList<ProBoard> list = pService.selectProBoardList(no);
		mv.addObject("list", list)
		  .setViewName("project/projectDetailList");
		return mv;
	}
		
	// 프로젝트 게시물 등록화면
	@RequestMapping("enrollBoard.pr")
	public String proBoardEnrollForm(ProBoard pb, Model model) {
		return "project/proBoardEnrollForm";
		//?no=" + pb.getProjectNo();
	}
	
	// 프로젝트 게시물 등록
	@RequestMapping("insertBoard.pr")
	public String insertProBoard(ProBoard pb, MultipartFile upfile, HttpSession session, Model model) {
		
		int result = 0;
		
		System.out.println(pb);
		System.out.println(upfile);
		/*
		if(!upfile.getOriginalFilename().equals("")) { // 전달된 파일이 있을 경우
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/project_upfiles/");
			
			pb.setAttchOrigin(upfile.getOriginalFilename());
			pb.setAttachModify(saveFilePath);
		}
		
		int result = pService.insertProBoard(pb);
		
		if(result > 0) { // 성공시
			session.setAttribute("alertMsg", "성공적으로 게시물이 등록되었습니다.");
			return "redirect:proList.pr";
		}else {
			model.addAttribute("errorMsg", "게시글등록 실패");
			return "common/errorPage";
		}
		*/
		
		return "";
	}
	
	// 프로젝트 게시물 상세조회
	@RequestMapping("boardDetail.pr")
	public ModelAndView proBoardDetail(int no, ModelAndView mv) {
		
		int result = pService.increaseCount(no);
					
		if(result > 0) {
			ProBoard pb = pService.selectDetailProBoard(no);
			mv.addObject("pb", pb).setViewName("project/proBoardDetail");
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");	
		}
		
		return mv;
		

	}
	
	// 프로젝트 등록 폼
	@RequestMapping("enrollPro.pr")
	public String projectEnrollForm() {
		return "project/projectEnrollForm";
	}
	
	// 전체프로젝트 조회리스트
	@RequestMapping("totalList.pr")
	public String projectTotalList() {
		return "project/projectTotalList";
	}	

}











