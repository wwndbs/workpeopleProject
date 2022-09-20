package com.gd.workpp.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.member.model.dao.MemberDao;
import com.gd.workpp.member.model.vo.Member;

@Service
public class MebmerServiceImpl implements MemberService{

	@Autowired // 자동으로 생성된 객체를 주입받아 사용
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(sqlSession,m);
		return loginUser;
	}


	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession,m);
	}


	@Override
	public int uploadProfileImg(Member m) {
		return mDao.uploadProfileImg(sqlSession,m);
	}


	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession,m);
	}


	@Override
	public int createMember(Member m) {
		return mDao.createMember(sqlSession,m);
	}


	@Override
	public int modifyListCount() {
		return mDao.modifyListCount(sqlSession);
	}


	@Override
	public ArrayList<Member> modifyList(PageInfo pi) {
		return mDao.modifyList(sqlSession, pi);
	}


	@Override
	public Member selectmodifyMember(int userNo) {
		return mDao.selectmodifyMember(sqlSession,userNo);
	}


	@Override
	public int modifyMember(Member m) {
		return mDao.modifyMember(sqlSession,m);
	}


	@Override
	public int deleteMember(int userNo) {
		return mDao.deleteMember(sqlSession,userNo);
	}


	@Override
	public int telListCount(String dep) {
		return mDao.telListCount(sqlSession,dep);
	}


	@Override
	public ArrayList<Member> telList(PageInfo pi, String dep) {
		return mDao.telList(sqlSession, pi,dep);
	}
	

	@Override
	public int searchTelListCount(String keyword) {
		return mDao.searchTelListCount(sqlSession,keyword);
	}


	@Override
	public ArrayList<Member> searchTelList(PageInfo pi, String keyword) {
		return mDao.searchTelList(sqlSession, pi, keyword);
	}

	

	


}
