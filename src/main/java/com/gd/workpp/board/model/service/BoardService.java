package com.gd.workpp.board.model.service;

import java.util.ArrayList;

import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.common.model.vo.PageInfo;

public interface BoardService {

	// 게시판 목록 조회
	int selectListCount(int no, String depName);
	ArrayList<Board> selectList(PageInfo pi, int no, String depName);
	
}
