package com.gd.workpp.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.mail.model.service.MailServiceImpl;
import com.gd.workpp.mail.model.vo.Mail;

@Controller
public class MailController {

	@Autowired
	private MailServiceImpl mService;

	@RequestMapping("inbox.ma")
	public String selectInbox() {
		return "mail/inboxListView";
	}

	@RequestMapping("enrollForm.ma")
	public String enrollForm() {
		return "mail/mailEnrollForm";
	}

	@RequestMapping("insert.ma")
	public String insertMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {

		System.out.println(m);
		System.out.println("upfile 0번인덱스: " + upfile[0]); // 첨부파일 없으면 빈 문자열''이라도 넘어오니 upfile.length는 최소 1

		ArrayList<Attachment> atList = new ArrayList<>();

		for (int i = 0; i < upfile.length; i++) {

			// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드
			if (!upfile[i].getOriginalFilename().equals("")) {
				String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/mail_upfiles/");

				// 첨부파일의 원본명, 수정명 => ATTACHMENT에 INSERT
				atList.add(new Attachment(upfile[i].getOriginalFilename(), saveFilePath));
			}

		}

		System.out.println("atList" + atList);

		int result = mService.insertMail(m, atList);
		
		if(result > 0) { // 성공 => 발송 성공 페이지 
			return "mail/insertSuccess"; 
		}else { //실패
			model.addAttribute("errorMsg", "게시글 등록 실패"); 
			return "common/errorPage"; 
		}
		 
	}

	
	@RequestMapping("save.ma")
	public void saveMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		System.out.println("임시저장 컨트롤러");
	}

	
}
