package com.gd.workpp.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.workpp.board.model.service.BoardService;
import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class AjaxBoardController {
	
	@Autowired
	private BoardService bService;
	
	/**
	 * Author : 최영헌
	 * 메인페이지 게시판 게시물 조회 요청을 처리하는 메소드
	 * @param type : 게시판 타입(1 : 공지사항, 2 : 부서별 게시판, 3 : 익명게시판)
	 * @param dept : 부서별 게시판에서 조회할 부서의 게시물
	 */
	@ResponseBody
	@RequestMapping(value="mainBoardList.main", produces="application/json; charset=UTF-8")
	public String mainBoardList(@RequestParam(value="type", defaultValue="1")int type,
			                    HttpSession session) {
		String dept = ((Member) session.getAttribute("loginUser")).getDepName();
		ArrayList<Board> list = bService.mainBoardList(type, dept);
		System.out.println(list);

		return new Gson().toJson(list);
	}
}
