package com.gd.workpp.attendance.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.attendance.model.vo.Attendance;
import com.gd.workpp.common.model.vo.PageInfo;

@Repository
public class AttendanceDao {
	
	// 메인페이지 select
	public Attendance mainAttendance(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.mainAttendance", userNo);
	}
	
	// 출근버튼
	public int insertCommute(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.update("attendanceMapper.insertCommute", userNo);
	}
	
	// 퇴근버튼
	public int updateCommute(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.update("attendanceMapper.updateCommute", userNo);
	}
	
	// 1. 출퇴근기록 / commuteList.jsp
	
	// 1-1. 출퇴근기록/오늘 출근기록 조회
	public Attendance todayStart(SqlSessionTemplate sqlSession, String userNo) {
		System.out.println(userNo);
		return sqlSession.selectOne("attendanceMapper.todayStart", userNo);
	}	
	
	// 1-2. 출퇴근기록/오늘 퇴근기록 조회
	public Attendance todayEnd(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.todayEnd", userNo);
	}		
	
	// 1-3. 출퇴근기록/근무현황_이번달 근무일수
	public int thisMonthWorkDay(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.thisMonthWorkDay", userNo);
	}		
	
	// 1-4. 출퇴근기록/근무현황_이번달 연장근무시간
	public int thisMonthOvertime(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.thisMonthOvertime", userNo);
	}		
	
	// 1-5. 출퇴근기록/근무현황_총 근무시간
	public int thisMonthTotaltime(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.thisMonthTotaltime", userNo);
	}		
	
	// 1-6. 출퇴근기록/이번달 근태현황_지각(횟수)
	public int thisMonthLate(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.thisMonthLate", userNo);
	}		
	
	// 1-7. 출퇴근기록/이번달 근태현황_결근(횟수) 
	public int thisMonthAbsence(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.thisMonthAbsence", userNo);
	}		
	
	// 1-8. 출퇴근기록/이번달 근태현황_연차(횟수)
	public int thisMonthHoliday(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.thisMonthHoliday", userNo);
	}		
	
	// 1-9. 출퇴근기록/휴가현황_잔여휴가(일수)
//	public int thisMonthHolidayRemain(SqlSessionTemplate sqlSession, String userNo) {
//		return sqlSession.selectOne("attendanceMapper.thisMonthHolidayRemain", userNo);
//	}		
	
