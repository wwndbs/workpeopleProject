package com.gd.workpp.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.workpp.attendance.model.service.AttendanceServiceImpl;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceServiceImpl atService;
	
	// 메인페이지 출근버튼 클릭시 insert
	
	
	// 메인페이지 퇴근버튼 클릭시 update
	
	
	// 출퇴근기록 페이지
	@RequestMapping("commute.at")
	public String commute() {
		return "attendance/commuteList";
	}
	
	/* 출퇴근기록 페이지 조회
	@RequestMapping("commuteList.at")
	public String commuteList() {
	
		// 오늘 출근시간
		
		
		// 이번달 근무일수
		
		
		// 이번달 연장근무시간
		
				
		// 총 근무시간
		
		
		
	}
	*/
	
	// 출퇴근기록 수정요청 페이지
	@RequestMapping("commuteUpdate.at")
	public String commuteUpdate() {
		return "attendance/commuteUpdate";
	}
	
	// 개인근태현황 페이지
	@RequestMapping("attendance.at")
	public String attendanceList() {
		return "attendance/attendanceList";
	}
	
	// 휴가관리 페이지
	@RequestMapping("holiday.at")
	public String atHolidayList() {
		return "attendance/atHolidayList";
	}
	
	// 연장근무내역 조회
	@RequestMapping("work.at")
	public String atWorkList() {
		return "attendance/atWorkList";
	}
	
	// 사원별 출퇴근 현황 조회
	@RequestMapping("commuteMember.at")
	public String commuteMemberList() {
		return "attendance/commuteMemberList";
	}
	
	// 출퇴근 기록 수정요청 현황 조회
	@RequestMapping("commuteMemUpdate.at")
	public String commuteMemberUpdate() {
		return "attendance/commuteMemberUpdate";
	}
	
	// 사원별 근태현황 조회
	@RequestMapping("attendanceMember.at")
	public String attendanceMemberList() {
		return "attendance/attendanceMemberList";
	}
	
	// 사원휴가관리
	@RequestMapping("atHolidayGive.at")
	public String atHolidayGiveList() {
		return "attendance/atHolidayGiveList";
	}
	
	// 사원 휴가내역 조회
	@RequestMapping("holidayMemberList.at")
	public String holidayMemberList() {
		return "attendance/holidayMemberList";
	}
	
	
	

}
