package com.gd.workpp.mail.model.service;

import java.util.ArrayList;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.vo.Mail;

public interface MailService {
	
	// 사이드바 태그 리스트 조회 서비스
	
	
	// 받은메일함 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Mail> selectInboxList(PageInfo pi);
	
	// 메일 작성하기 서비스
	int insertMail(Mail m);
	
	// 메일 상세조회 서비스
	
	
	// 보낸메일함 리스트 페이지 서비스

	
	// 내게쓴메일함 리스트 페이지 서비스
	
	
	// 임시보관함 리스트 페이지 서비스
	
}
