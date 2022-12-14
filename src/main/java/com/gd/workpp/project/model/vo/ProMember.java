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
public class ProMember {
	
	private int proMemNo;
	private String userMemNo;
	private String pmMemberCount;
	private String proApprove;
	
	private String userNo;
	private int projectNo;
	private String pbUserName;
	private String pbJobName;
	private String pbDepName;

}
