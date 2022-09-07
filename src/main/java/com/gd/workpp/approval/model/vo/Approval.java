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
public class Approval {
	private int documentNo;
	private String userNo;
	private int approvalOrder;
	private String status;
	private String approvalDate;
	private int referenceStatus;
}
