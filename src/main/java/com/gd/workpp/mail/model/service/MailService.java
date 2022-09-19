package com.gd.workpp.mail.model.service;

import java.util.ArrayList;
import java.util.List;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;
import com.gd.workpp.mail.model.vo.SplitEmail;

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
	
	// 메일함별 전체 메일 개수
	int selectListCount(int boxType, String email);
	
	// 메일함별 안 읽은 메일 개수
	int selectNotReadCount(int boxType, String email);
	
	// 받은메일함 리스트 조회 서비스
	ArrayList<Mail> selectInbox(PageInfo pi, String email);
	
	// 메일 상세조회 서비스
	Mail selectMailDetail(int mailNo, int boxType, String email);
	
	// 받는사람,참조인 메일주소+이름 배열로 조회
	ArrayList<SplitEmail> selectSplitEmail(String type, int mailNo);
	
	// 메일 중요 여부 변경 서비스
	int updateMailImportant(String type, int mailNo, String email);

	// 메일 읽음 여부 변경 서비스
	int updateMailRead(String type, int mailNo, String email);
	
	// 체크박스 선택 시 스팸 여부, 읽음 여부 변경 서비스
	int updateMailStatus(String type, String checkMailNo, String email);
	
	// 메일번호로 보낸 사람 조회 서비스
	List<String> selectSender(String checkMailNo);
	
	// 스팸 주소 등록 서비스
	int insertSpam(List<String> senderList, String email);
	
	// 보낸메일함 리스트 페이지 서비스

	
	// 내게쓴메일함 리스트 페이지 서비스
	
	
	// 임시보관함 리스트 페이지 서비스
	
}
