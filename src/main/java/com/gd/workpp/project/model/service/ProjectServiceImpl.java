package com.gd.workpp.project.model.service;

import static com.gd.workpp.common.template.Template.getSqlSession;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.project.model.dao.ProjectDao;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.ProMember;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao pDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Project> selectList(String depName) {
		return pDao.selectList(sqlSession, depName);
	}	
	
	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}
	
	@Override
	public int selectListCount(int projectNo) {
		return pDao.selectListCount(sqlSession, projectNo);
	}
	
	@Override
	public ArrayList<ProBoard> selectProBoardList(int projectNo, PageInfo pi) {
		return pDao.selectProBoardList(sqlSession, projectNo, pi);
	}

	@Override
	public int deleteProject(int projectNo) {
		return 0;
	}

	@Override
	public int increaseCount(int proBoardNo) {
		return pDao.increaseCount(sqlSession, proBoardNo);
	}

	@Override
	public ProBoard selectDetailProBoard(int proBoardNo) {
		return pDao.selectDetailProBoard(sqlSession, proBoardNo);
	}

	@Override
	public int insertProBoard(ProBoard pb) {
		return pDao.insertProBoard(sqlSession, pb);
	}

	@Override
	public ArrayList<ProReply> ajaxSelectReplyList(int proBoardNo) {
		return pDao.ajaxSelectReplyList(sqlSession, proBoardNo);
	}

	@Override
	public int ajaxInsertReply(ProReply pr) {
		return pDao.ajaxInsertReply(sqlSession, pr);
	}

	@Override
	public ProBoard selectModifyProBoard(int proBoardNo) {
		return pDao.selectModifyProBoard(sqlSession, proBoardNo);
	}

	@Override
	public int updateProBoard(ProBoard pb) {
		return pDao.updateProBoard(sqlSession, pb);
	}

	@Override
	public int deleteProBoard(int proBoardNo) {
		return pDao.deleteProBoard(sqlSession, proBoardNo);
	}

	@Override
	public ArrayList<Project> selectAdmin(int projectNo) {
		return pDao.selectAdmin(sqlSession, projectNo);
	}

	@Override
	public ArrayList<ProMember> selectMember(int projectNo) {
		return pDao.selectMember(sqlSession, projectNo);
	}
	
	@Override
	public ArrayList<ProMember> countMember(int projectNo) {
		return pDao.countMember(sqlSession, projectNo);
	}

	@Override
	public int selectSearchCount(String condition, String keyword, int projectNo) {
		return pDao.selectSearchCount(sqlSession, condition, keyword, projectNo);
	}

	@Override
	public ArrayList<ProBoard> selectSearchList(String condition, String keyword, PageInfo pi, int projectNo) {
		return pDao.selectSearchList(sqlSession, condition, keyword, pi, projectNo);
	}

	@Override
	public ArrayList<Project> adminProApproveList(String userNo) {
		return pDao.adminProApproveList(sqlSession, userNo);
	}

	@Override
	public Project adminApproveMember(int projectNo) {
		return pDao.adminApproveMember(sqlSession, projectNo);
	}	

}








