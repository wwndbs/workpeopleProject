package com.gd.workpp.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.member.model.vo.Member;
import com.gd.workpp.project.model.service.ProjectService;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;
import com.google.gson.Gson;

@Controller
public class AjaxProjectController {
	
	@Autowired
	private ProjectService pService;
	
	// [김은지] 프로젝트 댓글리스트 조회
	@ResponseBody
	@RequestMapping(value="rlist.pr", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int no, ModelAndView mv) {
		ArrayList<ProReply> list = pService.ajaxSelectReplyList(no);
				
		mv.addObject("list", list);
		
		return new Gson().toJson(list);		
	}
	
	// [김은지] 프로젝트 댓글 입력	
	@ResponseBody
	@RequestMapping("rinsert.pr")	
	public String ajaxInsertReply(ProReply pr) {
		int result = pService.ajaxInsertReply(pr);
		return result > 0 ? "success" : "fail";
	}
	
	// [김은지] 메인화면 프로젝트리스트 조회
	@ResponseBody
	@RequestMapping(value="homeList.pr", produces="application/json; charset=UTF-8")
	public String homeProjectList(ModelAndView mv, HttpSession session, Project pp) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		ArrayList<Project> plist = pService.homeProjectList(userNo);
		
		mv.addObject("plist", plist)
		  .addObject("pp", pp)
		  .addObject(plist);
		
		return new Gson().toJson(plist);
	}
	
	// [김은지] 프로젝트 게시판 진행도별로 조회
	/*
	@ResponseBody
	@RequestMapping(value="proBoardList.pr", produces="application/json; charset=UTF-8")
	public String ajaxSelectBoardList(ModelAndView mv, HttpSession session) {
		
	}*/
	
}






























