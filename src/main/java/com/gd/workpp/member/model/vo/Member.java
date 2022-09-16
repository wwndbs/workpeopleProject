package com.gd.workpp.member.model.vo;

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
public class Member {	
	private String userNo;
	private String depName;
	private String jobName;
	private String userName;
	private String email;
	private String phone;
	private String createDate;
	private String modifyDate;
	private String status;
	private String profImg;
	private String userEmail;
	private String userPwd;
	private String birthday;
}
