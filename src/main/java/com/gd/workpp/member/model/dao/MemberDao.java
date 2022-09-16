package com.gd.workpp.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.common.model.vo.PageInfo;
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
	
	public int modifyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.modifyListCount");
	}
	
	public ArrayList<Member> modifyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.modifyList", null, rowBounds);
	}
	
	public Member selectmodifyMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.selectmodifyMember",userNo);
	}
	
	public int modifyMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.modifyMember",m);
	}
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.deleteMember",userNo);
	}
	
	public int telListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.telListCount");
	}
	
	public ArrayList<Member> telList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.telList", null, rowBounds);
	}
	
}
