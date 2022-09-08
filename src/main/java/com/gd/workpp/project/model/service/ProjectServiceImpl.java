package com.gd.workpp.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.project.model.dao.ProjectDao;
import com.gd.workpp.project.model.vo.ProBoard;
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
	public ArrayList<ProBoard> selectProBoardList(int projectNo) {
		return pDao.selectProBoardList(sqlSession, projectNo);
	}

	@Override
	public int deleteProject(int projectNo) {
		return 0;
	}

}








