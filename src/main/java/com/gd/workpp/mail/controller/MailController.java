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
import com.gd.workpp.mail.model.vo.MailStatus;

@Controller
public class MailController {

	@Autowired
	private MailServiceImpl mService;
	
	@RequestMapping("main.wp")
	public String mainPage() {
		return "main";
	}

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
		//첨부파일 없으면 빈 문자열''이라도 넘어오니 upfile.length는 최소 1

		ArrayList<Attachment> atList = new ArrayList<>();
		
		for (int i = 0; i < upfile.length; i++) {

			// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드
			if (!upfile[i].getOriginalFilename().equals("")) {
				String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/mail_upfiles/");

				// 첨부파일의 원본명, 파일경로+수정명
				atList.add(new Attachment(upfile[i].getOriginalFilename(), saveFilePath));
			}

		}

		// 보낸사람 + 받은사람 + 참조 명수만큼 ArrayList에 담기
		ArrayList<MailStatus> msList = new ArrayList<>();
		
		// sender
		String userName = mService.selectUserName(m.getSender());
		msList.add(new MailStatus(m.getSender(), userName, 2));
		
		// receiver
		String[] receiverArr = m.getReceiver().split(","); // ["aaa.com", "bbb.com"]
		for(String receiver : receiverArr) {
			msList.add(new MailStatus(receiver, mService.selectUserName(receiver), 1));
		}
		
		// ref
		String[] refArr = m.getMailRef().split(","); // ["aaa.com", "bbb.com"]
		for(String ref : refArr) {
			msList.add(new MailStatus(ref, mService.selectUserName(ref), 3));
		}
		
		// MAIL 한 행 INSERT
		int result1 = mService.insertMail(m, atList);

		if(result1 > 0) { // MAIL INSERT 성공 => MAILSTATUS INSERT && 발송 성공 페이지 
			
			int result2 = mService.insertMailStatus(msList);
			
			if(result2 > 0) {
				return "mail/insertSuccess"; 
			}else {
				model.addAttribute("errorMsg", "메일 발송 실패"); 
				return "common/errorPage"; 
			}
			
		}else { // 실패
			model.addAttribute("errorMsg", "메일 발송 실패"); 
			return "common/errorPage"; 
		}
		
	}

	
}
