package com.gd.workpp.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.workpp.board.model.service.BoardService;

@Controller
public class BoardController {
	
	private BoardService bService;

	// 글작성폼
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		
		return "board/enrollForm";
		
	}
	
	// 공지게시판 조회
	@RequestMapping("nlist.bo")
	public String selectNoticeList(@RequestParam (value="cpage", defaultValue="1") int currentPage) {
		
		int listCount = bService.selectListCount();
		
		return "board/noticeBoardList";
		
	}
	
}
