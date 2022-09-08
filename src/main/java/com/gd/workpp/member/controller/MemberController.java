package com.gd.workpp.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.member.model.service.MemberService;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired 
	private MemberService mService;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
	
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { // 실패
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("common/errorPage");
		}else { // 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
}
