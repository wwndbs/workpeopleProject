package com.gd.workpp.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.dao.MailDao;
import com.gd.workpp.mail.model.vo.Mail;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Mail> selectInboxList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertMail(Mail m, ArrayList<Attachment> atList) {
		int result1 = mDao.insertMail(sqlSession, m);
		
		int result2 = 1;
		
		if(!atList.isEmpty()) {
			for(Attachment at : atList) {
				System.out.println("at insert실행");
				result2 = mDao.insertAttachment(sqlSession, at);
			}
		}
		return result1 * result2;
	}


}
