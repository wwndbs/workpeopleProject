package com.gd.workpp.project.model.service;

import java.util.ArrayList;

import com.gd.workpp.project.model.vo.ProBoard;
import com.gd.workpp.project.model.vo.Project;

public interface ProjectService {
	
	// 1. 내 프로젝트 리스트 조회
	ArrayList<Project> selectList();
	
	// 2. 프로젝트 작성하기
	int insertProject(Project p);
	
	// 3. 프로젝트 게시물 리스트조회
	ArrayList<ProBoard> selectProBoardList(int projectNo);
	
	// 4. 프로젝트 삭제
	int deleteProject(int projectNo);
	
	// 5. 프로젝트 게시물 상세조회
	int increaseCount(int proBoardNo);
	ProBoard selectDetailProBoard(int proBoardNo);
	
	// 6. 프로젝트 게시물 작성하기
	int insertProBoard(ProBoard pb);

}
