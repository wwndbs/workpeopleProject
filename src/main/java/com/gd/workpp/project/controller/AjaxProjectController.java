package com.gd.workpp.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.project.model.service.ProjectService;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;
import com.google.gson.Gson;

@Controller
public class AjaxProjectController {
	
	@Autowired
	private ProjectService pService;
	
	@ResponseBody
	@RequestMapping(value="rlist.pr", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int no, ModelAndView mv) {
		ArrayList<ProReply> list = pService.ajaxSelectReplyList(no);
				
		mv.addObject("list", list);
		
		return new Gson().toJson(list);		
	}
	
	@ResponseBody
	@RequestMapping("rinsert.pr")	
	public String ajaxInsertReply(ProReply pr) {
		int result = pService.ajaxInsertReply(pr);
		return result > 0 ? "success" : "fail";
	}
	
}
