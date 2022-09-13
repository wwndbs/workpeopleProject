package com.gd.workpp.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {
	
	public int selectApprovalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("approvalMapper.selectApprovalCount");
	}
	
	public ArrayList<Document> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset =(pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList", null, rowBounds);
	}
}
