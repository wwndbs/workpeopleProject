package com.gd.workpp.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {

	// 공지게시판 조회
	@RequestMapping("nlist.bo")
	public String selectNoticeList(@RequestParam (value="cpage", defaultValue="1") int currentPage) {
		
		return "board/noticeBoardList";
		
	}
	
}
