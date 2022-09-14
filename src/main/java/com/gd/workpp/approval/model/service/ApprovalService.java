package com.gd.workpp.approval.model.service;

import java.util.ArrayList;

import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;

public interface ApprovalService {
	
	// 각 카테고리별 결재 문서 갯수 조회
	int selectApprovalCount(int viewPage, String userNo);
	
	// 각 카테고리별 결재 문서 리스트 조회
	ArrayList<Document> selectApprovalList(PageInfo pi, int viewPage, String userNo);
	
	// 참조문서 갯수 조회
	int selectReferenceCount(String userNo);
}
