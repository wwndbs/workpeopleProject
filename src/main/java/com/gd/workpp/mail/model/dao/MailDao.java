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
import com.gd.workpp.mail.model.vo.Spam;
import com.gd.workpp.mail.model.vo.SplitEmail;
import com.gd.workpp.mail.model.vo.Tag;

@Repository
public class MailDao {

	public ArrayList<Tag> selectTagList(SqlSessionTemplate sqlSession, String email){
		return (ArrayList)sqlSession.selectList("mailMapper.selectTagList", email);
	}
	
	public int insertTag(SqlSessionTemplate sqlSession, Tag t) {
		return sqlSession.insert("mailMapper.insertTag", t);
	}
	
	public int updateTag(SqlSessionTemplate sqlSession, Tag t) {
		return sqlSession.update("mailMapper.updateTag", t);
	}
	
	public int deleteTag(SqlSessionTemplate sqlSession, int tagNo) {
		return sqlSession.delete("mailMapper.deleteTag", tagNo);
	}
	
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
	
	public ArrayList<SplitEmail> selectPreviewSplitEmail(SqlSessionTemplate sqlSession, String email){
		return (ArrayList)sqlSession.selectList("mailMapper.selectPreviewSplitEmail", email);
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
	
	public List<String> selectSender(SqlSessionTemplate sqlSession, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");

		HashMap<String, Object> data = new HashMap<>();
		data.put("noArr", noArr);
		data.put("email", email);
		
		return sqlSession.selectList("mailMapper.selectSender", data);
	}
	
	public int insertSpam(SqlSessionTemplate sqlSession, String sender, String email) {
		HashMap<String, String> data = new HashMap<>();
		data.put("sender", sender);
		data.put("email", email);
		
		return sqlSession.insert("mailMapper.insertSpam", data);
	}
	
	public ArrayList<Mail> selectSentbox(SqlSessionTemplate sqlSession, PageInfo pi, String email){

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSentbox", email, rowBounds);
	}
	
	public Mail selectMailByNo(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.selectOne("mailMapper.selectMailByNo", mailNo);
	}
	
	public int selectOutboxListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("mailMapper.selectOutboxListcount", email);
	}
	
	public ArrayList<Mail> selectOutbox(SqlSessionTemplate sqlSession, PageInfo pi, String email){

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectOutbox", email, rowBounds);
	}
	
	public int updateTagAdd(SqlSessionTemplate sqlSession, int tagNo, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("tagNo", tagNo);
		data.put("noArr", noArr);
		data.put("email", email);
		
		return sqlSession.update("mailMapper.updateTagAdd", data);
	}	
	
	public int updateTagRemove(SqlSessionTemplate sqlSession, int tagNo, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("tagNo", tagNo);
		data.put("noArr", noArr);
		data.put("email", email);
		
		return sqlSession.update("mailMapper.updateTagRemove", data);
	}
	
	public int updateTagChange(SqlSessionTemplate sqlSession, String type, int tagNo, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("type", type);
		data.put("tagNo", tagNo);
		data.put("noArr", noArr);
		data.put("email", email);
		
		return sqlSession.update("mailMapper.updateTagChange", data);
	}
	
	public int deleteMail(SqlSessionTemplate sqlSession, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("noArr", noArr);
		data.put("email", email);
		
		return sqlSession.delete("mailMapper.deleteMail", data);
	}
	
	public ArrayList<Mail> selectToMe(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectToMe", email, rowBounds);
	}
	
	public int updateToMeTagChange(SqlSessionTemplate sqlSession, String type, int tagNo, int mailNo, String email, int mailType) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("type", type);
		data.put("tagNo", tagNo);
		data.put("mailNo", mailNo);
		data.put("email", email);
		data.put("mailType", mailType);
		
		return sqlSession.update("mailMapper.updateToMeTagChange", data);
	}
	
	public ArrayList<Mail> selectSpambox(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSpambox", email, rowBounds);
	}
	
	public ArrayList<Mail> selectEtcbox(SqlSessionTemplate sqlSession, PageInfo pi, int boxType, String email){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("boxType", boxType);
		data.put("email", email);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectEtcbox", data, rowBounds);
	}
	
	public int updateSpamCancle(SqlSessionTemplate sqlSession, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("noArr", noArr);
		data.put("email", email);
		
		return sqlSession.delete("mailMapper.updateSpamCancle", data);
	}
	
	public ArrayList<Spam> selectSpamAddr(SqlSessionTemplate sqlSession, String email){
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSpamAddr", email);
	}
	
	public int deleteSpam(SqlSessionTemplate sqlSession, String email, String deleteMail) {
		HashMap<String, String> data = new HashMap<>();
		data.put("email", email);
		data.put("deleteMail", deleteMail);

		return sqlSession.delete("mailMapper.deleteSpam", data);
	}
	
	public int realDelete(SqlSessionTemplate sqlSession, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("email", email);
		data.put("noArr", noArr);

		return sqlSession.delete("mailMapper.realDelete", data);
	}
	
	public int restoreMail(SqlSessionTemplate sqlSession, String checkMailNo, String email) {
		String[] noArr = checkMailNo.split(",");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("email", email);
		data.put("noArr", noArr);

		return sqlSession.delete("mailMapper.restoreMail", data);
	}

	public int vacateSpambox(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.delete("mailMapper.vacateSpambox", email);
	}
	
	public int vacateTrashbox(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.delete("mailMapper.vacateTrashbox", email);
	}
	
	public int deleteAttachmentbyFileNo(SqlSessionTemplate sqlSession, int fileNo) {
		return sqlSession.delete("mailMapper.deleteAttachmentbyFileNo", fileNo);
	}
	
	public int sendSaveMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.update("mailMapper.sendSaveMail", m);
	}

	public int insertMailStatusSaveMail(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.insert("mailMapper.insertMailStatusSaveMail", ms);
	}
	
}
