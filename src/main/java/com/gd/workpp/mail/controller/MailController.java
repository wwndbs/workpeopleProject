package com.gd.workpp.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.mail.model.service.MailServiceImpl;
import com.gd.workpp.mail.model.vo.Mail;
import com.gd.workpp.mail.model.vo.MailStatus;
import com.gd.workpp.mail.model.vo.SplitEmail;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class MailController {

	@Autowired
	private MailServiceImpl mService;

	/**
	 * Author : 정주윤
	 * 메인페이지 이동 요청을 처리해 주는 메소드
	 */
	@RequestMapping("main.wp")
	public String mainPage() {
		return "main";
	}

	/**
	 * Author : 정주윤
	 * 메일 작성 페이지 이동 요청을 처리해 주는 메소드
	 */
	@RequestMapping("enrollForm.ma")
	public String enrollForm() {
		return "mail/mailEnrollForm";
	}

	/**
	 * Author : 정주윤
	 * 메일 발송 요청을 처리해 주는 메소드
	 */
	@RequestMapping("insert.ma")
	public String insertMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		// 첨부파일 없으면 빈 문자열''이라도 넘어오니 upfile.length는 최소 1

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
		for (String receiver : receiverArr) {
			msList.add(new MailStatus(receiver, mService.selectUserName(receiver), 1));
		}

		// ref
		if (!m.getMailRef().equals("")) { // 참조인이 있는 경우
			String[] refArr = m.getMailRef().split(",");
			for (String ref : refArr) {
				msList.add(new MailStatus(ref, mService.selectUserName(ref), 3));
			}
		}

		// MAIL 한 행 INSERT
		int result1 = mService.insertMail(m, atList);

		if (result1 > 0) { // MAIL INSERT 성공 => MAILSTATUS INSERT && 발송 성공 페이지

			int result2 = mService.insertMailStatus(msList);

			if (result2 > 0) {
				return "mail/insertSuccess";
			} else {
				model.addAttribute("errorMsg", "메일 발송 실패");
				return "common/errorPage";
			}

		} else { // 실패
			model.addAttribute("errorMsg", "메일 발송 실패");
			return "common/errorPage";
		}

	}
	
	/**
	 * Author : 정주윤
	 * 받은메일함 / 보낸메일함 조회 요청 처리하는 메소드
	 * @param currentPage : 요청한 페이지 번호
	 * @param boxType : {1:받은메일함, 2:받은메일함}
	 * @return
	 */
	@RequestMapping("box.ma") 
	public ModelAndView selectBox(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
									@RequestParam(value="boxType", defaultValue="1") int boxType,
									ModelAndView mv, HttpSession session) {
	
		Member mem = (Member)session.getAttribute("loginUser");
		String email = mem.getEmail();
		
		int listCount = mService.selectListCount(boxType, email);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		// 읽지 않은 메일 개수 조회
		int notReadCount = mService.selectNotReadCount(boxType, email);
		
		// 메일 리스트 조회
		ArrayList<Mail> list = new ArrayList<>();
		if(boxType == 1) { // 받은 메일함
			
			list = mService.selectInbox(pi, email);
			mv.setViewName("mail/inboxListView");
			
		}else if(boxType == 2) { // 보낸 메일함
			
			list = mService.selectSentbox(pi, email);
			mv.setViewName("mail/sentboxListView");
			
		}
		
		mv.addObject("listCount", listCount);
		mv.addObject("notReadCount", notReadCount);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		
		return mv;
		
	}
	
	/**
	 * Author : 정주윤
	 * 메일 상세 조회 요청 처리하는 메소드
	 * @param no : 조회하고자 하는 메일번호
	 * @param boxType : {1:받은메일함, 2:보낸메일함}
	 * @return
	 */
	@RequestMapping("detail.ma")
	public ModelAndView selectMailDetail(int no, @RequestParam(value="boxType", defaultValue="1") int boxType, ModelAndView mv, HttpSession session) {
		
		Member mem = (Member)session.getAttribute("loginUser");
		String email = mem.getEmail();
		
		// 메일 읽음 처리
		mService.updateMailRead("Y", no, email);
		
		// 게시글 조회
		Mail m = mService.selectMailDetail(no, boxType, email);
		// 첨부파일 조회
		ArrayList<Attachment> atList = mService.selectAttachment(no);
		
		// 받는사람, 참조인 메일주소+이름 배열로 조회
		ArrayList<SplitEmail> receiverList = mService.selectSplitEmail("receiver", no);
		ArrayList<SplitEmail> refList = mService.selectSplitEmail("mail_ref", no);
		
		if(boxType == 1) { // 받은 메일함에서 상세 보기
			mv.setViewName("mail/mailDetailView");
		}else if(boxType == 2) { // 보낸 메일함에서 상세 보기
			mv.setViewName("mail/sentboxDetailView");
		}
		
		mv.addObject("m", m);
		mv.addObject("atList", atList);
		mv.addObject("receiverList", receiverList);
		mv.addObject("refList", refList);
		
		return mv;
		
	}
	
	/**
	 * Author : 정주윤
	 * 메일 답장 페이지 요청 처리하는 메소드
	 * @param no : 답장하고자 하는 글번호
	 */
	@RequestMapping("reply.ma")
	public ModelAndView replyForm(int no, ModelAndView mv) {
		
		// 메일 번호로 보낸사람, 글제목 조회해 오기
		Mail m = mService.selectMailByNo(no);
		
		mv.addObject("type", "reply");
		mv.addObject("m", m);
		mv.setViewName("mail/mailEnrollForm");
		
		return mv;
	}
	
	@RequestMapping("relay.ma")
	public ModelAndView relayForm(int no, ModelAndView mv) {

		// 메일 번호로 보낸사람, 글제목, 내용 조회해 오기
		Mail m = mService.selectMailByNo(no);

		mv.addObject("type", "relay");
		mv.addObject("m", m);
		mv.setViewName("mail/mailEnrollForm");
		
		return mv;
		
	}
	
	@RequestMapping("outbox.ma")
	public ModelAndView selectOutbox(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		Member mem = (Member)session.getAttribute("loginUser");
		String email = mem.getEmail();
		
		int listCount = mService.selectOutboxListcount(email);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		// 메일 리스트 조회
		ArrayList<Mail> list = new ArrayList<>();
		list = mService.selectOutbox(pi, email);
		
		mv.setViewName("mail/outboxListView");
		
		mv.addObject("listCount", listCount);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		
		return mv;

	}
	
}
