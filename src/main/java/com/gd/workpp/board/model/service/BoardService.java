package com.gd.workpp.board.model.service;

import java.util.ArrayList;

import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;

public interface BoardService {

	// 게시판 목록 조회
	int selectListCount(int no, String depName);
	ArrayList<Board> selectList(PageInfo pi, int no, String depName);
	
	// 게시글 임시저장
	int saveBoard(Board b, Attachment at);
	String selectBoardNo();
	
	// 게시글 작성
	int insertBoard(Board b, Attachment at);
	
}
