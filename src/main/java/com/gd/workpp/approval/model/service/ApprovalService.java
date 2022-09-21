package com.gd.workpp.approval.model.service;

import java.util.ArrayList;

import com.gd.workpp.approval.model.vo.Absence;
import com.gd.workpp.approval.model.vo.Approval;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.approval.model.vo.Overtime;
import com.gd.workpp.approval.model.vo.Plan;
import com.gd.workpp.approval.model.vo.Vacation;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.member.model.vo.Member;

public interface ApprovalService {
	// 각 카테고리별 결재 문서 갯수 조회
	int selectApprovalCount(int category, String userNo);
	
	// 각 카테고리별 결재 문서 리스트 조회
	ArrayList<Document> selectApprovalList(PageInfo pi, int category, String userNo);
	
	// 결재문서 검색 갯수 조회
	int searchApprovalCount(String userNo, String keyword);
	
	// 결재문서 검색 결과 리스트 조회
	ArrayList<Document> searchApprovalList(PageInfo pi, String userNo, String keyword);
	
//--------------------------------------------------------
	
	// 결재문서 상세 조회(공통 부분)
	Document approvalDetail(int no);
	
	// 결재문서 상세 조회(각 양식 별)
	Object approvalDetailForm(int no, String form);
	
	// 결재문서 상세 조회(해당 결재문서 결재자)
	ArrayList<Approval> approvalDetailLine(int no);
	
//--------------------------------------------------------
	
	// 참조문서 갯수 조회
	int selectReferenceCount(String userNo);
	
	// 참조문서 조회
	ArrayList<Document> selectReferenceList(PageInfo pi, String userNo);
	
	// 참조문서 검색 갯수 조회
	int searchReferenceCount(String userNo, String keyword);
	
	// 참조문서 검색 결과 리스트 조회
	ArrayList<Document> searchReferenceList(PageInfo pi, String userNo, String keyword);
	
//--------------------------------------------------------
	
	// 임시저장문서 갯수 조회
	int selectSaveListCount(String userNo);
	
	// 임시저장문서 조회
	ArrayList<Document> selectSaveList(PageInfo pi, String userNo);
	
	// 임시저장문서 삭제
	int deleteSaveList(String[] noArr);
	
	// 임시저장문서 검색 갯수 조회
	int searchSaveListCount(String userNo, String keyword);
	
	// 임시저장문서 검색 결과 리스트 조회
	ArrayList<Document> searchSaveList(PageInfo pi, String userNo, String keyword);
	
	// 임시저장문서 상세 조회(수정)
	Document saveListModify(int no, String form, String userNo);
	
//--------------------------------------------------------
	
	// 1. 결재문서 작성 전 약식작성된 결재문서 유무 확인
	Document selectTemporaryApproval(String userNo);
	
	// 2. 결재문서 작성 전 결재 번호 등록용도
	int insertTemporaryApproval(String userNo, String form);
	
//-----------------------------------
	
	// 부서별 멤버 조회
	ArrayList<Member> selectMemberList(String dept);
	
//-----------------------------------
	
	// 결재자, 참조자 조회
	ArrayList<Approval> approvalLineView(int documentNo);
	
	// 체크멤버 결재선, 참조 부분 이동
	ArrayList<Member> insertCheck(String[] userNoArr);
	
	// 체크멤버 결재선, 참조 부분 제외
	ArrayList<Member> excludeCheck(String[] userNoArr);
	
	// 결재선, 참조 등록
	int insertApprovalAndReference(String[] approvalArr, String[] referenceArr, int documentNo);
	
	// 뒤로가기(작성중인 결재문서, 결재선, 참조자 삭제)
	void backPage(String userNo, int documentNo);
	
	// 업무기안 결재 등록
	int insertApprovalPlan(Document document, Plan plan);
	
	// 결근사유서 결재 등록
	int insertApprovalAbsence(Document document, Absence absence);
	
	// 휴가신청서 결재 등록
	int insertApprovalVacation(Document document, Vacation vacation);
	
	// 연장근무신청서 결재 등록
	int insertApprovalOvertime(Document document, Overtime overtime);
	
//-----------------------------------
	
	// 결재 승인
	int approvalOfApproval(String approvalUser, int documentNo);
	
	// 결재 반려
	int approvalFusal(int documentNo, String msg, String userNo);
	
	// 결재문서 삭제
	int deleteApproval(int documentNo);
}