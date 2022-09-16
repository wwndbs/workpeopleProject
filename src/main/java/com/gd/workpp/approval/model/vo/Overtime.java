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
public class Overtime {
	private String workStart;
	private String workEnd;
	private String workDate;
	private String workUse;
}
