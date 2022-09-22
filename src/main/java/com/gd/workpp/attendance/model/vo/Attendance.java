package com.gd.workpp.attendance.model.vo;

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
public class Attendance {

	private int atNo;
	private String userNo;
	private String atStart;
	private String atEnd;
	private String atOvertime;
	private String atTotaltime;
	private String atDate;
	private String atDay;
	private String atStatus;
	private String atLate;
	private String userName;
	private String atModifyStart;
	private String atModifyEnd;
	private String atModifyStatus;
	private String atModifyDate;
	
	// 휴가사용내역
	private String annualGive;
	private String annualDate;
	
	private String createDate;
	private String documentContent;
	
	
	private String vacationCategory;
	private String vacationDate;
	private int vacationCount;
	private String apStatus;
	
	private String depName;
	private String jobName;
	
}
