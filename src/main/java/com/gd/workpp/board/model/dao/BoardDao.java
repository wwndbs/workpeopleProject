package com.gd.workpp.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int no, String depName) {
		
		if(no == 2) { // 부서게시판 글 조회
			return sqlSession.selectOne("boardMapper.selectDeptCount", depName);
		}else { // 공지, 익명게시판 글 조회
			return sqlSession.selectOne("boardMapper.selectListCount", no);
		}
		
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int no, String depName){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBound = new RowBounds(offset, limit);
		
		if(no == 2) { // 부서게시판 글 조회
			return (ArrayList)sqlSession.selectList("boardMapper.selectDeptList", depName, rowBound);
		}else { // 공지, 익명게시판 글 조회
			return (ArrayList)sqlSession.selectList("boardMapper.selectList", no, rowBound);
		}
		
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}

}
