package com.gd.workpp.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.board.model.vo.Reply;
import com.gd.workpp.board.model.vo.Report;
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;

public interface BoardService {

	// Author : 최영헌 / 메인페이지 게시글 조회
	ArrayList<Board> mainBoardList(int type, String dept);
	
	// 게시판 목록 조회
	int selectListCount(int no, String depName);
	ArrayList<Board> selectList(PageInfo pi, int no, String depName);
	ArrayList<Board> selectTopList(String depName);
	
	// 게시글 새로 임시저장
	int saveBoard(Board b, Attachment at);
	String selectBoardNo();
	
	// 게시글 임시저장 업데이트
	Attachment selectAttachment(int boardNo);
	int deleteAttachment(int boardNo);
	int updateSaveBoard(Board b, Attachment at);
	
	// 게시글 작성
	int insertBoard(Board b, Attachment at);
	
	// 임시저장한 게시글 insert
	int insertSaveBoard(Board b, Attachment at);
	
	// 임시저장 리스트 조회
	ArrayList<Board> selectSaveList(Board b);
	
	// 임시저장 게시글 조회
	Board selectSave(int boardNo);
	
	// 게시판 상세페이지
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	int selectBoardLike(Board b);
	
	// 댓글 조회
	ArrayList<Reply> selectReplyList(int boardNo);
	
	// 댓글 작성
	int insertReply(Reply r);
	
	// 대댓글 작성
	int insertreReply(Reply r);
	
	// 댓글 수정
	int updateReply(Reply r);
	
	// 게시글 좋아요 / 좋아요 해제
	int insertBoardLike(Board b);
	int deleteBoardLike(Board b);
	int selectBoardLikeCount(Board b);
	
	// 신고
	Report checkReport(Report rp);
	int insertReport(Report rp);
	
	// 신고 검색
	ArrayList<Report> searchReport(HashMap<String, String> map);
	
}
