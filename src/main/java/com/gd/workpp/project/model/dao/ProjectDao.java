package com.gd.workpp.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.ProMember;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	// [김은지] 메인화면 프로젝트리스트 조회
	public ArrayList<Project> homeProjectList(SqlSessionTemplate sqlSession, String userNo){
		return (ArrayList)sqlSession.selectList("projectMapper.homeProjectList", userNo);
	}
	
	// [김은지] 내프로젝트조회 리스트 
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession, String depName, String userNo){ 
		HashMap<String, String> data = new HashMap<>();
		data.put("depName", depName);
		data.put("userNo", userNo);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectList", data);
	}
		
	// [김은지] 내프로젝트조회 리스트2
	public ArrayList<Project> selectList2(SqlSessionTemplate sqlSession, String depName, String userNo){
		HashMap<String, String> data = new HashMap<>();
		data.put("depName", depName);
		data.put("userNo", userNo);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectList2", data);
	}
	
	// [김은지] 프로젝트 관리자 승인리스트 조회
	public ArrayList<Project> adminProApproveList(SqlSessionTemplate sqlSession, String userNo){
		return (ArrayList)sqlSession.selectList("projectMapper.adminProApproveList", userNo);
	}
	
	// [김은지] 프로젝트 관리자 승인 - 한명 모달조회
	public Project adminApproveMember(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("projectMapper.adminApproveMember", projectNo);
	}
		
	// [김은지] 프로젝트 관리자승인	
	public int projectApprove(SqlSessionTemplate sqlSession, ProMember pm) {
		return sqlSession.update("projectMapper.projectApprove", pm);
	}
	
	// [김은지] 사용자 가입신청 - 한명 모달조회
	public ProMember selectRequestMember(SqlSessionTemplate sqlSession, int projectNo, String userMemNo) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("userMemNo", userMemNo);
		data.put("projectNo", projectNo);
		
		return sqlSession.selectOne("projectMapper.selectRequestMember", data);
	}
	
	// [김은지] 프로젝트 사용자 가입신청
	public int proApproveRequest(SqlSessionTemplate sqlSession, ProMember pm) {
		return sqlSession.insert("projectMapper.proApproveRequest", pm);
	}
	
	// [김은지] 프로젝트 등록
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	// [김은지] 전체 프로젝트리스트 조회
	public ArrayList<Project> selectTotalProject(SqlSessionTemplate sqlSession, String depName, String userNo){
		HashMap<String, String> data = new HashMap<>();
		data.put("dapName", depName);
		data.put("userNo", userNo);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectTotalProject", data);
	}
	
	// [김은지] 프로젝트상세리스트 관리자조회
	public ArrayList<Project> selectAdmin(SqlSessionTemplate sqlSession, int projectNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectAdmin", projectNo);
	}
	
	// [김은지] 프로젝트상세리스트 참여자조회
	public ArrayList<ProMember> selectMember(SqlSessionTemplate sqlSession, int projectNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectMember", projectNo);
	}
		
	// [김은지] 프로젝트게시물리스트 페이징
	public int selectListCount(SqlSessionTemplate sqlSession, int projectNo, String proBoardStatus) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("projectNo", projectNo);
		data.put("proBoardStatus", proBoardStatus);
		
		return sqlSession.selectOne("projectMapper.selectListCount", data);
	}
	
	// [김은지] 프로젝트게시물리스트 조회
	public ArrayList<ProBoard> selectProBoardList(SqlSessionTemplate sqlSession, int projectNo, String proBoardStatus, PageInfo pi){
		HashMap<String, Object> data = new HashMap<>();
		data.put("projectNo", projectNo);
		data.put("proBoardStatus", proBoardStatus);
		data.put("pi", pi);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProBoardList", data, rowBounds);
	}	
	
	// [김은지] ajax 진행도별로 프로젝트게시물리스트 페이징
	public int ajaxSelectListCount(SqlSessionTemplate sqlSession, int projectNo, String condition) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("condition", condition);
		data.put("no", projectNo);
		
		return sqlSession.selectOne("projectMapper.ajaxSelectListCount", data);
	}	
	
	// [김은지] ajax 진행도별로 프로젝트게시물리스트 조회
	public ArrayList<ProBoard> ajaxSelectBoardList(SqlSessionTemplate sqlSession, int projectNo, PageInfo pi, String condition){
		HashMap<String, Object> data = new HashMap<>();
		data.put("condition", condition);
		data.put("no", projectNo);
		data.put("pi", pi);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.ajaxSelectBoardList", data, rowBounds);
	}
	
	// [김은지] 프로젝트게시물 검색 페이징
	public int selectSearchCount(SqlSessionTemplate sqlSession, String condition, String keyword, int projectNo) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("condition", condition);
		data.put("keyword", keyword);
		data.put("no", projectNo);
				
		return sqlSession.selectOne("projectMapper.selectSearchCount", data);
	}
	
	// [김은지] 프로젝트게시물 검색
	public ArrayList<ProBoard> selectSearchList(SqlSessionTemplate sqlSession, String condition, String keyword, PageInfo pi, int projectNo) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("condition", condition);
		data.put("keyword", keyword);
		data.put("no", projectNo);
		data.put("pi", pi);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectSearchList", data, rowBounds);
	}
	
	// [김은지] 프로젝트게시물 조회수증가
	public int increaseCount(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.update("projectMapper.increaseCount", proBoardNo);
	}
	
	// [김은지] 프로젝트게시물 상세조회
	public ProBoard selectDetailProBoard(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.selectOne("projectMapper.selectDetailProBoard", proBoardNo);
	}
	
	// [김은지] 프로젝트게시물 업데이트페이지
	public ProBoard selectModifyProBoard(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.selectOne("projectMapper.selectDetailProBoard", proBoardNo);
	}
	
	// [김은지] 프로젝트게시물 업데이트요청
	public int updateProBoard(SqlSessionTemplate sqlSession, ProBoard pb) {
		//System.out.println(pb);
		return sqlSession.update("projectMapper.updateProBoard", pb);
	}
	
	// [김은지] 프로젝트게시물 삭제요청
	public int deleteProBoard(SqlSessionTemplate sqlSession, int proBoardNo) {
		return sqlSession.update("projectMapper.deleteProBoard", proBoardNo);
	}
	
	// [김은지] 프로젝트게시물 등록
	public int insertProBoard(SqlSessionTemplate sqlSession, ProBoard pb) {
		return sqlSession.insert("projectMapper.insertProBoard", pb);
	}
	
	// [김은지] 프로젝트게시물 댓글조회
	public ArrayList<ProReply> ajaxSelectReplyList(SqlSessionTemplate sqlSession, int proBoardNo){
		return (ArrayList)sqlSession.selectList("projectMapper.ajaxSelectReplyList", proBoardNo);
	}
	
	// [김은지] 프로젝트게시물 댓글등록
	public int ajaxInsertReply(SqlSessionTemplate sqlSession, ProReply pr) {
		return sqlSession.insert("projectMapper.ajaxInsertReply", pr);
	}

}













