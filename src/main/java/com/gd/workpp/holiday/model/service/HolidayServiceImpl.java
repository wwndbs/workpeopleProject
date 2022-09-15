package com.gd.workpp.holiday.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.holiday.model.dao.HolidayDao;
import com.gd.workpp.holiday.model.vo.Schedule;
import com.gd.workpp.holiday.model.vo.Todo;
import com.gd.workpp.member.model.vo.Member;

@Service
public class HolidayServiceImpl implements HolidayService {

	@Autowired
	private HolidayDao hDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Todo> todoListView(Member m){
		return hDao.todoListView(sqlSession, m);
	}

	@Override
	public int insertTodo(String todoContent, String userNo) {
		return hDao.insertTodo(sqlSession, todoContent, userNo);
	}

	@Override
	public int deleteTodo(int no) {
		return hDao.deleteTodo(sqlSession, no);
	}

	@Override
	public ArrayList<Schedule> selectScheduleList(String userNo) {
		return hDao.selectScheduleList(sqlSession, userNo);
	}

	@Override
	public int insertSchedule(Schedule sc) {
		// return hDao.insertSchedule(sqlSession, sc);
		return 0;
	}

	@Override
	public Schedule selectSchedule(int scheduleNo) {
		// return hDao.selectSchedule(sqlSession, scheduleNo);
		return null;
	}

	@Override
	public int deleteSchedule(int scheduleNo) {
		// return hDao.deleteSchedule(sqlSession, scheduleNo);
		return 0;
	}

	@Override
	public int updateSchedule(Schedule sc) {
		// return hDao.updateSchedule(sqlSession, sc);
		return 0;
	}
}
