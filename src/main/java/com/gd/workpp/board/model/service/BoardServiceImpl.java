package com.gd.workpp.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.board.model.dao.BoardDao;
import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int selectListCount(int no, String depName) {
		return bDao.selectListCount(sqlSession, no, depName);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, int no, String depName) {
		return bDao.selectList(sqlSession, pi, no, depName);
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


	
	@Override
	public int insertBoard(Board b, Attachment at) {
		
		int result1 = bDao.insertBoard(sqlSession, b);
		
		int result2 = 1;
		if(at != null) {
			result2 = bDao.insertAttachment(sqlSession, at);
		}
		
		return result1 * result2;
	}

	
	
	
	

}
