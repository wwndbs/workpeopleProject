package com.gd.workpp.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.attendance.model.dao.AttendanceDao;

@Service
public class AttendanceServiceImpl {
	
	@Autowired
	private AttendanceDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
