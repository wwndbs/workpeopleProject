package com.gd.workpp.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.approval.model.dao.ApprovalDao;
import com.gd.workpp.approval.model.vo.Absence;
import com.gd.workpp.approval.model.vo.Approval;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.approval.model.vo.Overtime;
import com.gd.workpp.approval.model.vo.Plan;
import com.gd.workpp.approval.model.vo.Vacation;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.member.model.vo.Member;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalDao apDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectApprovalCount(int category, String userNo) {
		return apDao.selectApprovalCount(sqlSession, category, userNo);
	}
	
	@Override
	public int searchApprovalCount(String userNo, String keyword) {
		return apDao.searchApprovalCount(sqlSession, userNo, keyword);
	}
	
	@Override
	public ArrayList<Document> selectApprovalList(PageInfo pi, int category, String userNo) {
		return apDao.selectApprovalList(sqlSession, pi, category, userNo);
	}
	
	@Override
	public ArrayList<Document> searchApprovalList(PageInfo pi, String userNo, String keyword) {
		return apDao.searchApprovalList(sqlSession, pi, userNo, keyword);
	}

	@Override
	public int selectReferenceCount(String userNo) {
		return apDao.selectReferenceCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Document> selectReferenceList(PageInfo pi, String userNo) {
		return apDao.selectReferenceList(sqlSession, pi, userNo);
	}

	@Override
	public ArrayList<Member> selectMemberList(String dept) {
		return apDao.selectMemberList(sqlSession, dept);
	}

	@Override
	public int selectSaveListCount(String userNo) {
		return apDao.selectSaveListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Document> selectSaveList(PageInfo pi, String userNo) {
		return apDao.selectSaveList(sqlSession, pi, userNo);
	}

	@Override
	public int deleteSaveList(String[] noArr) {
		return apDao.deleteSaveList(sqlSession, noArr);
	}

	@Override
	public int searchSaveListCount(String userNo, String keyword) {
		return apDao.searchSaveListCount(sqlSession, userNo, keyword);
	}

	@Override
	public ArrayList<Document> searchSaveList(PageInfo pi, String userNo, String keyword) {
		return apDao.searchSaveList(sqlSession, pi, userNo, keyword);
	}

	@Override
	public int searchReferenceCount(String userNo, String keyword) {
		return apDao.searchReferenceCount(sqlSession, userNo, keyword);
	}

	@Override
	public ArrayList<Document> searchReferenceList(PageInfo pi, String userNo, String keyword) {
		return apDao.searchReferenceList(sqlSession, pi, userNo, keyword);
	}

	@Override
	public int insertTemporaryApproval(String userNo, String form) {
		return apDao.insertTemporaryApproval(sqlSession, userNo, form);
	}

	@Override
	public Document selectTemporaryApproval(String userNo) {
		return apDao.selectTemporaryApproval(sqlSession, userNo);
	}

	@Override
	public ArrayList<Approval> approvalLineView(int documentNo) {
		return apDao.approvalLineView(sqlSession, documentNo);
	}

	@Override
	public void backPage(String userNo, int documentNo) {
		apDao.backPage(sqlSession, userNo, documentNo);
		
	}

	@Override
	public ArrayList<Member> insertCheck(String[] userNoArr) {
		return apDao.insertCheck(sqlSession, userNoArr);
	}

	@Override
	public ArrayList<Member> excludeCheck(String[] userNoArr) {
		return apDao.excludeCheck(sqlSession, userNoArr);
	}

	@Override
	public int insertApprovalAndReference(String[] approvalArr, String[] referenceArr, int documentNo) {
		return apDao.insertApprovalAndReference(sqlSession, approvalArr, referenceArr, documentNo);
	}

	@Override
	public int insertApprovalPlan(Document document, Plan plan) {
		return apDao.insertApprovalPlan(sqlSession, document, plan);
	}

	@Override
	public int insertApprovalAbsence(Document document, Absence absence) {
		return apDao.insertApprovalAbsence(sqlSession, document, absence);
	}

	@Override
	public int insertApprovalVacation(Document document, Vacation vacation) {
		return apDao.insertApprovalVacation(sqlSession, document, vacation);
	}

	@Override
	public int insertApprovalOvertime(Document document, Overtime overtime) {
		return apDao.insertApprovalOvertime(sqlSession, document, overtime);
	}

	@Override
	public Document approvalDetail(int no) {
		return apDao.approvalDetail(sqlSession, no);
	}

	@Override
	public Object approvalDetailForm(int no, String form) {
		return apDao.approvalDetailForm(sqlSession, no, form);
	}

	@Override
	public ArrayList<Approval> approvalDetailLine(int no) {
		return apDao.approvalDetailLine(sqlSession, no);
	}

	@Override
	public int approvalOfApproval(String approvalUser, int documentNo) {
		return apDao.approvalOfApproval(sqlSession, approvalUser, documentNo);
	}

	@Override
	public Document saveListModify(int no, String form, String userNo) {
		return apDao.saveListModify(sqlSession, no, form, userNo);
	}

	@Override
	public int deleteApproval(int documentNo) {
		return apDao.deleteApproval(sqlSession, documentNo);
	}

	@Override
	public int approvalFusal(int documentNo, String msg, String userNo) {
		return apDao.approvalFusal(sqlSession, documentNo, msg, userNo);
	}
}
