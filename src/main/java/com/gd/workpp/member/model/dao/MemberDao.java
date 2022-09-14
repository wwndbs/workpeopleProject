package com.gd.workpp.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.member.model.vo.Member;

@Repository // 빈으로 등록하기 ( 의존성 주입 ) Dao 에는 Respoitory를 붙여서 빈으로 등록
public class MemberDao {

	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}
	
	public int uploadProfileImg(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.uploadProfileImg",m);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd",m);
	}
	
	public int createMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.createMember",m);
	}
	
}
