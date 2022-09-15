package com.gd.workpp.approval.model.service;

import java.util.ArrayList;

import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.member.model.vo.Member;

public interface ApprovalService {
	
	// 각 카테고리별 결재 문서 갯수 조회
	int selectApprovalCount(int category, String userNo);
	
	// 각 카테고리별 결재 문서 리스트 조회
	ArrayList<Document> selectApprovalList(PageInfo pi, int category, String userNo);
	
	// 참조문서 갯수 조회
	int selectReferenceCount(String userNo);
	
	// 참조문서 조회
	ArrayList<Document> selectReferenceList(PageInfo pi, String userNo);
	
	// 부서별 멤버 조회
	ArrayList<Member> selectMemberList(String dept);
	
	// 임시저장문서 갯수 조회
	int selectSaveListCount(String userNo);
	
	// 임시저장문서 조회
	ArrayList<Document> selectSaveList(PageInfo pi, String userNo);
}
