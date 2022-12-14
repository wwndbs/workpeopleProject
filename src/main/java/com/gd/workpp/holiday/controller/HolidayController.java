package com.gd.workpp.holiday.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.holiday.model.service.HolidayService;
import com.gd.workpp.holiday.model.vo.Schedule;
import com.google.gson.Gson;

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
	public String insertTodo(String todoContent, String userNo, Model model, HttpSession session) {
		int result = hService.insertTodo(todoContent, userNo);
		if(result > 0) {
			session.setAttribute("toastMsg", "할 일을 추가 했습니다.");
			return "redirect:todoList.td";
		}else {
			model.addAttribute("errorMsg", "할 일 삭제를 실패 했습니다.");
			return "common/errorPage";
		}
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
			session.setAttribute("toastMsg", "할 일을 삭제 했습니다.");
			return "redirect:todoList.td";
		}else {
			model.addAttribute("errorMsg", "할 일 삭제를 실패 했습니다.");
			return "common/errorPage";
		}
	}
	
	/**
	 * Author : 최영헌
	 * 할 일 상태 변경 요청을 처리해주는 메소드
	 * @param todoNo : 상태를 변경할 할 일 번호
	 * @param section : 할 일 상태(1:할일, 2:진행중, 3:완료)
	 */
	@RequestMapping("updateTodoStatus.td")
	public String updateTodoStatus(int todoNo, int section, Model model) {
		int result = hService.updateTodoStatus(todoNo, section);
		
		if(result > 0) {
			return "redirect:todoList.td";
		}else {
			model.addAttribute("errorMsg", "할 일 상태 변경을 실패 했습니다.");
			return "common/errorPage";
		}
	}
	
	// 장서원 / 일정조회 페이지
	/*
	@RequestMapping("schedule.sc")
	public ModelAndView selectScheduleList(ModelAndView mv, String userNo) {
		ArrayList<Schedule> list = hService.selectScheduleList(userNo);
		
		mv.addObject("list", list)
		  .setViewName("holiday/scheduleList");
		
		System.out.println(list);
		
		return mv;
	}
	*/
	
	@RequestMapping("schedule.sc")
	public String ScheduleList() {
		return "holiday/scheduleList";
	}
	
	@ResponseBody
	@RequestMapping(value="scheduleList.sc", produces="application/json; charset=utf-8")
	public String selectScheduleList(String userNo) {
		ArrayList<Schedule> list = hService.selectScheduleList(userNo);
		return new Gson().toJson(list);
	}	
	
	@RequestMapping("scheduleEnrollForm.sc")
	public String enrollScheduleForm() {
		return "holiday/scheduleList";
	}
	/*
	@RequestMapping("")
	public String insertSchedule(Schedule sc, HttpSession session, Model model) {
		
		int result = hService.insertShedule(sc);
		
		if(result > 0) { // 등록 성공
			session.setAttribute("alertMsg", "일정이 등록되었습니다.");
			return "redirect:";
		}else { // 등록 실패
			model.addAttribute("errorMsg", "일정 등록 실패");
			return "common/errorPage";			
		}
		
	}
	
	@RequestMapping("")
	public ModelAndView selectSchedule(int scheduleNo, ModelAndView mv) {
		Schedule sc = hService.selectShedule(scheduleNo);
		mv.addObject("sc", sc).setViewName("holiday/");
		return mv;
	}
	
	@RequestMapping("")
	public String deleteSchedule(int scheduleNo, Model model, HttpSession session) {
		
		int result = hService.deleteSchedule(scheduleNo);
		
		if(result > 0) { // 삭제 성공
			session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
			return "redirect:";
		}else { // 삭제 실패 
			model.addAttribute("errorMsg", "일정 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("")
	public String updateScheduleForm(int scheduleNo, Model model) {
		model.addAttribute("sc", hService.selectSchedule(scheduleNo));
		return "holiday/";
	}
	
	@RequestMapping("")
	public String updateSchedule(Schedule sc, HttpSession session, Model model) {
		int result = hService.updateSchedule(sc);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "일정이 수정되었습니다.");
			return "redirect:"			
		}else {
			model.addAttribute("errorMsg", "일정 수정 실패");
			return "common/errorPage";
		}
	}
	
	*/
	
	
	
	
	
	
	
}
