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
public class Tag {
	
	private int tagNo;
	private String userMail;
	private String tagName;
	private String tagColor;
	private String tagDate;

}
