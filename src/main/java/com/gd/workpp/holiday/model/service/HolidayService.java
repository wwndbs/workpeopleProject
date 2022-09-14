package com.gd.workpp.holiday.model.service;

import java.util.ArrayList;

import com.gd.workpp.holiday.model.vo.Schedule;
import com.gd.workpp.holiday.model.vo.Todo;
import com.gd.workpp.member.model.vo.Member;

public interface HolidayService {
	
	ArrayList<Todo> todoListView(Member m);

	int insertTodo(String todoContent, String userNo);
	
	int deleteTodo(int no);
	
	// 장서원 / 1. 개인일정 조회 서비스
	ArrayList<Schedule> selectScheduleList(String userNo);
	
	// 장서원 / 2. 개인일정 등록 서비스
	int insertSchedule(Schedule sc);
	
	// 장서원 / 3. 개인일정 상세조회 서비스
	Schedule selectSchedule(int scheduleNo);
	
	// 장서원 / 4. 개인일정 삭제 서비스
	int deleteSchedule(int scheduleNo);
	
	// 장서원 / 5. 개인일정 수정 서비스
	int updateSchedule(Schedule sc);
	
}
