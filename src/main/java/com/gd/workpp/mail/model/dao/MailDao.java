package com.gd.workpp.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;

@Repository
public class MailDao {

	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("mailMapper.insertAttachment", at);
	}
	
	public String selectUserName(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("mailMapper.selectUserName", email);
	}

	public int insertMailStatus(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.insert("mailMapper.insertMailStatus", ms);
	}
	
	public int saveMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.saveMail", m);
	}
	
	public String selectCurrMailNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectCurrMailNo");
	}
	
}
