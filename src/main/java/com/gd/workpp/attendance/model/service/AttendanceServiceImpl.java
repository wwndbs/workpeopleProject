 package com.gd.workpp.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.attendance.model.dao.AttendanceDao;
import com.gd.workpp.attendance.model.vo.Attendance;
import com.gd.workpp.common.model.vo.PageInfo;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDao atDao;
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	// 메인페이지 select
	@Override
	public Attendance mainAttendance(String userNo) {
		return atDao.mainAttendance(sqlSession, userNo);
	}
	
	// 출근버튼 insert
	@Override
	public int insertCommute(String userNo) {
		return atDao.insertCommute(sqlSession, userNo);
	}
	
	// 퇴근버튼 update
	@Override
	public int updateCommute(String userNo) {
		return atDao.updateCommute(sqlSession, userNo);
	}
	
	// 1. 출퇴근기록 페이지 / commuteList.jsp
	@Override
	public Attendance todayStart(String userNo) {
		return atDao.todayStart(sqlSession, userNo);
	}

	@Override
	public Attendance todayEnd(String userNo) {
		return atDao.todayEnd(sqlSession, userNo);
	}

	@Override
	public int thisMonthWorkDay(String userNo) {
		return atDao.thisMonthWorkDay(sqlSession, userNo);
	}

	@Override
	public int thisMonthOvertime(String userNo) {
		return atDao.thisMonthOvertime(sqlSession, userNo);
	}

	@Override
	public int thisMonthTotaltime(String userNo) {
		return atDao.thisMonthTotaltime(sqlSession, userNo);
	}

	@Override
	public int thisMonthLate(String userNo) {
		return atDao.thisMonthLate(sqlSession, userNo);
	}

	@Override
	public int thisMonthAbsence(String userNo) {
		return atDao.thisMonthAbsence(sqlSession, userNo);
	}

	@Override
	public int thisMonthHoliday(String userNo) {
		return atDao.thisMonthHoliday(sqlSession, userNo);
	}

//	@Override
//	public int thisMonthHolidayRemain(String userNo) {
//		return atDao.thisMonthHolidayRemain(sqlSession, userNo);
//	}

	@Override
	public int commuteListCount(String userNo) {
		return atDao.commuteListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Attendance> commuteList(PageInfo pi, String userNo) {
		return atDao.commuteList(sqlSession, pi, userNo);
	}
	
	
	/*
	// 3. 개인근태현황 / attendanceList.jsp	
	@Override
	public ArrayList<Attendance> attendanceList(String userNo) {
		return atDao.attendanceList(sqlSession, userNo);
	}
	*/
	
	// 4. 휴가관리 / atHolidayList.jsp
	@Override
	public int holidayAllCount(String userNo) {
		return atDao.holidayAllCount(sqlSession, userNo);
	}
	
	@Override
	public int holidayUserCount(String userNo) {
		return atDao.holidayUserCount(sqlSession, userNo);
	}

	@Override
	public int holidayRemainderCount(String userNo) {
		return atDao.holidayRemainderCount(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Attendance> selectHolidayList(String userNo) {
		return atDao.selectHolidayList(sqlSession, userNo);
	}

	// 5. 연장근무내역조회 / atWorkList.jsp
	@Override
	public int workAllCount(String userNo) {
		return atDao.workAllCount(sqlSession, userNo);
	}

	@Override
	public int workPossibleCount(String userNo) {
		return atDao.workPossibleCount(sqlSession, userNo);
	}

	@Override
	public int workPossibleDay(String userNo) {
		return atDao.workPossibleDay(sqlSession, userNo);
	}

	@Override
	public ArrayList<Attendance> selectWorkList(String userNo) {
		return atDao.selectWorkList(sqlSession, userNo);
	}

	// 6. 사원별 출퇴근 현황 조회 / commuteMemberList.jsp
	@Override
	public int commuteMemberListCount(String searchDep, String keyword) {
		return atDao.commuteMemberListCount(sqlSession, searchDep, keyword);
	}
	
	@Override
	public ArrayList<Attendance> commuteMemberList(PageInfo pi, String searchDep, String keyword) {
		return atDao.commuteMemberList(sqlSession, pi, searchDep, keyword);
	}
	
	// 8. 사원별 근태현황 조회 / attendanceMemberList.jsp
	@Override
	public int attendanceMemberListCount(String atCategory, String searchDep, String keyword) {
		return atDao.attendanceMemberListCount(sqlSession, atCategory, searchDep, keyword);
	}

	@Override
	public ArrayList<Attendance> attendanceMemberList(PageInfo pi, String atCategory, String searchDep, String keyword) {
		return atDao.attendanceMemberList(sqlSession, pi, atCategory, searchDep, keyword);
	}
	
	
	// 9. 사원휴가관리 / atHolidayGiveList.jsp
	@Override
	public int atHolidayGiveListCount(String searchDep, String rank, String keyword) {
		return atDao.atHolidayGiveListCount(sqlSession, searchDep, rank, keyword);
	}

	@Override
	public ArrayList<Attendance> atHolidayGiveList(PageInfo pi, String searchDep, String rank, String keyword) {
		return atDao.atHolidayGiveList(sqlSession, pi, searchDep, rank, keyword);
	}

	// 10. 사원 휴가내역 조회 / holidayMemberList.jsp
	@Override
	public int holidayMemberAllListCount(String hCategory, String searchDep,
			String keyword) {
		return atDao.holidayMemberAllListCount(sqlSession, hCategory, searchDep, keyword);
	}

	@Override
	public ArrayList<Attendance> holidayMemberAllList(PageInfo pi, String hCategory,
			String searchDep, String keyword) {
		return atDao.holidayMemberAllList(sqlSession, pi, hCategory, searchDep, keyword);
	}






		
	

	
	
	
	
	

}