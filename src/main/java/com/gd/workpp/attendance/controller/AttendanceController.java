 package com.gd.workpp.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.attendance.model.service.AttendanceService;
import com.gd.workpp.attendance.model.vo.Attendance;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService atService;
	
	@RequestMapping("main.wp")
	public ModelAndView mainAttendance(ModelAndView mv, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		Attendance mainAttendance = atService.mainAttendance(userNo);
		
		mv.addObject("atStart", mainAttendance.getAtStart())
		  .addObject("atEnd", mainAttendance.getAtEnd())
		  .setViewName("main");		

		return mv;
		
		
	}

	// 메인페이지 출근버튼 클릭시 insert
	@RequestMapping("commuteIn.at")
	public String insertCommute(String userNo, HttpSession session, Model model) {
		
		int result = atService.insertCommute(userNo);
		
		if(result > 0 ) { // 성공 => alert, 메인페이지
			session.setAttribute("alertMsg", "출근 등록이 완료되었습니다.");
			return "redirect:main.wp";			
		}else { // 실패 => 에러문구, 에러페이지
			return "common/errorPage";
		}
		
	}
	
	
	// 메인페이지 퇴근버튼 클릭시 update
	@RequestMapping("commuteOut.at")
	public String updateCommute(String userNo, HttpSession session, Model model) {
		
		int result = atService.updateCommute(userNo);
		
		if(result > 0 ) { // 성공 => alert, 메인페이지
			session.setAttribute("alertMsg", "퇴근 등록이 완료되었습니다.");
			return "redirect:main.wp";			
		}else { // 실패 => 에러문구, 에러페이지
			return "common/errorPage";
		}
	}
	
	
	// 1. 출퇴근기록 페이지 / commuteList.jsp
	/*
	@RequestMapping("commute.at")
	public String commute() {
		return "attendance/commuteList";
	}
	*/
	
	@RequestMapping("commuteList.at")
	public ModelAndView commuteList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		// 1-1. 출퇴근기록/오늘 출근기록 조회
		Attendance todayStart = atService.todayStart(userNo);
		
		// 1-2. 출퇴근기록/오늘 퇴근기록 조회
		Attendance todayEnd = atService.todayEnd(userNo);
		
		// 1-3. 출퇴근기록/근무현황_이번달 근무일수
		int thisMonthWorkDay = atService.thisMonthWorkDay(userNo);
		
		// 1-4. 출퇴근기록/근무현황_이번달 연장근무시간
		int thisMonthOvertime = atService.thisMonthOvertime(userNo);
		
		// 1-5. 출퇴근기록/근무현황_총 근무시간
		int thisMonthTotaltime = atService.thisMonthTotaltime(userNo);
		
		// 1-6. 출퇴근기록/이번달 근태현황_지각(횟수)
		int thisMonthLate = atService.thisMonthLate(userNo);
		
		// 1-7. 출퇴근기록/이번달 근태현황_결근(횟수) 
		int thisMonthAbsence = atService.thisMonthAbsence(userNo);
		
		// 1-8. 출퇴근기록/이번달 근태현황_연차(횟수)
		int thisMonthHoliday = atService.thisMonthHoliday(userNo);		
		
		// 1-9. 출퇴근기록/휴가현황_잔여휴가(일수)
		//int thisMonthHolidayRemain = atService.thisMonthHolidayRemain(userNo);
		
		// 1-10. 출퇴근기록 표_페이징처리 listCount
		int listCount = atService.commuteListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		// 1-11. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태		
		ArrayList<Attendance> list = atService.commuteList(pi, userNo);
		
		mv.addObject("todayStart", todayStart.getAtStart())
		  .addObject("todayEnd", todayEnd.getAtEnd())
		  .addObject("thisMonthWorkDay", thisMonthWorkDay)
		  .addObject("thisMonthOvertime", thisMonthOvertime)
		  .addObject("thisMonthTotaltime", thisMonthTotaltime)
		  .addObject("thisMonthLate", thisMonthLate)
		  .addObject("thisMonthAbsence", thisMonthAbsence)
		  .addObject("thisMonthHoliday", thisMonthHoliday)
		 // .addObject("thisMonthHolidayRemain", thisMonthHolidayRemain)
		  .addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("attendance/commuteList");
		

		return mv;
		
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="commuteList.at", produces="application/json; charset=utf-8")
	public String commuteList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();
		
		System.out.println(userNo);
		
		// 1-1. 출퇴근기록/오늘 출근기록 조회
		Attendance todayStart = atService.todayStart(userNo);
		
		// 1-2. 출퇴근기록/오늘 퇴근기록 조회
		Attendance todayEnd = atService.todayEnd(userNo);
		
		// 1-3. 출퇴근기록/근무현황_이번달 근무일수
		int thisMonthWorkDay = atService.thisMonthWorkDay(userNo);
		
		// 1-4. 출퇴근기록/근무현황_이번달 연장근무시간
		int thisMonthOvertime = atService.thisMonthOvertime(userNo);
		
		// 1-5. 출퇴근기록/근무현황_총 근무시간
		int thisMonthTotaltime = atService.thisMonthTotaltime(userNo);
		
		// 1-6. 출퇴근기록/이번달 근태현황_지각(횟수)
		int thisMonthLate = atService.thisMonthLate(userNo);
		
		// 1-7. 출퇴근기록/이번달 근태현황_결근(횟수) 
		int thisMonthAbsence = atService.thisMonthAbsence(userNo);
		
		// 1-8. 출퇴근기록/이번달 근태현황_연차(횟수)
		int thisMonthHoliday = atService.thisMonthHoliday(userNo);		
		
		// 1-9. 출퇴근기록/휴가현황_잔여휴가(일수)
		int thisMonthHolidayRemain = atService.thisMonthHolidayRemain(userNo);
		
		// 1-10. 출퇴근기록 표_페이징처리 listCount
		int listCount = atService.commuteListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		// 1-11. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태		
		ArrayList<Attendance> list = atService.commuteList(pi, userNo);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("todayStart", todayStart);
		map.put("todayEnd", todayEnd);
		map.put("thisMonthWorkDay", thisMonthWorkDay);
		map.put("thisMonthOvertime", thisMonthOvertime);
		map.put("thisMonthTotaltime", thisMonthTotaltime);
		map.put("thisMonthLate", thisMonthLate);
		map.put("thisMonthAbsence", thisMonthAbsence);
		map.put("thisMonthHoliday", thisMonthHoliday);
		map.put("thisMonthHolidayRemain", thisMonthHolidayRemain);
		map.put("list", list);
		map.put("pi", pi);
		map.put("userNo", userNo);
		
	    return new Gson().toJson(map);
		
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
			
	// 3. 개인근태현황 / attendanceList.jsp
	/*
	@RequestMapping("attendance.at")
	public String attendanceView() {
		return "attendance/attendanceList";
	}
	
	@ResponseBody
	@RequestMapping(value="attendanceList.at", produces="application/json; charset=utf-8")
	public String attendanceList(String userNo) {
		ArrayList<Attendance> list = atService.attendanceList(userNo);
		return new Gson().toJson(list);
	}	
	*/
	
	// 휴가내역 조회
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
		
		System.out.println();
		
		return mv;
		
	}
	
	// 5. 연장근무내역조회 / atWorkList.jsp
	@RequestMapping("work.at")
	public ModelAndView atWorkList(ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String userNo = m.getUserNo();

		// 5-1. 이번달 총 연장근무 시간 
		int workAllCount = atService.workAllCount(userNo);
	
		// 5-2. 이번달 연장근무 가능시간
		int workPossibleCount = atService.workPossibleCount(userNo);
	
		// 5-3. 이번달 연장근무 일수
		int workPossibleDay = atService.workPossibleDay(userNo);
	
		// 5-4. 연장근무내역 표_연장근무일자/요일/연장근무시간/사유/소요시간/승인내역
		ArrayList<Attendance> list = atService.selectWorkList(userNo);
		
		mv.addObject("workAllCount", workAllCount)
		  .addObject("workPossibleCount", workPossibleCount)
		  .addObject("workPossibleDay", workPossibleDay)
		  .addObject("list", list)
		  .setViewName("attendance/atWorkList");
		
		return mv;

	}
		
	// 6. 사원별 출퇴근 현황 조회 / commuteMemberList.jsp
	@RequestMapping("commuteMember.at")
	public String commuteMember() {
		return "attendance/commuteMemberList";
	}	
	
	@ResponseBody
	@RequestMapping(value="commuteMemberList.at", produces="application/json; charset=utf-8")
	public String commuteMemberList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String searchDep, String keyword, String datepicker) {	
		
		int listCount = atService.commuteMemberListCount(searchDep, keyword, datepicker);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);		
		ArrayList<Attendance> list = atService.commuteMemberList(pi, searchDep, keyword, datepicker);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);
		map.put("datepicker", datepicker);
		
		System.out.println(datepicker);
		
	    return new Gson().toJson(map);

	}
	
	
	// 출퇴근 기록 수정요청 현황 조회 / commuteUpdate.jsp
	/*
	@RequestMapping("commuteUpdateList.at")
	public ModelAndView commuteUpdate(ModelAndView mv) {

		// 6-1. 출퇴근현황 표 페이징처리 listCount
	
	
		// 6-2. 출퇴근현황(날짜 클릭시)_사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/비고(연차)
		

	}
	*/	
	
	/*
	// 출퇴근 기록 수정요청 현황 / commuteMemberUpdate.jsp
	@RequestMapping("commuteMemUpdate.at")
	public String commuteMemberUpdate() {
		return "attendance/commuteMemberUpdate";
	}
	*/
	
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

	// 8. 사원별 근태현황 조회 / attendanceMemberList.jsp

	@ResponseBody
	@RequestMapping(value="attendanceMemberList.at", produces="application/json; charset=utf-8")
	public String attendanceMemberList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String atCategory, String searchDep, String keyword) {	
		
		// 8-1. 사원별 근태현황 표 페이징처리 listCount
		int listCount = atService. attendanceMemberListCount(atCategory, searchDep, keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);	
		
		// 8-2. 사원별 근태현황 표_근무날짜/사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/총근무시간/근무상태
		ArrayList<Attendance> list = atService. attendanceMemberList(pi, atCategory, searchDep, keyword);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		map.put("atCategory", atCategory);
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);
		
	    return new Gson().toJson(map);

	}		
	
	
	// 사원휴가관리 / atHolidayGiveList.jsp
	@RequestMapping("atHolidayGive.at")
	public String atHolidayGiveList() {
		return "attendance/atHolidayGiveList";
	}
	
	// 9. 사원휴가관리 / atHolidayGiveList.jsp
	@ResponseBody
	@RequestMapping(value="atHolidayGiveList.at", produces="application/json; charset=utf-8")
	public String atHolidayGiveList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String searchDep, String rank, String keyword) {	
		
		int listCount = atService.atHolidayGiveListCount(searchDep, rank, keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);		
		ArrayList<Attendance> list = atService.atHolidayGiveList(pi, searchDep, rank, keyword);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		map.put("searchDep", searchDep);
		map.put("rank", rank);
		map.put("keyword", keyword);
		
	    return new Gson().toJson(map);

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
	
	@ResponseBody
	@RequestMapping(value="holidayMemberAllList.at", produces="application/json; charset=utf-8")
	public String holidayMemberAllList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String hCategory, String searchDep, String keyword) {	
		
		// 10-1. 휴가내역 표 페이징처리 listCount
		int listCount = atService.holidayMemberAllListCount(hCategory, searchDep, keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);	
		
		// 10-2. 휴가내역 표_휴가일/사원번호/부서/사원명/직급/휴가종류/승인내역
		ArrayList<Attendance> list = atService.holidayMemberAllList(pi, hCategory, searchDep, keyword);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		map.put("hCategory", hCategory);
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);
		
	    return new Gson().toJson(map);

	}

		
	
	
		

	
}
	