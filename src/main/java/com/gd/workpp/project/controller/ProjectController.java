package com.gd.workpp.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.workpp.project.model.vo.Project;

@Controller
public class ProjectController {
	
	// 내프로젝트 화면띄우기
	@RequestMapping("myProject.pr")
	public String myProjectList() {
		return "project/myProjectList";
	}
	
	// 프로젝트 상세리스트 화면
	@RequestMapping("proList.pr")
	public String projectList() {
		return "project/projectDetailList";
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
