package com.gd.workpp.member.model.service;

import java.util.ArrayList;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 개인 정보 수정 서비스 (update)
	int updateMember(Member m);
	
	// 프로필 이미지 변경 서비스 (update)
	int uploadProfileImg(Member m);
	
	// 비밀번호 변경 서비스
	int updatePwd(Member m);
	
	// 회원생성 서비스 (insert)
	int createMember(Member m);
	
	// 사원 정보 수정 리스트 페이지 서비스 (페이징)
	int modifyListCount();
	ArrayList<Member> modifyList(PageInfo pi);
	
	// 사원수정 상세조회 서비스
	Member selectmodifyMember(int userNo);
	
	// 사원 정보 수정 서비스
	int modifyMember(Member m);
	
	// 사원정보 삭제 서비스
	int deleteMember(int userNo);
	
	// 주소록 리스트 페이지 서비스 (페이징)
	int searchTelListCount(String keyword);
	int telListCount();
	ArrayList<Member> telList(PageInfo pi);
	ArrayList<Member> searchTelList(PageInfo pi,String keyword);
	
}
