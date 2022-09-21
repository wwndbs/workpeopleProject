package com.gd.workpp.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.approval.model.vo.Absence;
import com.gd.workpp.approval.model.vo.Approval;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.approval.model.vo.Overtime;
import com.gd.workpp.approval.model.vo.Plan;
import com.gd.workpp.approval.model.vo.Vacation;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.member.model.vo.Member;

@Repository
public class ApprovalDao {
	
	public int selectApprovalCount(SqlSessionTemplate sqlSession, int category, String userNo) {
		// 1진행, 2완료, 3반려, 4전체, 0대기
		
		if(category > 0) {
			HashMap<String, String> data = new HashMap<>();
			data.put("category", String.valueOf(category));
			data.put("userNo", userNo);
			return sqlSession.selectOne("approvalMapper.selectApprovalAllCount", data);
		}else {
			return sqlSession.selectOne("approvalMapper.selectApprovalCount", userNo);
		}
	}
	
	public int searchApprovalCount(SqlSessionTemplate sqlSession, String userNo, String keyword) {
		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("keyword", keyword);
		return sqlSession.selectOne("approvalMapper.searchApprovalCount", data);
	}
	
	public ArrayList<Document> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, int category, String userNo){
		int limit = pi.getBoardLimit();
		int offset =(pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(category > 0) {
			HashMap<String, String> data = new HashMap<>();
			data.put("category", String.valueOf(category));
			data.put("userNo", userNo);
			return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalAllList", data, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList", userNo, rowBounds);
		}
	}
	
	public ArrayList<Document> searchApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo, String keyword){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("keyword", keyword);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.searchApprovalList", data, rowBounds);
	}
	
	public int selectReferenceCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("approvalMapper.selectReferenceCount", userNo);
	}
	
	public ArrayList<Document> selectReferenceList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectReferenceList", userNo, rowBounds);
	}
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, String dept){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMemberList", dept);
	}
	
	public int selectSaveListCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("approvalMapper.selectSaveListCount", userNo);
	}
	
	public ArrayList<Document> selectSaveList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSaveList", userNo, rowBounds);
	}
	
	public int deleteSaveList(SqlSessionTemplate sqlSession, String[] noArr) {
		HashMap<String, String[]> no = new HashMap<>();
		no.put("noArr", noArr);
		return sqlSession.delete("approvalMapper.deleteSaveList", no);
	}
	
	public int searchSaveListCount(SqlSessionTemplate sqlSession, String userNo, String keyword) {
		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("keyword", keyword);
		
		return sqlSession.selectOne("approvalMapper.searchSaveListCount", data);
	}
	
	public ArrayList<Document> searchSaveList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo, String keyword){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("keyword", keyword);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.searchSaveList", data, rowBounds);
	}
	
	public int searchReferenceCount(SqlSessionTemplate sqlSession, String userNo, String keyword) {
		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("keyword", keyword);
		
		return sqlSession.selectOne("approvalMapper.searchReferenceCount", data);
	}
	
	public ArrayList<Document> searchReferenceList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo, String keyword) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("keyword", keyword);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.searchReferenceList", data, rowBounds);
	}
	
	public int insertTemporaryApproval(SqlSessionTemplate sqlSession, String userNo, String form) {
		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("form", form);
		
		return sqlSession.insert("approvalMapper.insertTemporaryApproval", data);
	}
	
	public Document selectTemporaryApproval(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("approvalMapper.selectTemporaryApproval", userNo);
	}
	
	public ArrayList<Approval> approvalLineView(SqlSessionTemplate sqlSession, int documentNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.approvalLineView", documentNo);
	}
	
	public void backPage(SqlSessionTemplate sqlSession, String userNo, int documentNo) {
		HashMap<String, String> data = new HashMap<>();
		data.put("userNo", userNo);
		data.put("documentNo", String.valueOf(documentNo));
		
		sqlSession.delete("approvalMapper.deleteApprovalLine", data);
		sqlSession.delete("approvalMapper.deleteTemporaryApproval", userNo);
		sqlSession.update("approvalMapper.seqIncrementSet"); // 시퀀스 증가값 -1로 설정
		sqlSession.selectOne("approvalMapper.seqRun"); // 시퀀스 증가값 -1상태로 실행
		sqlSession.update("approvalMapper.seqRollback"); // 시퀀스 증가값 1로 재설정
	}
	
	public ArrayList<Member> insertCheck(SqlSessionTemplate sqlSession, String[] userNoArr){
		HashMap<String, String[]> no = new HashMap<>();
		no.put("userNoArr", userNoArr);
		return (ArrayList)sqlSession.selectList("approvalMapper.insertCheck", no);
	}
	
	public ArrayList<Member> excludeCheck(SqlSessionTemplate sqlSession, String[] userNoArr){
		HashMap<String, String[]> no = new HashMap<>();
		no.put("userNoArr", userNoArr);
		return (ArrayList)sqlSession.selectList("approvalMapper.excludeCheck", no);
	}
	
	public int insertApprovalAndReference(SqlSessionTemplate sqlSession, String[] approvalArr, String[] referenceArr, int documentNo) {
		HashMap<String, String> data = new HashMap<>();
		data.put("documentNo", String.valueOf(documentNo));
		
		int approvalResult = 0; // 결재선 insert결과값
		int referenceResult = 0; // 참조 isnert결과값
		
		if(approvalArr.length > 0) {
			for(int i = approvalArr.length; i > 0; i--) {
				data.put("approval", approvalArr[i - 1]);
				data.put("order", String.valueOf(i));
				
				approvalResult += sqlSession.insert("approvalMapper.insertApproval", data);
				
				data.remove("approval");
				data.remove("order");
			}
		}
	
		if(referenceArr.length > 0) {
			for(int i = 0; i < referenceArr.length; i++) {
				data.put("reference", referenceArr[i]);
				
				referenceResult += sqlSession.insert("approvalMapper.insertReference", data);
				
				data.remove("reference");
			}	
		}
		
		return approvalResult + referenceResult;
	}
	
	public int insertApprovalPlan(SqlSessionTemplate sqlSession, Document document, Plan plan) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("document", document);
		data.put("plan", plan);
		
		int result1;
		int result2;
		
		result1 = sqlSession.update("approvalMapper.insertDocument", data);
		
		if(document.getStatus() == 1) {
			result2 = sqlSession.insert("approvalMapper.insertPlan", data);
		}else {
			result2 = 0;
		}
		
		return result1 + result2;
	}
	
	public int insertApprovalAbsence(SqlSessionTemplate sqlSession, Document document, Absence absence) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("document", document);
		data.put("absence", absence);
		
		int result1;
		int result2;
		
		result1 = sqlSession.update("approvalMapper.insertDocument", data);
		
		if(document.getStatus() == 1) {
			result2 = sqlSession.insert("approvalMapper.insertAbsence", data);
		}else {
			result2 = 0;
		}
		
		return result1 + result2;
	}
	
	public int insertApprovalVacation(SqlSessionTemplate sqlSession, Document document, Vacation vacation) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("document", document);
		data.put("vacation", vacation);
		
		int result1;
		int result2;
		
		result1 = sqlSession.update("approvalMapper.insertDocument", data);
		
		result2 = sqlSession.insert("approvalMapper.insertVacation", data);
		/*
		 * if(document.getStatus() == 1) { }else { result2 = 0; }
		 */
		
		return result1 + result2;
	}
	
	public int insertApprovalOvertime(SqlSessionTemplate sqlSession, Document document, Overtime overtime) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("document", document);
		data.put("overtime", overtime);
		
		System.out.println(overtime.getWorkStart());
		System.out.println(overtime.getWorkEnd());
		
		int result1;
		int result2;
		
		result1 = sqlSession.update("approvalMapper.insertDocument", data);
		
		if(document.getStatus() == 1) {
			result2 = sqlSession.insert("approvalMapper.insertOvertime", data);
		}else {
			result2 = 0;
		}
		
		return result1 + result2;
	}
	
	public Document approvalDetail(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("approvalMapper.approvalDetail", no);
	}
	
	public Object approvalDetailForm(SqlSessionTemplate sqlSession, int no, String form) {
		if(form.equals("업무기안서")) {
			return sqlSession.selectOne("approvalMapper.approvalDetailPlan", no);
		}else if(form.equals("휴가신청서")) {
			return sqlSession.selectOne("approvalMapper.approvalDetailVacation", no);
		}else if(form.equals("결근사유서")){
			return sqlSession.selectOne("approvalMapper.approvalDetailAbsence", no);
		}else {
			return sqlSession.selectOne("approvalMapper.approvalDetailOvertime", no);			
		}
	}
	
	public ArrayList<Approval> approvalDetailLine(SqlSessionTemplate sqlSession, int no){
		return (ArrayList)sqlSession.selectList("approvalMapper.approvalDetailLine", no);
	}
	
	public int approvalOfApproval(SqlSessionTemplate sqlSession, String approvalUser, int documentNo) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("approvalUser", approvalUser);
		data.put("documentNo", documentNo);
		
		int result1;
		int result2;
		
		int approvalCountCheck = sqlSession.selectOne("approvalMapper.approvalStatusCheck", data);
		System.out.println(approvalCountCheck);
		if(approvalCountCheck == 1) {
			System.out.println("ASdddddddddddd");
			result1 = sqlSession.update("approvalMapper.updateDocumentApprovalCount", data);
			result2 = sqlSession.update("approvalMapper.updateApprovalStatus", data);
			sqlSession.update("approvalMapper.updateProgress", data);
		}else {
			result1 = sqlSession.update("approvalMapper.updateDocumentApprovalCount", data);
			result2 = sqlSession.update("approvalMapper.updateApprovalStatus", data);
		}
		
		return result1 * result2; // 1 or 0
	}
	
	public Document saveListModify(SqlSessionTemplate sqlSession, int no, String form, String userNo) {
		HashMap<String, String> data = new HashMap<>();
		data.put("no", String.valueOf(no));
		data.put("form", form);
		data.put("userNo", userNo);
		return sqlSession.selectOne("approvalMapper.saveListModify", data);
	}
	
	public int deleteApproval(SqlSessionTemplate sqlSession, int documentNo) {
		int result = sqlSession.delete("approvalMapper.deleteApproval", documentNo);
		
		return result;
	}
	
	public int approvalFusal(SqlSessionTemplate sqlSession, int documentNo, String msg, String userNo) {
		HashMap<String, String> data = new HashMap<>();
		data.put("documentNo", String.valueOf(documentNo));
		data.put("msg", msg);
		data.put("userNo", userNo);
		
		int result1 = sqlSession.update("approvalMapper.approvalLineFusal", data);
		int result2 = sqlSession.update("approvalMapper.approvalFusal", data);
		
		return result1 * result2;
	}
	
}
