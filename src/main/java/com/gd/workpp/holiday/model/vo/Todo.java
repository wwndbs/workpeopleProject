package com.gd.workpp.holiday.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Todo {
	private int todoNo;
	private String userNo;
	private String todoContent;
	private String createDate;
	private String modifyDate;
	private String status;
}
