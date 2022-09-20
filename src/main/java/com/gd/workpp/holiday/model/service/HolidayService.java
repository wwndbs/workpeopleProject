package com.gd.workpp.holiday.model.service;

import java.util.ArrayList;

import com.gd.workpp.holiday.model.vo.Schedule;
import com.gd.workpp.holiday.model.vo.Todo;
import com.gd.workpp.member.model.vo.Member;

public interface HolidayService {
	
	// 할 일 조회
	ArrayList<Todo> todoListView(Member m);

	// 할 일 등록
	int insertTodo(String todoContent, String userNo);
	
	// 할 일 삭제
	int deleteTodo(int no);
	
	// 할 일 상태 변경
	int updateTodoStatus(int todoNo, int section);
	
	// 장서원 / 일정 조회 서비스
	ArrayList<Schedule> selectScheduleList(String userNo);
	
	// 장서원 / 일정 등록 서비스
	int insertSchedule(Schedule sc);
	
	// 장서원 / 일정 상세조회 서비스
	Schedule selectSchedule(int scheduleNo);
	
	// 장서원 / 일정 삭제 서비스
	int deleteSchedule(int scheduleNo);
	
	// 장서원 / 일정 수정 서비스
	int updateSchedule(Schedule sc);
	
}
