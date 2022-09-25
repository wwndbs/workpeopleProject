package com.gd.workpp.mail.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.dao.MailDao;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;
import com.gd.workpp.mail.model.vo.Spam;
import com.gd.workpp.mail.model.vo.SplitEmail;
import com.gd.workpp.mail.model.vo.Tag;
import com.gd.workpp.member.model.vo.Member;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Tag> selectTagList(String email) {
		return mDao.selectTagList(sqlSession, email);
	}

	@Override
	public int insertTag(Tag t) {
		return mDao.insertTag(sqlSession, t);
	}
	
	@Override
	public int updateTag(Tag t) {
		return mDao.updateTag(sqlSession, t);
	}

	@Override
	public int deleteTag(int tagNo) {
		return mDao.deleteTag(sqlSession, tagNo);
	}
	
	@Override
	public int insertMail(Mail m, ArrayList<Attachment> atList) {
		int result1 = mDao.insertMail(sqlSession, m);
		
		int result2 = 1;
		
		if(!atList.isEmpty()) {
			for(Attachment at : atList) {
				result2 = mDao.insertAttachment(sqlSession, at);
			}
		}
		return result1 * result2;
	}

	@Override
	public String selectUserName(String email) {
		return mDao.selectUserName(sqlSession, email);
	}
	
	@Override
	public int insertMailStatus(ArrayList<MailStatus> msList) {
		int result = 0;
		
		for(MailStatus ms : msList) {
			result = mDao.insertMailStatus(sqlSession, ms);
		}
		
		return result;
	}

	@Override
	public int saveMail(Mail m, ArrayList<Attachment> atList) {
		int result1 = mDao.saveMail(sqlSession, m);
		
		int result2 = 1;
		if(!atList.isEmpty()) {
			for(Attachment at : atList) {
				result2 = mDao.insertAttachment(sqlSession, at);
			}
		}
		return result1 * result2;
	}
	
	@Override
	public int selectCurrMailNo() {
		return mDao.selectCurrMailNo(sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectAttachment(int refNo) {
		return mDao.selectAttachment(sqlSession, refNo);
	}
	
	@Override
	public int deleteAttachment(int refNo) {
		return mDao.deleteAttachment(sqlSession, refNo);
	}
	
	@Override
	public int updateSaveMail(Mail m, ArrayList<Attachment> atList) {
		int result1 = mDao.updateSaveMail(sqlSession, m);
		
		int result2 = 1;
		if(!atList.isEmpty()) {
			for(Attachment at : atList) {
				result2 = mDao.updateSaveMailAttachment(sqlSession, at);
			}
		}
		return result1 * result2;
	}
	
	@Override
	public int selectListCount(int boxType, String email) {
		return mDao.selectListCount(sqlSession, boxType, email);
	}
	
	@Override
	public int selectNotReadCount(int boxType, String email) {
		return mDao.selectNotReadCount(sqlSession, boxType, email);
	}

	@Override
	public ArrayList<Mail> selectInbox(PageInfo pi, String email) {
		return mDao.selectInbox(sqlSession, pi, email);
	}

	@Override
	public Mail selectMailDetail(int mailNo, int boxType, String email) {
		return mDao.selectMailDetail(sqlSession, mailNo, boxType, email);
	}

	@Override
	public ArrayList<SplitEmail> selectSplitEmail(String type, int mailNo) {
		return mDao.selectSplitEmail(sqlSession, type, mailNo);
	}

	@Override
	public int updateMailImportant(String type, int mailNo, String email) {
		return mDao.updateMailImportant(sqlSession, type, mailNo, email);
	}

	@Override
	public int updateMailRead(String type, int mailNo, String email) {
		return mDao.updateMailRead(sqlSession, type, mailNo, email);
	}

	@Override
	public int updateMailStatus(String type, String checkMailNo, String email) {
		return mDao.updateMailStatus(sqlSession, type, checkMailNo, email);
	}

	@Override
	public List<String> selectSender(String checkMailNo, String email) {
		return mDao.selectSender(sqlSession, checkMailNo, email);
	}

	@Override
	public int insertSpam(List<String> senderList, String email) {
		int result = 0;
		
		for(String sender : senderList) {
			if(!sender.equals(email)) { // 자신을 수신거부할 수는 없음
				result = mDao.insertSpam(sqlSession, sender, email);
			}
		}
		return result;
	}

	@Override
	public ArrayList<Mail> selectSentbox(PageInfo pi, String email) {
		return mDao.selectSentbox(sqlSession, pi, email);
	}

	@Override
	public Mail selectMailByNo(int mailNo) {
		return mDao.selectMailByNo(sqlSession, mailNo);
	}

	@Override
	public int selectOutboxListcount(String email) {
		return mDao.selectOutboxListCount(sqlSession, email);
	}

	@Override
	public ArrayList<Mail> selectOutbox(PageInfo pi, String email) {
		return mDao.selectOutbox(sqlSession, pi, email);
	}

	@Override
	public int updateTagAdd(int tagNo, String checkMailNo, String email) {
		return mDao.updateTagAdd(sqlSession, tagNo, checkMailNo, email);
	}

	@Override
	public int updateTagRemove(int tagNo, String checkMailNo, String email) {
		return mDao.updateTagRemove(sqlSession, tagNo, checkMailNo, email);
	}

	@Override
	public int updateTagChange(String type, int tagNo, String checkMailNo, String email) {
		return mDao.updateTagChange(sqlSession, type, tagNo, checkMailNo, email);
	}

	@Override
	public int deleteMail(String checkMailNo, String email) {
		return mDao.deleteMail(sqlSession, checkMailNo, email);
	}

	@Override
	public ArrayList<Mail> selectToMe(PageInfo pi, String email) {
		return mDao.selectToMe(sqlSession, pi, email);
	}

	@Override
	public int updateToMeTagChange(String type, int tagNo, int mailNo, String email, int mailType) {
		return mDao.updateToMeTagChange(sqlSession, type, tagNo, mailNo, email, mailType);
	}

	@Override
	public ArrayList<Mail> selectSpambox(PageInfo pi, String email) {
		return mDao.selectSpambox(sqlSession, pi, email);
	}

	@Override
	public ArrayList<Mail> selectTrashbox(PageInfo pi, String email) {
		return mDao.selectTrashbox(sqlSession, pi, email);
	}

	@Override
	public int updateSpamCancle(String checkMailNo, String email) {
		return mDao.updateSpamCancle(sqlSession, checkMailNo, email);
	}

	@Override
	public ArrayList<Spam> selectSpamAddr(String email) {
		return mDao.selectSpamAddr(sqlSession, email);
	}

	@Override
	public int deleteSpam(String email, String deleteMail) {
		return mDao.deleteSpam(sqlSession, email, deleteMail);
	}


	


}
