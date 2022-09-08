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
public class Spam {
	
	private int spamNo;
	private String userMail;	// 사원 이메일
	private String spamAddress; // 사원이 스팸으로 등록한 메일 주소
	private String spamDate;

}
