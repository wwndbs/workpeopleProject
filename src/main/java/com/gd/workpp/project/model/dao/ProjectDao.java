package com.gd.workpp.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.selectList");
	}

}
