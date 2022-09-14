package com.gd.workpp.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	// 내프로젝트조회 리스트
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.selectList");
	}
	
	// 프로젝트게시물리스트 페이징
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.selectListCount");
	}
	
	// 프로젝트게시물리스트 조회
	public ArrayList<ProBoard> selectProBoardList(SqlSessionTemplate sqlSession, int projectNo, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProBoardList", null, rowBounds);
	}
	
	// 프로젝트게시물 조회수증가
	public int increaseCount(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.update("projectMapper.increaseCount", proBoardNo);
	}
	
	// 프로젝트게시물 상세조회
	public ProBoard selectDetailProBoard(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.selectOne("projectMapper.selectDetailProBoard", proBoardNo);
	}
	
	// 프로젝트게시물 등록
	public int insertProBoard(SqlSessionTemplate sqlSession, ProBoard pb) {
		return sqlSession.insert("projectMapper.insertProBoard", pb);
	}
	
	// 프로젝트게시물 댓글조회
	public ArrayList<ProReply> ajaxSelectReplyList(SqlSessionTemplate sqlSession, int proBoardNo){
		return (ArrayList)sqlSession.selectList("projectMapper.ajaxSelectReplyList", proBoardNo);
	}

}













