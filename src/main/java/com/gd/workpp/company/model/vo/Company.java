package com.gd.workpp.company.model.vo;

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
public class Company {

	private int modifyNo;
	private String comName;
	private String comNo;
	private String ceo;
	private int postNo;
	private String phone;
	private String fax;
	private String address;
	private Date modifyDate;
	private Date createDate;
	private String comImg;
	
}
