package com.gd.workpp.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {
	
	public int selectApprovalCount(SqlSessionTemplate sqlSession, int viewPage, String userNo) {
		HashMap<String, String> data = new HashMap<>();
		data.put("viewPage", String.valueOf(viewPage));
		data.put("userNo", userNo);
		return sqlSession.selectOne("approvalMapper.selectApprovalCount", data);
	}
	
	public ArrayList<Document> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, int viewPage, String userNo){
		HashMap<String, String> data = new HashMap<>();
		data.put("viewPage", String.valueOf(viewPage));
		data.put("userNo", userNo);
		
		int limit = pi.getBoardLimit();
		int offset =(pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList", data, rowBounds);
	}
	
	public int selectReferenceCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("approvalMapper.selectReferenceCount", userNo);
	}
}
