package com.gd.workpp.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.ProMember;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	// 내프로젝트조회 리스트 
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession, String depName){
		return (ArrayList)sqlSession.selectList("projectMapper.selectList", depName);
	}
	
	// 프로젝트 참여 멤버수 조회
	public ArrayList<ProMember> countMember(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.countMember", projectNo);
	}
	
	// 프로젝트 관리자 승인리스트 조회
	public ArrayList<Project> adminProApproveList(SqlSessionTemplate sqlSession, String userNo){
		return (ArrayList)sqlSession.selectList("projectMapper.adminProApproveList", userNo);
	}
	
	// 프로젝트 관리자 승인 - 한명 모달조회
	public Project adminApproveMember(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("projectMapper.adminApproveMember", projectNo);
	}
		
	// 프로젝트 관리자승인	
	public int projectApprove(SqlSessionTemplate sqlSession, ProMember pm) {
		return sqlSession.update("projectMapper.projectApprove", pm);
	}
	
	// 프로젝트 등록
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	// 프로젝트상세리스트 관리자조회
	public ArrayList<Project> selectAdmin(SqlSessionTemplate sqlSession, int projectNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectAdmin", projectNo);
	}
	
	// 프로젝트상세리스트 참여자조회
	public ArrayList<ProMember> selectMember(SqlSessionTemplate sqlSession, int projectNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectMember", projectNo);
	}
		
	// 프로젝트게시물리스트 페이징
	public int selectListCount(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("projectMapper.selectListCount", projectNo);
	}
	
	// 프로젝트게시물리스트 조회
	public ArrayList<ProBoard> selectProBoardList(SqlSessionTemplate sqlSession, int projectNo, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProBoardList", projectNo, rowBounds);
	}
	
	// 프로젝트게시물 검색
	public int selectSearchCount(SqlSessionTemplate sqlSession, String condition, String keyword, int projectNo) {
		return sqlSession.selectOne("projectMapper.selectSearchCount", projectNo);
	}
	
	// 프로젝트게시물 검색
	public ArrayList<ProBoard> selectSearchList(SqlSessionTemplate sqlSession, String condition, String keyword, PageInfo pi, int projectNo) {
		//HashMap<String, String> map = new HashMap<>();
		//map.put("condition", condition);
		//map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectSearchList", projectNo, rowBounds);
	}
	
	// 프로젝트게시물 조회수증가
	public int increaseCount(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.update("projectMapper.increaseCount", proBoardNo);
	}
	
	// 프로젝트게시물 상세조회
	public ProBoard selectDetailProBoard(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.selectOne("projectMapper.selectDetailProBoard", proBoardNo);
	}
	
	// 프로젝트게시물 업데이트페이지
	public ProBoard selectModifyProBoard(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.selectOne("projectMapper.selectDetailProBoard", proBoardNo);
	}
	
	// 프로젝트게시물 업데이트요청
	public int updateProBoard(SqlSessionTemplate sqlSession, ProBoard pb) {
		return sqlSession.update("projectMapper.updateProBoard", pb);
	}
	
	// 프로젝트게시물 삭제요청
	public int deleteProBoard(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.update("projectMapper.deleteProBoard", proBoardNo);
	}
	
	// 프로젝트게시물 등록
	public int insertProBoard(SqlSessionTemplate sqlSession, ProBoard pb) {
		return sqlSession.insert("projectMapper.insertProBoard", pb);
	}
	
	// 프로젝트게시물 댓글조회
	public ArrayList<ProReply> ajaxSelectReplyList(SqlSessionTemplate sqlSession, int proBoardNo){
		return (ArrayList)sqlSession.selectList("projectMapper.ajaxSelectReplyList", proBoardNo);
	}
	
	// 프로젝트게시물 댓글등록
	public int ajaxInsertReply(SqlSessionTemplate sqlSession, ProReply pr) {
		return sqlSession.insert("projectMapper.ajaxInsertReply", pr);
	}

}













