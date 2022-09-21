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
	private AttendanceDao aDao;
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	
	// 4. 휴가관리 / atHolidayList.jsp
	@Override
	public int holidayAllCount(String userNo) {
		return aDao.holidayAllCount(sqlSession, userNo);
	}
	
	@Override
	public int holidayUserCount(String userNo) {
		return aDao.holidayUserCount(sqlSession, userNo);
	}

	@Override
	public int holidayRemainderCount(String userNo) {
		return aDao.holidayRemainderCount(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Attendance> selectHolidayList(String userNo) {
		return aDao.selectHolidayList(sqlSession, userNo);
	}

		
	

	
	
	
	
	

}