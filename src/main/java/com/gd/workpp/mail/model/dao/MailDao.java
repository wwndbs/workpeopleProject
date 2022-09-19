package com.gd.workpp.mail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;
import com.gd.workpp.mail.model.vo.SplitEmail;

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
	
	public int selectCurrMailNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectCurrMailNo");
	}
	
	public int updateSaveMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.updateSaveMail", m);
	}
	
	public ArrayList<Attachment> selectAttachment(SqlSessionTemplate sqlSession, int refNo){
		return (ArrayList)sqlSession.selectList("mailMapper.selectAttachment", refNo);
	}
	
	public int deleteAttachment(SqlSessionTemplate sqlSession, int refNo) {
		return sqlSession.delete("mailMapper.deleteAttachment", refNo);
	}	
	
	public int updateSaveMailAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("mailMapper.updateSaveMailAttachment", at);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, int boxType, String email) {
		HashMap<String, String> data = new HashMap<>();
		data.put("boxType", String.valueOf(boxType));
		data.put("email", email);
		return sqlSession.selectOne("mailMapper.selectListCount", data);
	}
	
	public int selectNotReadCount(SqlSessionTemplate sqlSession, int boxType, String email) {
		HashMap<String, String> data = new HashMap<>();
		data.put("boxType", String.valueOf(boxType));
		data.put("email", email);
		return sqlSession.selectOne("mailMapper.selectNotReadCount", data);
	}
	
	public ArrayList<Mail> selectInbox(SqlSessionTemplate sqlSession, PageInfo pi, String email){

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectInbox", email, rowBounds);
	}
	
	public Mail selectMailDetail(SqlSessionTemplate sqlSession, int mailNo, int boxType, String email) {
		HashMap<String, String> data = new HashMap<>();
		data.put("mailNo", String.valueOf(mailNo));
		data.put("boxType", String.valueOf(boxType));
		data.put("email", email);
		
		return sqlSession.selectOne("mailMapper.selectMailDetail", data);
	}
	
	public ArrayList<SplitEmail> selectSplitEmail(SqlSessionTemplate sqlSession, String type, int mailNo){
		HashMap<String, String> data = new HashMap<>();
		data.put("type", type);
		data.put("mailNo", String.valueOf(mailNo));
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSplitEmail", data);
	}
	
	public int updateMailImportant(SqlSessionTemplate sqlSession, String type, int mailNo, String email) {
		HashMap<String, String> data = new HashMap<>();
		data.put("type", type);
		data.put("mailNo", String.valueOf(mailNo));
		data.put("email", email);
		
		return sqlSession.update("mailMapper.updateMailImportant", data);
	}
	
	public int updateMailRead(SqlSessionTemplate sqlSession, String type, int mailNo, String email) {
		HashMap<String, String> data = new HashMap<>();
		data.put("type", type);
		data.put("mailNo", String.valueOf(mailNo));
		data.put("email", email);
		
		return sqlSession.update("mailMapper.updateMailRead", data);
	}
	
	public int updateMailStatus(SqlSessionTemplate sqlSession, String type, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("type", type);
		data.put("noArr", noArr);
		data.put("email", email);
		
		return sqlSession.update("mailMapper.updateMailStatus", data);
	}
	
	public List<String> selectSender(SqlSessionTemplate sqlSession, String checkMailNo) {
		String[] noArr = checkMailNo.split(",");

		HashMap<String, String[]> data = new HashMap<>();
		data.put("noArr", noArr);
		
		return sqlSession.selectList("mailMapper.selectSender", data);
	}
	
	public int insertSpam(SqlSessionTemplate sqlSession, String sender, String email) {
		HashMap<String, String> data = new HashMap<>();
		data.put("sender", sender);
		data.put("email", email);
		
		System.out.println(sender);
		System.out.println(email);
		
		return sqlSession.insert("mailMapper.insertSpam", data);
	}
	
}
