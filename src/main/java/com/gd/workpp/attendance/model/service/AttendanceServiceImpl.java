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
	
	// 9. 사원휴가관리 / atHolidayGiveList.jsp
	@Override
	public int atHolidayGiveListCount(String searchDep, String rank, String keyword) {
		return atDao.atHolidayGiveListCount(sqlSession, searchDep, rank, keyword);
	}

	@Override
	public ArrayList<Attendance> atHolidayGiveList(PageInfo pi, String searchDep, String rank, String keyword) {
		return atDao.atHolidayGiveList(sqlSession, pi, searchDep, rank, keyword);
	}
	


		
	

	
	
	
	
	

}