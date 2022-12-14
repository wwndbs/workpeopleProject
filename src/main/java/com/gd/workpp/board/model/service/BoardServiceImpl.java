package com.gd.workpp.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.board.model.dao.BoardDao;
import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.board.model.vo.Reply;
import com.gd.workpp.board.model.vo.Report;
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao bDao;
	
	/**
	 * Author : 최영헌
	 */
	@Override
	public ArrayList<Board> mainBoardList(int type, String dept) {
		return bDao.mainBoardList(sqlSession, type, dept);
	}

	
	@Override
	public int selectListCount(int no, String depName) {
		return bDao.selectListCount(sqlSession, no, depName);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, int no, String depName) {
		return bDao.selectList(sqlSession, pi, no, depName);
	}
	
	// 부서게시판 공지글 리스트 조회
	@Override
	public ArrayList<Board> selectTopList(String depName) {
		return bDao.selectTopList(sqlSession, depName);
	}

	@Override
	public int saveBoard(Board b, Attachment at) {
		
		int result1 = bDao.saveBoard(sqlSession, b);
		
		int result2 = 1;
		if(at.getRefType() == 2) {
			result2 = bDao.saveAttachment(sqlSession, at);
		}
		
		return result1 * result2;
	}
	
	@Override
	public int selectSaveCount() {
		return bDao.selectSaveCount(sqlSession);
	}
	
	// 임시저장 후 넘길 글번호 조회
	@Override
	public String selectBoardNo() {
		return bDao.selectBoardNo(sqlSession);
	}
	
	// 글번호에 해당하는 첨부파일 조회
	@Override
	public Attachment selectAttachment(int boardNo) {
		return bDao.selectAttachment(sqlSession, boardNo);
	}
	
	// 글번호에 해당하는 첨부파일 삭제
	@Override
	public int deleteAttachment(int boardNo) {
		return bDao.deleteAttachment(sqlSession, boardNo);
	}
	
	
	@Override
	public int updateSaveBoard(Board b, Attachment at) {
		int result1 = bDao.updateSaveBoard(sqlSession, b);
		
		int result2 = 1;
		if(at.getRefType() == 2) {
			result2 = bDao.updateSaveAttachment(sqlSession, at);
		}
		
		return result1 * result2;
	}

	// 게시글 새로 등록
	@Override
	public int insertBoard(Board b, Attachment at) {
		
		int result1 = bDao.insertBoard(sqlSession, b);
		
		int result2 = 1;
		if(at.getRefType() == 2) {
			result2 = bDao.insertAttachment(sqlSession, at);
		}
		
		return result1 * result2;
	}

	// 임시저장한 글 등록
	@Override
	public int insertSaveBoard(Board b, Attachment at) {

		int result1 = bDao.insertSaveBoard(sqlSession, b);
		
		int result2 = 1;
		if(at.getRefType() == 2) {
			result2 = bDao.updateSaveAttachment(sqlSession, at);
		}
		
		return result1 * result2;
		
	}

	// 임시저장 리스트 조회
	@Override
	public ArrayList<Board> selectSaveList(Board b) {
		return bDao.selectSaveList(sqlSession, b);
	}

	// 임시저장 게시글 조회
	@Override
	public Board selectSave(int boardNo) {
		return bDao.selectSave(sqlSession, boardNo);
	}

	// 게시글 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	// 선택한 게시글 조회
	@Override
	public Board selectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}
	
	// 게시글 좋아요 여부 조회
	@Override
	public int selectBoardLike(Board b) {
		return bDao.selectBoardLike(sqlSession, b);
	}

	// 댓글 리스트 조회
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return bDao.selectReplyList(sqlSession, boardNo);
	}


	// 댓글 작성
	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(sqlSession, r);
	}

	// 대댓글 작성
	@Override
	public int insertreReply(Reply r) {
		return bDao.insertreReply(sqlSession, r);
	}

	// 댓글 수정
	@Override
	public int updateReply(Reply r) {
		return bDao.updateReply(sqlSession, r);
	}

	// 게시글 좋아요
	@Override
	public int insertBoardLike(Board b) {
		return bDao.insertBoardLike(sqlSession, b);
	}

	// 게시글 좋아요 해제
	@Override
	public int deleteBoardLike(Board b) {
		return bDao.deleteBoardLike(sqlSession, b);
	}

	// 게시글 좋아요 개수
	@Override
	public int selectBoardLikeCount(Board b) {
		return bDao.selectBoardLikeCount(sqlSession, b);
	}
	
	// 신고 여부 조회
	@Override
	public Report checkReport(Report rp) {
		return bDao.checkReport(sqlSession, rp);
	}

	// 신고
	@Override
	public int insertReport(Report rp) {
		return bDao.insertReport(sqlSession, rp);
	}

	// 신고 검색
	@Override
	public ArrayList<Report> searchReport(HashMap<String, String> map) {
		return bDao.searchReport(sqlSession, map);
	}


	
	
	
	

}
