package com.gd.workpp.company.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Department {
	
	private String depName;
	private String depContent;
	private String status;
	private Date createDate;
	private Date modifyDate;
	private String userName;
	private int userCount;
	
}
