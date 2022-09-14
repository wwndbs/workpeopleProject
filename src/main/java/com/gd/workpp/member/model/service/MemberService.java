package com.gd.workpp.member.model.service;

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
	
}
