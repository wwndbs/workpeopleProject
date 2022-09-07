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
public class Project {
	
	private int projectNo;
	private String userNo;
	private String projectTitle;
	private String projectContent;
	private String status;
	private String category;
	private String proOpen;
	private String depName;
	private Date proDate;

}