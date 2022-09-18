package com.gd.workpp.approval.model.vo;

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
public class Document {
	private int documentNo;
	private String userNo;
	private String documentForm;
	private String documentTitle;
	private String createDate;
	private String documentContent;
	private int progress;
	private int status;
	private String message;
	private String originName;
	private String changeName;
	private String filePath;
	private int approvalCount;
}