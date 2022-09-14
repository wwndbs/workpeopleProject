package com.gd.workpp.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.workpp.board.model.service.BoardService;
import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	// 게시판 목록 조회
	@RequestMapping("list.bo")
	public String selectBoardList(@RequestParam (value="cpage", defaultValue="1") int currentPage, int no, String dept, HttpSession session, Model model) {
		
		String depName = ((Member)session.getAttribute("loginUser")).getDepName();
		
		int listCount = bService.selectListCount(no, depName);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Board> list = bService.selectList(pi, no, depName);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		if(no == 1) { // 공지게시판
			
			return "board/noticeBoardList";
			
		}else if(no == 2) { // 부서게시판
			
			model.addAttribute("depName", depName);
			return "board/deptBoardList";
			
		}else { // 익명게시판
			
			return "board/anonBoardList";
			
		}
		
	}
	
	// 글작성폼
	@RequestMapping("enrollForm.bo")
	public String enrollForm(int no, Model model) {
		
		String boardType = "";
		if(no == 1) {
			boardType = "공지";
		}else if(no == 2) {
			boardType = "부서";
		}else {
			boardType = "익명";
		}
		
		model.addAttribute("typeNo", no);
		model.addAttribute("boardType", boardType);
		
		return "board/enrollForm";
		
	}
	
	// 게시글 작성
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile file, HttpSession session) {
		
		Attachment at = new Attachment();
		
		// 첨부파일이 있을 경우 FileUpload클래스로 파일 변환 후 Board 객체에 담기
		if(!file.getOriginalFilename().equals("")) {
			
			String saveFilePath = FileUpload.saveFile(file, session, "resources/board_upfiles");
			
			at.setOriginName(file.getOriginalFilename());
			at.setChangeName(saveFilePath);
			
		}
		
		int result = bService.insertBoard(b, at);
		
		return null;
		
	}
	
}
