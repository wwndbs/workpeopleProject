package com.gd.workpp.project.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.gd.workpp.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Override
	public ArrayList<Project> selectList() {
		return null;
	}

	@Override
	public int insertProject(Project p) {
		return 0;
	}

	@Override
	public int deleteProject(int projectNo) {
		return 0;
	}

}
