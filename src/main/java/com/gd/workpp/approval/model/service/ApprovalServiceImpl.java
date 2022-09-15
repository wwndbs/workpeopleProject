package com.gd.workpp.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.approval.model.dao.ApprovalDao;
import com.gd.workpp.approval.model.vo.Document;
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
	public ArrayList<Document> selectApprovalList(PageInfo pi, int category, String userNo) {
		return apDao.selectApprovalList(sqlSession, pi, category, userNo);
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
	
	
}
