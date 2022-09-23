package com.gd.workpp.project.model.service;

import java.util.ArrayList;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.ProMember;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;

public interface ProjectService {
	
	// 작성자 김은지
	
	// 0. 메인화면 프로젝트리스트 조회 (ajax)
	ArrayList<Project> homeProjectList(String userNo);
	
	// 1. 내 프로젝트 리스트 조회
	ArrayList<Project> selectList(String depName, String userNo);
	
	// 2. 프로젝트 작성하기
	int insertProject(Project p);
	
	// 3. 프로젝트 게시물 리스트조회, 검색
	int selectListCount(int projectNo);
	ArrayList<ProBoard> selectProBoardList(int projectNo, PageInfo pi);
	
	// 4. 프로젝트 삭제
	int deleteProject(int projectNo);
	
	// 5. 프로젝트 게시물 상세조회
	int increaseCount(int proBoardNo);
	ProBoard selectDetailProBoard(int proBoardNo);
	
	// 6. 프로젝트 게시물 작성하기
	int insertProBoard(ProBoard pb);
	
	// 7. 프로젝트 게시물 댓글조회 (ajax)
	ArrayList<ProReply> ajaxSelectReplyList(int proBoardNo);
	
	// 8. 프로젝트 게시물 댓글작성 (ajax)
	int ajaxInsertReply(ProReply pr);
	
	// 9. 프로젝트 게시물 수정화면 띄우고 업데이트요청까지
	ProBoard selectModifyProBoard(int proBoardNo);
	int updateProBoard(ProBoard pb);
	
	// 10. 프로젝트 게시물 삭제
	int deleteProBoard(int proBoardNo);
	
	// 11. 프로젝트담당 관리자 조회
	ArrayList<Project> selectAdmin(int projectNo);
	
	// 12. 프로젝트담당 참여자 조회
	ArrayList<ProMember> selectMember(int projectNo);
	
	// 13. 프로젝트게시판 검색리스트조회
	int selectSearchCount(String condition, String keyword, int projectNo);
	ArrayList<ProBoard> selectSearchList(String condition, String keyword, PageInfo pi, int projectNo);
	
	// 14. 관리자 프로젝트 승인리스트조회
	ArrayList<Project> adminProApproveList(String userNo);
	
	// 15. 프로젝트 관리자 승인 - 한명 모달조회
	Project adminApproveMember(int projectNo);
	
	// 16. 프로젝트 관리자 승인
	int projectApprove(ProMember pm);
	
	// 17. 전체 프로젝트리스트 조회
	ArrayList<Project> selectTotalProject(String depName, String userNo);
	
	// 18. 내 프로젝트리스트조회2
	ArrayList<Project> selectList2(String depName);
	
	// 19. 사용자 프로젝트 승인요청
	int proApproveRequest(ProMember pm);
	
	// 20. 프로젝트 게시물리스트 진행도별로 조회 (ajax)
	int ajaxSelectListCount(int projectNo, String condition, String keyword);
	ArrayList<ProBoard> ajaxSelectBoardList(int projectNo, PageInfo pi, String condition, String keyword);

}
