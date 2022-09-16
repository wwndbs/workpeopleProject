package com.gd.workpp.mail.controller;

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
		
		ArrayList<Attachment> atList = new ArrayList<>();
		
		for (int i = 0; i < upfile.length; i++) {

			// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드
			if (!upfile[i].getOriginalFilename().equals("")) {
				String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/mail_upfiles/");

				// 첨부파일의 원본명, 파일경로+수정명
				atList.add(new Attachment(upfile[i].getOriginalFilename(), saveFilePath));
			}

		}
		
		// MAIL, ATTACHMENT에 INSERT
		int result = mService.saveMail(m, atList);
		String mailNo = mService.selectCurrMailNo();
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result); 
		jObj.put("mailNo", mailNo); 
		
		System.out.println("result : " + result);
		
		return jObj.toJSONString();
		
	}
	
}
