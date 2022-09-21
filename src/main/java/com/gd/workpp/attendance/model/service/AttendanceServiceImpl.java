 package com.gd.workpp.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.attendance.model.dao.AttendanceDao;
import com.gd.workpp.attendance.model.vo.Attendance;

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


		
	

	
	
	
	
	

}