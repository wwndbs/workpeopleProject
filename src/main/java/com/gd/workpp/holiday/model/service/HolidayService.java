package com.gd.workpp.holiday.model.service;

import java.util.ArrayList;

import com.gd.workpp.holiday.model.vo.Todo;
import com.gd.workpp.member.model.vo.Member;

public interface HolidayService {
	
	ArrayList<Todo> todoListView(Member m);

	int insertTodo(String todoContent, String userNo);
}
