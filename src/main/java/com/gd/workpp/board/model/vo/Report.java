package com.gd.workpp.board.model.vo;

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
public class Report {

	private int reportCode;
	private int reportType;
	private int reportRefNo;
	private String userNo;
	private String reportDate;
	private String reportContent;
	private String status;
	private String handlingDate;
	private String userName;
	private String jobName;
	
}
