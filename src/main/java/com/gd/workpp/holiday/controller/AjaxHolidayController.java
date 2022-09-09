package com.gd.workpp.holiday.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.workpp.holiday.model.service.HolidayService;
import com.gd.workpp.holiday.model.vo.Todo;
import com.gd.workpp.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class AjaxHolidayController {

	@Autowired
	private HolidayService hService;
	
	/**
	 * author : 최영헌
	 * 로그인한 사용자의 할 일 목록 조회 요청을 처리해주는 메소드
	 */
	@ResponseBody
	@RequestMapping(value="todoListView.td", produces="application/json; charset=UTF-8")
	public String todoListView(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Todo> list = hService.todoListView(m);
		return new Gson().toJson(list);
	}
}
