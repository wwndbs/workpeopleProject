 package com.gd.workpp.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.attendance.model.service.AttendanceService;
import com.gd.workpp.attendance.model.vo.Attendance;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService atService;
	
	// 메인페이지 출근버튼 클릭시 insert
	
	
	// 메인페이지 퇴근버튼 클릭시 update
	
	
	// 출퇴근기록 페이지 / commuteList.jsp
	@RequestMapping("commute.at")
	public String commute() {
		return "attendance/commuteList";
	}
	
	/* 출퇴근기록 페이지 조회
	@RequestMapping("commuteList.at")
	public String commuteList() {
	/*
	// 1. 출퇴근기록 페이지 / commuteList.jsp
	@ResponseBody
	@RequestMapping(value="commuteList.at", produces="application/json; charset=utf-8")
	public String commuteList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
	
		// 오늘 출근시간
		// 1-1. 출퇴근기록/오늘 출근기록 조회
		
		
		// 1-2. 출퇴근기록/오늘 퇴근기록 조회
		
		
		// 1-3. 출퇴근기록/근무현황_이번달 근무일수
		
		
		// 1-4. 출퇴근기록/근무현황_이번달 연장근무시간
		
		
		// 1-5. 출퇴근기록/근무현황_총 근무시간
		
		
		// 1-6. 출퇴근기록/이번달 근태현황_지각(횟수)
		
		
		// 1-7. 출퇴근기록/이번달 근태현황_결근(횟수) 
		
		// 이번달 근무일수
		
		// 1-8. 출퇴근기록/이번달 근태현황_연차(횟수)
		
		// 이번달 연장근무시간
		
				
		// 총 근무시간
		// 1-9. 출퇴근기록/휴가현황_잔여휴가(일수)
		
		
		// 1-10. 출퇴근기록 표_페이징처리 listCount
		
		
		// 1-11. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태		
		ArrayList<Attendance> list = atService.commuteList(pi);
		
	}
	*/
	
	// 출퇴근기록 수정요청 페이지
	// 출퇴근기록 수정요청 / commuteUpdate.jsp
	@RequestMapping("commuteUpdate.at")
	public String commuteUpdate() {
		return "attendance/commuteUpdate";
	}
	
	// 개인근태현황 페이지
	// 2. 출퇴근기록 수정요청 / commuteUpdate.jsp
	/*
	@RequestMapping("commuteUpdateList.at")
	public ModelAndView commuteUpdateList(ModelAndView mv) {

		// 2-1. 이번달 시작일~종료일 출력(조회)
		
		
		// 2-2. 출퇴근기록 표_페이징처리 listCount
		
		
		// 2-3. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태/수정상태
		
		
		// 2-4. 수정요청 update	
		

	} 	 
	*/
			
	// 개인근태현황 / attendanceList.jsp
	@RequestMapping("attendance.at")
	public String attendanceList() {
		return "attendance/attendanceList";
	}
	
	// 휴가관리 페이지
	// 3. 개인근태현황 / attendanceList.jsp
	/*
	@RequestMapping("commuteUpdateList.at")
	public ModelAndView commuteUpdate(ModelAndView mv) {
		
		// 3-1. 출근시간/퇴근시간/연장근무시간/근태상태
		
	}
	*/	

	
	// 연장근무내역 조회
	// 4. 휴가관리 / atHolidayList.jsp
	@RequestMapping("holiday.at")
	public ModelAndView holidayList(ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		// 4-1. 총 휴가 갯수
		int holidayAllCount = atService.holidayAllCount(userNo);
		
		// 4-2. 사용 휴가 갯수
		int holidayUserCount = atService.holidayUserCount(userNo);
		
		// 4-3. 잔여 휴가 갯수
	    int holidayRemainderCount = atService.holidayRemainderCount(userNo);
		
		// 4-4. 휴가사용내역 표_휴가신청일자/휴가종류/사유/휴가사용기간/차감일수/승인내역
		ArrayList<Attendance> list = atService.selectHolidayList(userNo);
		
		mv.addObject("holidayAllCount", holidayAllCount)
		  .addObject("holidayUserCount", holidayUserCount)
		  .addObject("holidayRemainderCount", holidayRemainderCount)
		  .addObject("list", list)
		  .setViewName("attendance/atHolidayList");
		
		System.out.println(holidayAllCount);
		
		return mv;
		
	}
	
	// 연장근무내역조회 / atWorkList.jsp
	@RequestMapping("work.at")
	public String atWorkList() {
		return "attendance/atWorkList";
	}
	
	// 사원별 출퇴근 현황 조회
	// 5. 연장근무내역조회 / atWorkList.jsp
	/*
	@RequestMapping("work.at")
	public ModelAndView atWorkList(ModelAndView mv) {

		// 5-1. 이번달 총 연장근무 시간
	
	
		// 5-2. 이번달 연장근무 가능시간
	
	
		// 5-3. 이번달 연장근무 일수
	
	
		// 5-4. 연장근무내역 표 페이징처리 listCount
	
	
		// 5-5. 연장근무내역 표_연장근무일자/요일/연장근무시간/사유/소요시간/승인내역
		 * 

	}
	*/	
	
	// 사원별 출퇴근 현황 조회 / commuteMemberList.jsp
	@RequestMapping("commuteMember.at")
	public String commuteMemberList() {
		return "attendance/commuteMemberList";
	}
	
	// 출퇴근 기록 수정요청 현황 조회
	// 6. 사원별 출퇴근 현황 조회 / commuteMemberList.jsp
	/*
	@RequestMapping("commuteUpdateList.at")
	public ModelAndView commuteUpdate(ModelAndView mv) {

		// 6-1. 출퇴근현황 표 페이징처리 listCount
	
	
		// 6-2. 출퇴근현황(날짜 클릭시)_사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/비고(연차)
		

	}
	*/	
	
	// 출퇴근 기록 수정요청 현황 / commuteMemberUpdate.jsp
	@RequestMapping("commuteMemUpdate.at")
	public String commuteMemberUpdate() {
		return "attendance/commuteMemberUpdate";
	}
	
	// 사원별 근태현황 조회
	// 7. 출퇴근 기록 수정요청 현황 / commuteMemberUpdate.jsp
	/*
	@RequestMapping("commuteMemberUpdateList.at")
	public ModelAndView commuteMemberUpdateList(ModelAndView mv) {

		// 7-1. 출퇴근 기록 수정요청 현황 표 페이징처리 listCount
	
	
		// 7-2. 출퇴근 기록 수정요청 현황 표_근무날짜/사원번호/부서/사원명/직급/출퇴근시간/수정요청시간/승인내역
		

	}
	*/	
	
	// 사원별 근태현황 조회 / attendanceMemberList.jsp
	@RequestMapping("attendanceMember.at")
	public String attendanceMemberList() {
		return "attendance/attendanceMemberList";
	}
	
	// 사원휴가관리
	// 8. 사원별 근태현황 조회 / attendanceMemberList.jsp
	/*
	@RequestMapping("attendanceMemberList.at")
	public ModelAndView attendanceMemberList(ModelAndView mv) {

		// 8-1. 사원별 근태현황 표 페이징처리 listCount
	
	
		// 8-2. 사원별 근태현황 표_근무날짜/사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/총근무시간/근무상태
	
	
	}
	*/		
	
	// 사원휴가관리 / atHolidayGiveList.jsp
	@RequestMapping("atHolidayGive.at")
	public String atHolidayGiveList() {
		return "attendance/atHolidayGiveList";
	}
	
	// 사원 휴가내역 조회
	// 9. 사원휴가관리 / atHolidayGiveList.jsp
	/*
	@RequestMapping("atHolidayGiveList.at")
	public ModelAndView atHolidayGiveList(ModelAndView mv) {

		// 9-1. 사원휴가관리 표 페이징처리 listCount
		
		
		// 9-2. 사원휴가관리 표_사원번호/부서/사원명/직급/입사일/근속연수/잔여휴가일수
		
		
		// 9-3. 휴가지급 버튼 클릭시 update
		
		
		// 9-4. 보너스 휴가지급 버튼 클릭시 update
		
		
		// 9-5. 휴가회수 버튼 클릭시 update(전사원 휴가 초기화)
		
		
		// 9-6. 표 페이징처리 listCount

	}
	*/	
	
	// 사원 휴가내역 조회 / holidayMemberList.jsp
	@RequestMapping("holidayMemberList.at")
	public String holidayMemberList() {
		return "attendance/holidayMemberList";
	}
	
	// 10. 사원 휴가내역 조회 / holidayMemberList.jsp
	/*
	@RequestMapping("holidayMemberAllList.at")
	public ModelAndView holidayMemberAllList(ModelAndView mv) {

		// 10-1. 휴가내역 표 페이징처리 listCount
	
	
		// 10-2. 휴가내역 표_휴가일/사원번호/부서/사원명/직급/휴가종류/승인내역
	

	}
	*/	
	
}
	