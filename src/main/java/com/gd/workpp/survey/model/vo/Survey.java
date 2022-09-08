package com.gd.workpp.survey.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Survey {
	
	private int surveyNo;
	private String userNo;
	private String depName; //설문대상부서
	private String surveyTitle;
	private String surveyDesc;
	private String startDate; //설문시작일
	private String endDate; //설문마감일
	private Date enrollDate; //설문등록일
	private Date modifyDate; //설문수정일
	private int count;
	private String surveyYn; //설문삭제여부. 기본값이 N

}




