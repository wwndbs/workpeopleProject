package com.gd.workpp.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.workpp.board.model.service.BoardService;
import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;

	// 글작성폼
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		
		return "board/enrollForm";
		
	}
	
	// 게시판 목록 조회
	@RequestMapping("list.bo")
	public String selectNoticeList(@RequestParam (value="cpage", defaultValue="1") int currentPage, int no, String dept, HttpSession session, Model model) {
		
		String depName = ((Member)session.getAttribute("loginUser")).getDepName();
		
		int listCount = bService.selectListCount(no, depName);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Board> list = bService.selectList(pi, no, depName);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		if(no == 1) { // 공지게시판
			
			return "board/noticeBoardList";
			
		}else if(no == 2) { // 부서게시판
			
			if(dept.equals(depName)) { // 같은 부서에 접속했을 경우
				
				return "board/deptBoardList";
				
			}else { // 다른 부서에 접속했을 경우
				return "board/deptBoardList"; // 에러페이지를 띄울 지 고민
			}
			
		}else { // 익명게시판
			
			return "board/anonBoardList";
			
		}
		
	}
	
}
