package com.gd.workpp.holiday.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.holiday.model.service.HolidayService;

@Controller
public class HolidayController {
	
	@Autowired
	private HolidayService hService;
	
	/**
	 * author : 최영헌
	 * 할 일 페이지 이동 요청을 처리해주는 메소드
	 */
	@RequestMapping("todoList.td")
	public String todoListPage() {
		return "holiday/todoList";
	}
	
	/**
	 * author : 최영헌
	 * 할 일 추가 요청을 처리해주는 메소드
	 * @param todoContent : 사용자가 입력한 할 일
	 * @param userNo : 로그인한 사용자 번호
	 */
	@RequestMapping("insertTodo.td")
	public ModelAndView insertTodo(String todoContent, String userNo, ModelAndView mv) {
		int result = hService.insertTodo(todoContent, userNo);
		if(result > 0) {
			mv.setViewName("holiday/todoList");
		}else {
			
		}
		return mv;
	}
	
	/**
	 * author : 최영헌
	 * 할 일 삭제 요청을 처리해주는 메소드
	 * @param no : 삭제 하고자하는 할 일 번호
	 */
	@RequestMapping("deleteTodo.td")
	public String deleteTodo(int no, Model model, HttpSession session) {
		int result = hService.deleteTodo(no);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "할 일을 삭제 했습니다.");
			return "redirect:todoList.td";
		}else {
			model.addAttribute("errorMsg", "할 일 삭제를 실패 했습니다.");
			return "common/errorPage";
		}
	}
}
