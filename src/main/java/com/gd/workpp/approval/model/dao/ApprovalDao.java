package com.gd.workpp.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.approval.model.vo.Document;
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
}
