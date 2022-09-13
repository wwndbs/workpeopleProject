package com.gd.workpp.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String proBoardEnrollForm() {
		return "project/proBoardEnrollForm";
	}
	
	// 프로젝트 게시물 상세조회
	@RequestMapping("boardDetail.pr")
	public String proBoardDetail() {
		return "project/proBoardDetail";
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
