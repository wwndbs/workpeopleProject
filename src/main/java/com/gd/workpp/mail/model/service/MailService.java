package com.gd.workpp.mail.model.service;

import java.util.ArrayList;
import java.util.List;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;
import com.gd.workpp.mail.model.vo.Spam;
import com.gd.workpp.mail.model.vo.SplitEmail;
import com.gd.workpp.mail.model.vo.Tag;

public interface MailService {
	
	// 사이드바 태그 리스트 조회 서비스
	ArrayList<Tag> selectTagList(String email);
	
	// 태그 추가 서비스
	int insertTag(Tag t);
	
	// 태그 수정 서비스
	int updateTag(Tag t);

	// 태그 삭제 서비스
	int deleteTag(int tagNo);
	
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
	
	// 받은메일함/보낸메일함/내게쓴메일함 전체 메일 개수
	int selectListCount(int boxType, String email);
	
	// 받은메일함/보낸메일함 안 읽은 메일 개수
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
	
	// 메일번호로 아직 스팸으로 등록되지 않은 주소 조회 서비스
	List<String> selectSender(String checkMailNo, String email);
	
	// 스팸 주소 등록 서비스
	int insertSpam(List<String> senderList, String email);
	
	// 보낸메일함 리스트 조회 서비스
	ArrayList<Mail> selectSentbox(PageInfo pi, String email);

	// 메일번호로 메일 조회 서비스
	Mail selectMailByNo(int mailNo);
	
	// 메일 태그 적용,해제 서비스
	int updateTagAdd(int tagNo, String checkMailNo, String email);
	int updateTagRemove(int tagNo, String checkMailNo, String email);
	int updateTagChange(String type, int tagNo, String checkMailNo, String email);
	
	// 내게쓴메일함 리스트 페이지 서비스
	
	// 임시보관함 전체 메일 개수
	int selectOutboxListcount(String email);

	// 임시보관함 리스트 조회 서비스
	ArrayList<Mail> selectOutbox(PageInfo pi, String email);
	
	// 메일 완전삭제 서비스
	int deleteMail(String checkMailNo, String email);
	
	// 내게쓴메일함 리스트 조회 서비스
	ArrayList<Mail> selectToMe(PageInfo pi, String email);

	// 내게쓴메일함에서 태그 적용,해제 서비스
	int updateToMeTagChange(String type, int tagNo, int mailNo, String email, int mailType);
	
	// 스팸메일함 리스트 페이지 서비스
	ArrayList<Mail> selectSpambox(PageInfo pi, String email);
	
	// 휴지통 리스트 페이지 서비스
	ArrayList<Mail> selectTrashbox(PageInfo pi, String email);
	
	// 스팸 정상신고 서비스 (받은메일함으로 이동)
	int updateSpamCancle(String checkMailNo, String email);
	
	// 스팸등록한 주소 조회 서비스
	ArrayList<Spam> selectSpamAddr(String email);
	
	// 스팸 주소 삭제 서비스
	int deleteSpam(String email, String deleteMail);
	
	// 휴지통에서 완전 삭제 서비스
	int realDelete(String checkMailNo, String email);
	
}