	// 1-10. 출퇴근기록 표_페이징처리 listCount
	public int commuteListCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.commuteListCount", userNo);
	}
	
	// 1-11. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태
	public ArrayList<Attendance> commuteList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo) {	

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.commuteList", userNo, rowBounds);		
	}	
	// 2. 출퇴근기록 수정요청 / commuteUpdate.jsp
	
	// 2-1. 이번달 시작일~종료일 출력(조회)
	
	
	// 2-2. 출퇴근기록 표_페이징처리 listCount
	
	
	// 2-3. 출퇴근기록 표_근무일자/요일/출근시간/퇴근시간/근무상태/수정상태
	
	
	// 2-4. 수정요청 update
	
	
	/*
	// 3. 개인근태현황 / attendanceList.jsp	
	// 3-1. 출근시간/퇴근시간/연장근무시간/근태상태
	public ArrayList<Attendance> attendanceList(SqlSessionTemplate sqlSession, String userNo) {		
		return (ArrayList)sqlSession.selectList("attendanceMapper.attendanceList", userNo);		
	}	
	*/
	
	// 4. 휴가관리 / atHolidayList.jsp
	
	// 4-1. 총 휴가 갯수
	public int holidayAllCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.holidayAllCount", userNo);
	}
	
	// 4-2. 사용 휴가 갯수
	public int holidayUserCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.holidayUserCount", userNo);
	}
	
	// 4-3. 잔여 휴가 갯수
	public int holidayRemainderCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.holidayRemainderCount", userNo);
	}
	
	// 4-4. 휴가사용내역 표_휴가신청일자/휴가종류/사유/휴가사용기간/차감일수/승인내역	
	public ArrayList<Attendance> selectHolidayList(SqlSessionTemplate sqlSession, String userNo) {		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectHolidayList", userNo);		
	}
	
	// 5. 연장근무내역조회 / atWorkList.jsp
	
	// 5-1. 이번달 총 연장근무 시간
	public int workAllCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.workAllCount", userNo);
	}	
	
	// 5-2. 이번달 연장근무 가능시간
	public int workPossibleCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.workPossibleCount", userNo);
	}	
	
	// 5-3. 이번달 연장근무 일수
	public int workPossibleDay(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("attendanceMapper.workPossibleDay", userNo);
	}	
	
	// 5-4. 연장근무내역 표_연장근무일자/요일/연장근무시간/사유/소요시간/승인내역
	public ArrayList<Attendance> selectWorkList(SqlSessionTemplate sqlSession, String userNo) {		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectWorkList", userNo);		
	}	
	
	// 6. 사원별 출퇴근 현황 조회 / commuteMemberList.jsp
	
	// 6-1. 출퇴근현황 표 페이징처리 listCount
	public int commuteMemberListCount(SqlSessionTemplate sqlSession, String searchDep, String keyword, String datepicker) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);
		map.put("datepicker", datepicker);
		
		return sqlSession.selectOne("attendanceMapper.commuteMemberListCount", map);
	}
	
	// 6-2. 출퇴근현황(날짜 클릭시)_사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/비고(연차)
	public ArrayList<Attendance> commuteMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String searchDep, String keyword, String datepicker) {	
		HashMap<String,Object> map = new HashMap<>();
		map.put("searchDep", searchDep);
		map.put("datepicker", datepicker);

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.commuteMemberList", map, rowBounds);		
	}
	
	// 7. 출퇴근 기록 수정요청 현황 / commuteMemberUpdate.jsp	
	// 7-1. 출퇴근 기록 수정요청 현황 표 페이징처리 listCount
	// 7-2. 출퇴근 기록 수정요청 현황 표_근무날짜/사원번호/부서/사원명/직급/출퇴근시간/수정요청시간/승인내역
	
	
	// 8. 사원별 근태현황 조회 / attendanceMemberList.jsp
	
	// 8-1. 사원별 근태현황 표 페이징처리 listCount
	public int attendanceMemberListCount(SqlSessionTemplate sqlSession, String atCategory, String searchDep,
			 String keyword) {

		HashMap<String,Object> map = new HashMap<>();
		map.put("atCategory", atCategory);
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);
		System.out.println(map);
		return sqlSession.selectOne("attendanceMapper.attendanceMemberListCount", map);
	}
	
	// 8-2. 사원별 근태현황 표_근무날짜/사원번호/부서/사원명/직급/출근시간/퇴근시간/연장근무시간/총근무시간/근무상태
	public ArrayList<Attendance> attendanceMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String atCategory, String searchDep,
			  String keyword) {	
		HashMap<String,Object> map = new HashMap<>();
		map.put("atCategory", atCategory);
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);		
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.attendanceMemberList", map, rowBounds);		
	}	
	
	// 9. 사원휴가관리 / atHolidayGiveList.jsp
	
	// 9-1. 사원휴가관리 표 페이징처리 listCount
	public int atHolidayGiveListCount(SqlSessionTemplate sqlSession, String searchDep, String rank, String keyword) {
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("searchDep", searchDep);
		map.put("rank", rank);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("attendanceMapper.atHolidayGiveListCount", map);
	}
	
	// 9-2. 사원휴가관리 표_사원번호/부서/사원명/직급/입사일/근속연수/잔여휴가일수
	public ArrayList<Attendance> atHolidayGiveList(SqlSessionTemplate sqlSession, PageInfo pi, String searchDep, String rank, String keyword) {	
		HashMap<String,Object> map = new HashMap<>();
		map.put("searchDep", searchDep);
		map.put("rank", rank);
		map.put("keyword", keyword);		
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.atHolidayGiveList", map, rowBounds);		
	}
	
	
	// 9-3. 휴가지급 버튼 클릭시 update
	
	
	// 9-4. 보너스 휴가지급 버튼 클릭시 update
	
	
	// 9-5. 휴가회수 버튼 클릭시 update(전사원 휴가 초기화)
	
	
	// 10. 사원 휴가내역 조회 / holidayMemberList.jsp
	
	// 10-1. 휴가내역 표 페이징처리 listCount
	public int holidayMemberAllListCount(SqlSessionTemplate sqlSession, String hCategory, String searchDep,
										 String keyword) {
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("hCategory", hCategory);
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);
		return sqlSession.selectOne("attendanceMapper.holidayMemberAllListCount", map);
	}
	
	// 10-2. 휴가내역 표_휴가일/사원번호/부서/사원명/직급/휴가종류/승인내역
	public ArrayList<Attendance> holidayMemberAllList(SqlSessionTemplate sqlSession, PageInfo pi, String hCategory, String searchDep,
													  String keyword) {	
		HashMap<String,Object> map = new HashMap<>();
		map.put("hCategory", hCategory);
		map.put("searchDep", searchDep);
		map.put("keyword", keyword);		
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.holidayMemberAllList", map, rowBounds);		
	}
	
	

}
