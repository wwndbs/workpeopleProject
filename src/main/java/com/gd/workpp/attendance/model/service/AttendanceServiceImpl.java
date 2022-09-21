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
	
	
	
	
	@Override
	public int holidayAllCount(String userNo) {
		return 0;
	}
	@Override
	public int holidayUserCount(String userNo) {
		return 0;
	}
	@Override
	public int holidayRemainderCount(String userNo) {
		return 0;
	}
	@Override
	public ArrayList<Attendance> selectHolidayList(String userNo) {
		return null;
	}

		
	

	
	
	
	
	

}