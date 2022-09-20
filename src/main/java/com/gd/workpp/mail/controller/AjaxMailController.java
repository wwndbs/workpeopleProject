package com.gd.workpp.mail.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.mail.model.service.MailServiceImpl;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class AjaxMailController {

	@Autowired
	private MailServiceImpl mService;
	
	/**
	 * Author : 정주윤
	 * 메일을 임시저장 하거나 이미 임시저장된 메일을 수정 처리해 주는 메소드
	 * @return result : 성공 여부
	 * @return mailNo : 임시저장 후 부여된 메일번호
	 */
	@ResponseBody
	@RequestMapping(value="save.ma", produces="application/json; charset=UTF-8")
	public String saveMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		
		ArrayList<Attachment> atList = new ArrayList<>();
		int result = 0;
		int mailNo = 0;
		
		if(m.getMailNo().equals("")) { // 처음 임시저장 (insert)
			
			for (int i = 0; i < upfile.length; i++) {

				// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드
				if (!upfile[i].getOriginalFilename().equals("")) {
					String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/mail_upfiles/");

					// 첨부파일의 원본명, 파일경로+수정명 담기
					atList.add(new Attachment(upfile[i].getOriginalFilename(), saveFilePath));
				}

			}
			
			// MAIL, ATTACHMENT에 INSERT
			result = mService.saveMail(m, atList);
			// mailNo 담기
			mailNo = mService.selectCurrMailNo();
			
		}else { // 이미 임시저장한 글 => 새로 임시저장 (update)

			mailNo = Integer.parseInt(m.getMailNo());
			
			// mailNo으로 ATTACHMENT 테이블 조회
			ArrayList<Attachment> saveMailAt = mService.selectAttachment(mailNo);
			
			if(!saveMailAt.isEmpty()) { // 해당 메일에 기존 첨부파일 있었을 경우
				// ATTACHMENT에 DELETE
				int atResult = mService.deleteAttachment(mailNo);
				
				if(atResult > 0) { // DELETE 성공 시 서버에 업로드된 파일도 삭제
					for(Attachment at : saveMailAt) {
						new File( session.getServletContext().getRealPath(at.getChangeName()) ).delete();
					}
				}
			}
			
			// 다시 새롭게 업로드
			for (int i = 0; i < upfile.length; i++) {

				if (!upfile[i].getOriginalFilename().equals("")) {
					String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/mail_upfiles/");

					// 첨부파일의 **참조메일번호**, 원본명, 파일경로+수정명 담기
					atList.add(new Attachment(mailNo, upfile[i].getOriginalFilename(), saveFilePath));
				}

			}
			
			// MAIL UPDATE, ATTACHMENT에 INSERT
			result = mService.updateSaveMail(m, atList);

		}
	
		JSONObject jObj = new JSONObject();
		jObj.put("result", result); 
		jObj.put("mailNo", mailNo); 
		
		return jObj.toJSONString();
	
	}
	
	/**
	 * Author : 정주윤
	 * 개별 메일의 중요 여부를 변경 처리해 주는 메소드
	 * @param type : {'Y': 중요메일로 변경, 'N': 중요메일 해제}
	 * @param no : 변경하고자 하는 메일번호
	 */
	@ResponseBody
	@RequestMapping(value="updateImp.ma", produces="text/html; charset=UTF-8")
	public String updateMailImportant(String type, int no, HttpSession session) {
		
		Member mem = (Member)session.getAttribute("loginUser");
		String email = mem.getEmail();
		
		int result = mService.updateMailImportant(type, no, email);
		
		return result > 0 ? "success" : "fail";

	}
	
	/**
	 * Author : 정주윤
	 * 개별 메일의 읽음 여부를 변경 처리해 주는 메소드
	 * @param type : {'Y': 읽은메일로 변경, 'N': 안읽은메일로 변경}
	 * @param no : 변경하고자 하는 메일번호
	 */
	@ResponseBody
	@RequestMapping(value="updateRead.ma", produces="text/html; charset=UTF-8")
	public String updateMailRead(String type, int no, HttpSession session) {
		
		Member mem = (Member)session.getAttribute("loginUser");
		String email = mem.getEmail();
		
		int result = mService.updateMailRead(type, no, email);
		
		return result > 0 ? "success" : "fail";

	}

	/**
	 * Author : 정주윤
	 * 체크박스로 선택된 메일들을 읽음 처리/스팸 처리/휴지통 이동 해주는 메소드
	 * @param type : 어떤 상태값을 변경할 건지 (읽음여부, 스팸여부, 삭제여부)
	 * @param checkMailNo : 선택된 메일번호들
	 */
	@ResponseBody
	@RequestMapping(value="updateStatus.ma", produces="text/html; charset=UTF-8")
	public String updateMailStatus(String type, String checkMailNo, HttpSession session) {

		Member mem = (Member)session.getAttribute("loginUser");
		String email = mem.getEmail();
		
		// 읽음처리, 스팸처리, 휴지통 이동처리
		int result1 = mService.updateMailStatus(type, checkMailNo, email);

		if(type == "mail_spam") { // 스팸 처리의 경우
			// 메일번호로 보낸사람 주소 조회
			List<String> senderList = new ArrayList<>();
			senderList = mService.selectSender(checkMailNo); // ["user24@workpp.com", "goodee@gmail.com"]
			
			// 보낸사람 주소를 스팸 목록에 추가
			int result2 = mService.insertSpam(senderList, email);
			
			return result1 * result2 > 0 ? "success" : "fail";
		}
		
		return result1 > 0 ? "success" : "fail";
		
	}
	
	
}
