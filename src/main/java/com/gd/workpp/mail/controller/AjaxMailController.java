package com.gd.workpp.mail.controller;

import java.io.File;
import java.util.ArrayList;

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

@Controller
public class AjaxMailController {

	@Autowired
	private MailServiceImpl mService;
	
	@ResponseBody
	@RequestMapping(value="save.ma", produces="application/json; charset=UTF-8")
	public String saveMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		System.out.println(upfile.length);
		
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
	
}
