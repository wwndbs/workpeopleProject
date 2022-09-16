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
public class Vacation {
	private String vacationCategory;
	private String vacationStart;
	private String vacationEnd;
	private int vacationCount;
}
