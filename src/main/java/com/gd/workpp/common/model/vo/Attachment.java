package com.gd.workpp.common.model.vo;

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
public class Attachment {

	private int fileNo;
	private int refType; // 참조게시판(1:메일, 2:게시판)
	private int refNo;   // 참조메일번호/참조글번호
	private String originName;
	private String changeName; // resources/xxxx/xxx.jpg
	private String uploadDate;
	private String fileStatus;
	
	public Attachment(String originName, String changeName) {
		super();
		this.originName = originName;
		this.changeName = changeName;
	}
	
}
