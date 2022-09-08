package com.gd.workpp.board.model.vo;

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
public class Board {
	
	private int boardNo;
	private String userNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String topExp;
	private int count;
	private String status;

}
