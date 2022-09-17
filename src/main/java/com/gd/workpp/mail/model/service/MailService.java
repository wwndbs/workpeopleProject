package com.gd.workpp.mail.model.service;

import java.util.ArrayList;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;

public interface MailService {
	
	// 사이드바 태그 리스트 조회 서비스
	
	// 메일 작성하기 서비스
	int insertMail(Mail m, ArrayList<Attachment> atList);
	String selectUserName(String email);
	int insertMailStatus(ArrayList<MailStatus> ms);
	
	// 메일 임시저장 서비스
	int saveMail(Mail m, ArrayList<Attachment> atList);
	
	// 임시저장 후 해당 메일번호 조회
	int selectCurrMailNo();

	// 첨부파일 조회 서비스
	ArrayList<Attachment> selectAttachment(int refNo);
	
	// 첨부파일 삭제 서비스
	int deleteAttachment(int refNo);
	
	// 임시저장한 메일 수정 서비스
	int updateSaveMail(Mail m, ArrayList<Attachment> atList);
	
	// 받은메일함 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Mail> selectInboxList(PageInfo pi);
	
	// 메일 상세조회 서비스
	
	
	// 보낸메일함 리스트 페이지 서비스

	
	// 내게쓴메일함 리스트 페이지 서비스
	
	
	// 임시보관함 리스트 페이지 서비스
	
}
