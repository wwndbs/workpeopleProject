package com.gd.workpp.attendance.model.service;

import java.util.ArrayList;

import com.gd.workpp.attendance.model.vo.Attendance;
import com.gd.workpp.common.model.vo.PageInfo;

public interface AttendanceService {
	
	// 메인페이지 / 출근버튼 클릭시 insert
	
	
	// 메인페이지 / 퇴근버튼 클릭시 update
	
	
	// 1. 출퇴근기록 / commuteList.jsp
	
	// 1-1. 출퇴근기록/오늘 출근기록 조회
	
	
	// 1-2. 출퇴근기록/오늘 퇴근기록 조회
	
	
	// 1-3. 출퇴근기록/근무현황_이번달 근무일수
	
	
	// 1-4. 출퇴근기록/근무현황_이번달 연장근무시간
	
	
	// 1-5. 출퇴근기록/근무현황_총 근무시간
	
	
	// 1-6. 출퇴근기록/이번달 근태현황_지각(횟수)
	
	
	// 1-7. 출퇴근기록/이번달 근태현황_결근(횟수) 
	
	
	// 1-8. 출퇴근기록/이번달 근태현황_연차(횟수)
	
	
	// 1-9. 출퇴근기록/휴가현황_잔여휴가(일수)
	
	
	// 1-10. 출퇴근기록 표_페이징처리 listCount
	
	
	// 1-11. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태
	
	
	// 2. 출퇴근기록 수정요청 / commuteUpdate.jsp
	
	// 2-1. 이번달 시작일~종료일 출력(조회)
	
	
	// 2-2. 출퇴근기록 표_페이징처리 listCount
	
	
	// 2-3. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태/수정상태
	
	
	// 2-4. 수정요청 update
	
	
	/*
	// 3. 개인근태현황 / attendanceList.jsp
	
	// 3-1. 출근시간/퇴근시간/연장근무시간/근태상태
	ArrayList<Attendance> attendanceList(String userNo);
	*/
	
	// 4. 휴가관리 / atHolidayList.jsp
	
	// 4-1. 총 휴가 갯수
	int holidayAllCount(String userNo);
	
	// 4-2. 사용 휴가 갯수
	int holidayUserCount(String userNo);
	
	// 4-3. 잔여 휴가 갯수
	int holidayRemainderCount(String userNo);
	
	// 4-4. 휴가사용내역 표_휴가신청일자/휴가종류/사유/휴가사용기간/차감일수/승인내역
	ArrayList<Attendance> selectHolidayList(String userNo);
	
	
	// 5. 연장근무내역조회 / atWorkList.jsp
	
	// 5-1. 이번달 총 연장근무 시간
	int workAllCount(String userNo);
	
	// 5-2. 이번달 연장근무 가능시간
	int workPossibleCount(String userNo);
	
	// 5-3. 이번달 연장근무 일수
	int workPossibleDay(String userNo);
	
	// 5-4. 연장근무내역 표_연장근무일자/요일/연장근무시간/사유/소요시간/승인내역
	ArrayList<Attendance> selectWorkList(String userNo);
	
	
	// 6. 사원별 출퇴근 현황 조회 / commuteMemberList.jsp
	
	// 6-1. 출퇴근현황 표 페이징처리 listCount
	int commuteMemberListCount(String searchDep, String keyword);
	
	// 6-2. 출퇴근현황(날짜 클릭시)_사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/비고(연차)
	ArrayList<Attendance> commuteMemberList(PageInfo pi, String searchDep, String keyword);
	
	// 7. 출퇴근 기록 수정요청 현황 / commuteMemberUpdate.jsp	
	// 7-1. 출퇴근 기록 수정요청 현황 표 페이징처리 listCount
	// 7-2. 출퇴근 기록 수정요청 현황 표_근무날짜/사원번호/부서/사원명/직급/출퇴근시간/수정요청시간/승인내역
	
	
	// 8. 사원별 근태현황 조회 / attendanceMemberList.jsp
	
	// 8-1. 사원별 근태현황 표 페이징처리 listCount
	
	
	// 8-2. 사원별 근태현황 표_근무날짜/사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/총근무시간/근무상태
	
	
	// 9. 사원휴가관리 / atHolidayGiveList.jsp
	
	// 9-1. 사원휴가관리 표 페이징처리 listCount
	int atHolidayGiveListCount(String searchDep, String rank, String keyword);
	
	// 9-2. 사원휴가관리 표_사원번호/부서/사원명/직급/입사일/근속연수/잔여휴가일수
	ArrayList<Attendance> atHolidayGiveList(PageInfo pi, String searchDep, String rank, String keyword);
	
	// 9-3. 휴가지급 버튼 클릭시 update
	
	
	// 9-4. 보너스 휴가지급 버튼 클릭시 update
	
	
	// 9-5. 휴가회수 버튼 클릭시 update(전사원 휴가 초기화)
	
	
	// 9-6. 표 페이징처리 listCount
	
	
	// 10. 사원 휴가내역 조회 / holidayMemberList.jsp

	// 10-1. 휴가내역 표 페이징처리 listCount
	int holidayMemberAllListCount(String hCategory, String searchDep, String keyword);	
	
	// 10-2. 휴가내역 표_휴가일/사원번호/부서/사원명/직급/휴가종류/승인내역
	ArrayList<Attendance> holidayMemberAllList(PageInfo pi, String hCategory, String searchDep, String keyword);	
	
	
	
	
	

}