package com.gd.workpp.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.approval.model.dao.ApprovalDao;
import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalDao apDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectApprovalCount() {
		return apDao.selectApprovalCount(sqlSession);
	}

	@Override
	public ArrayList<Document> selectApprovalList(PageInfo pi) {
		return apDao.selectApprovalList(sqlSession, pi);
	}
	
	
}
