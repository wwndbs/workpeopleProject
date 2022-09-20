package com.gd.workpp.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.workpp.approval.model.vo.Document;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.dao.MemberDao;
import com.gd.workpp.member.model.service.MemberService;
import com.gd.workpp.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class AjaxMemberController {
	
	@Autowired // 자동으로 생성된 객체를 주입받아 사용
	private SqlSessionTemplate sqlSession;
	
	@Autowired 
	private MemberService mService;
	
	
	@ResponseBody
	@RequestMapping(value="searchtel.me", produces="application/json; charset=UTF-8")
	public String searchTel(@RequestParam(value="cpage", defaultValue="1")int currentPage,
			                     String keyword, HttpSession session) {
		int listCount = mService.searchTelListCount(keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 12);
		ArrayList<Member> list = mService.searchTelList(pi, keyword);

		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		return new Gson().toJson(map);
	}

}
