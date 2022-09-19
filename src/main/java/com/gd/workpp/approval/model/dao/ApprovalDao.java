package com.gd.workpp.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.approval.model.vo.Approval;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.approval.model.vo.Plan;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.member.model.vo.Member;

@Repository
public class ApprovalDao {
	
	public int selectApprovalCount(SqlSessionTemplate sqlSession, int category, String userNo) {
		
		if(category == 5) {
			return sqlSession.selectOne("approvalMapper.selectApprovalCount_5", userNo);			
		}else {
			HashMap<String, String> data = new HashMap<>();
			data.put("category", String.valueOf(category));
			data.put("userNo", userNo);
			return sqlSession.selectOne("approvalMapper.selectApprovalCount", data);			
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
		
		if(category == 5) {
			return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList_5", userNo, rowBounds);			
		}else {
			HashMap<String, String> data = new HashMap<>();
			data.put("viewPage", String.valueOf(category));
			data.put("userNo", userNo);
			
			return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList", data, rowBounds);			
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
			for(int i = 0; i < approvalArr.length; i++) {
				data.put("approval", approvalArr[i]);
				data.put("order", String.valueOf(i + 1));
				
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
		
		int result1 = sqlSession.update("approvalMapper.insertDocument", data);
		int result2 = sqlSession.insert("approvalMapper.insertPlan", data);
		
		return result1 * result2; // 1행 업데이트, 1행 추가 = 결과값1이 성공
	}
	
	
	
}
