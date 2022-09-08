package com.gd.workpp.member.model.service;

import com.gd.workpp.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
}
