package com.gd.workpp.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.project.model.dao.ProjectDao;
import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.ProReply;
import com.gd.workpp.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao pDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Project> selectList() {
		return pDao.selectList(sqlSession);
	}

	@Override
	public int insertProject(Project p) {
		return 0;
	}
	
	@Override
	public int selectListCount() {
		return pDao.selectListCount(sqlSession);
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

}








