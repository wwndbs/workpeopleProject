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
public class ProReply {
	
	private int proReplyNo;
	private int proBoardNo;
	private String replyWriter;
	private String proReply;
	private Date rCreateDate;
	private Date rModifyDate;

}
