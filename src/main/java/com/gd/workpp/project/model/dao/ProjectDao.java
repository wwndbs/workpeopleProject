package com.gd.workpp.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	// 내프로젝트조회 리스트
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.selectList");
	}
	
	// 프로젝트상세리스트 조회
	public ArrayList<ProBoard> selectProBoardList(SqlSessionTemplate sqlSession, int projectNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectProBoardList");
	}

}
