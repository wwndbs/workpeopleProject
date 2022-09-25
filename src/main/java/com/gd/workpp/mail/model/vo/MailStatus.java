package com.gd.workpp.mail.model.vo;

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
public class MailStatus {

	private int mailNo;
	private String userMail;
	private String userName;
	private int mailType; 
	private String mailRead;
	private String mailDelete;
	private String mailSpam;
	private String mailImportant;
	private int tagNo;
	
	public MailStatus(String userMail, String userName, int mailType) {
		super();
		this.userMail = userMail;
		this.userName = userName;
		this.mailType = mailType;
	}

	public MailStatus(int mailNo, String userMail, String userName, int mailType) {
		super();
		this.mailNo = mailNo;
		this.userMail = userMail;
		this.userName = userName;
		this.mailType = mailType;
	}
	
}
