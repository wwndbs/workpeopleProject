package com.gd.workpp.approval.model.vo;

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
public class Document {
	private int documentNo;
	private String userNo;
	private String documentCategory;
	private String documentForm;
	private String documentTitle;
	private String createDate;
	private String documentContent;
	private int progress;
	private int status;
	private String message;
	private String originName;
	private String changeName;
	private int approvalCount;
	
	// plan
	private String planStart;
	
	// absence
	private String absenceDate;
	
	// work
	private String workStart;
	private String workEnd;
	private String workDate;
	private String workUse;
	
	// vacation
	private String vacationCategory;
	private String vacationStart;
	private String vacationEnd;
	private int vacationCount;
}