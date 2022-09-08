package com.gd.workpp.holiday.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.holiday.model.vo.Todo;
import com.gd.workpp.member.model.vo.Member;

@Repository
public class HolidayDao {

	public ArrayList<Todo> todoListView(SqlSessionTemplate sqlSession, Member m){
		return (ArrayList)sqlSession.selectList("holidayMapper.todoListView", m);
	}
	
	public int insertTodo(SqlSessionTemplate sqlSession, String todoContent, String userNo) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("todoContent", todoContent);
		map.put("userNo", userNo);
		return sqlSession.insert("holidayMapper.insertTodo", map);
	}
}
