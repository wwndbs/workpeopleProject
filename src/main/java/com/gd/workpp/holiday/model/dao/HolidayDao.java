package com.gd.workpp.holiday.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.holiday.model.vo.Schedule;
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
	
	public int deleteTodo(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.delete("holidayMapper.deleteTodo", no);
	}
	
	
	public ArrayList<Schedule> selectScheduleList(SqlSessionTemplate sqlSession, String userNo){
		return (ArrayList)sqlSession.selectList("holidayMapper.selectScheduleList", userNo);
	}
	/*
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		return sqlSession.insert("holidayMapper.insertSchedule", sc);
	}
	
	public Schedule selectSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		return sqlSession.selectOne("holidayMapper.selectSchedule", scheduleNo);		
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		return sqlSession.update("holidayMapper.deleteSchedule", scheduleNo);		
	}
	
	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		return sqlSession.update("holidayMapper.updateSchedule", sc);		
	}
	
	*/
	
	
	
	
	
	
}
