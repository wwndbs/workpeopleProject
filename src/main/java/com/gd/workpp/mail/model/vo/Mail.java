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
public class Mail {
	
	private String mailNo;
	private String mailTitle;
	private String mailContent;
	private String sender;
	private String receiver;
	private String mailRef;
	private String sendDate;
	private String sendStatus;
	
}
