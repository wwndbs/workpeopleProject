package com.gd.workpp.project.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProBoard {
	
	private String proBoardNo;
	private int projectNo;
	private String boardWriterNo;
	private int proBoardStatus;
	private Date createDate;
	private Date modifyDate;
	private String startDate;
	private String endDate;
	private int proBoardLevel;
	private String status;
	private int count;
	private String attachPath;
	private String attachOrigin;
	private String attachModify;
	private String proTitle;
	private String proContent;
	private String proBoardYn;
		
	private String userNo;
	private String pbUserName;
	private String pbJobName;
	
	private String replyWriter;	

}
