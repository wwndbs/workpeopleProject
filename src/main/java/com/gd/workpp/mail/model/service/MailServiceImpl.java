package com.gd.workpp.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.dao.MailDao;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

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
	public String selectCurrMailNo() {
		return mDao.selectCurrMailNo(sqlSession);
	}
	
	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Mail> selectInboxList(PageInfo pi) {
		return null;
	}



}
