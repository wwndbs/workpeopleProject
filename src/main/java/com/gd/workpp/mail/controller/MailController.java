package com.gd.workpp.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void insertMail(Mail m) {
		
	}
	
}
