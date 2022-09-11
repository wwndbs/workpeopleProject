package com.gd.workpp.holiday.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.holiday.model.dao.HolidayDao;
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
}
