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
	public int insertBoard(Board b, Attachment at) {
		
		int result1 = bDao.insertBoard(sqlSession, b);
		
		int result2 = 1;
		if(at != null) {
			result2 = bDao.insertAttachment(sqlSession, at);
		}
		
		return result1 * result2;
	}

}
