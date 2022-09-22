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
public class Reply {
	
	private int replyNo;
	private String userNo;
	private int refBoardNo;
	private int refReplyNo;
	private String replyContent;
	private String createDate;
	private String status;
	private String userName;
	private String jobName;
	private String level;
	
}
