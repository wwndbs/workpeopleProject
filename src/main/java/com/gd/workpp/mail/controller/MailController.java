package com.gd.workpp.mail.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	 * 메일 작성 중 미리보기 팝업창 띄우기 처리해 주는 메소드
	 */
	@RequestMapping("enrollPreview.ma")
	public ModelAndView openPreview(Mail m, MultipartFile[] upfile, ModelAndView mv) {
		
		// 받는사람, 참조인 메일주소+이름 배열로 조회
		ArrayList<SplitEmail> receiverList = mService.selectPreviewSplitEmail(m.getReceiver());
		ArrayList<SplitEmail> refList = mService.selectPreviewSplitEmail(m.getMailRef());
		
		String[] atOriginNameList = new String[upfile.length];
		for (int i = 0; i < upfile.length; i++) {

			// 전달된 파일이 있을 경우 => 파일명만 전달
			if (!upfile[i].getOriginalFilename().equals("")) {
				atOriginNameList[i] = upfile[i].getOriginalFilename();
			}

		}
		
		mv.addObject("m", m);
		mv.addObject("receiverList", receiverList);
		mv.addObject("refList", refList);
		mv.addObject("atOriginNameList", atOriginNameList);
		mv.setViewName("mail/enrollPreview");
		
		return mv;
		
	}

	/**
	 * Author : 정주윤 
	 * 메일 발송 요청을 처리해 주는 메소드
	 */
	@RequestMapping("insert.ma")
	public String insertMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request) {
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

		// receiver + 최근 주소 쿠키 처리
		String loginUserNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		// 1) 기존 쿠키 불러오기
		Cookie[] cookies = request.getCookies();
		String originCookieVal = "";
		for(Cookie cookie : cookies) {  // ["00024=aaa@gmail.com_bbb@workpp.com_ccc@workpp.com"]
			if(cookie.getName().equals(loginUserNo)){ // 쿠키 키값이 로그인한 사원의 사원번호와 일치할 경우
				originCookieVal = cookie.getValue() + "_"; // "aaa@gmail.com_bbb@workpp.com_ccc@workpp.com_"
			}
		}
		
		// 2) 메일 발송 시 입력한 receiver에서 중복 제거
		String receivers = m.getReceiver().replace(",", "_"); // 쿠키에 추가할 변수. "bbb@gmail.com_ddd@workpp.com"
		
		String[] receiverArr = m.getReceiver().split(","); // ["bbb@gmail.com", "ddd@workpp.com"]
		for (String receiver : receiverArr) {
			msList.add(new MailStatus(receiver, mService.selectUserName(receiver), 1));
			
			if(originCookieVal.contains(receiver)) { // 기존 쿠키에 있는 주소이면 쿠키에 추가할 변수에서 해당 주소를 빈 문자열로 치환 (중복 방지)
				receivers = receivers.replace("_" + receiver, "");
				receivers = receivers.replace(receiver + "_", "");
				receivers = receivers.replace(receiver, "");
			}
		}
		
		// 3) 기존 쿠키에 동일한 키값(loginUserNo)으로 부여하기
		Cookie cookie = new Cookie(loginUserNo, originCookieVal + receivers); 
		response.addCookie(cookie);

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
			
		}else { // 실패
			model.addAttribute("errorMsg", "메일 발송 실패");
			return "common/errorPage";
		}

	}

	/**
	 * Author : 정주윤 메일 전달 요청을 처리해 주는 메소드
	 * @param existFileNo : 전달 시에 삭제하지 않고 남아있는 파일번호
	 * @param originMailNo : 원글의 메일번호
	 */
	@RequestMapping("insertRelay.ma")
	public String insertRelay(String existFileNo, int originMailNo, Mail m, MultipartFile[] upfile, HttpSession session, Model model) {

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
		
		ArrayList<Attachment> atList = new ArrayList<>();
		
		// 원글의 첨부파일 리스트 조회
		ArrayList<Attachment> originFile = mService.selectAttachment(originMailNo);

		String[] exist = existFileNo.split(",");

		if (originFile.size() == exist.length) { // 원글 첨부파일 개수와 삭제하지 않은 첨부파일 개수가 동일 => 원글 첨부파일 전부 전달
			
			// 새로 첨부한 파일 있을 경우 업로드
			for (int i = 0; i < upfile.length; i++) {
				if (!upfile[i].getOriginalFilename().equals("")) {
					
					String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/mail_upfiles/");
					atList.add(new Attachment(upfile[i].getOriginalFilename(), saveFilePath));
				
				}
			}

			// 원글 첨부파일에서 참조메일번호만 refNo currval로 insert
			for(Attachment at : originFile) {
				atList.add(new Attachment(at.getOriginName(), at.getChangeName()));
			}
			
		} else { // 원글 첨부파일 일부 삭제했음

			// 새로 첨부한 파일 있을 경우 업로드
			for (int i = 0; i < upfile.length; i++) {
				if (!upfile[i].getOriginalFilename().equals("")) {
					
					String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/mail_upfiles/");
					atList.add(new Attachment(upfile[i].getOriginalFilename(), saveFilePath));
				
				}
			}
			
			// 삭제하지 않은 원글파일만 refNo currval로 insert
			for(int i=0; i<originFile.size(); i++) {
				
				if(i < exist.length) {
					// 원글 첨부파일의 파일번호가 삭제하지 않은 첨부파일의 번호와 일치할 경우
					if(originFile.get(i).getFileNo() == Integer.parseInt(exist[i])) { 
						atList.add(new Attachment(originFile.get(i).getOriginName(), originFile.get(i).getChangeName()));
					}
				}
				
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
	 * 받은메일함 / 보낸메일함 / 내게쓴메일함 / 스팸메일함 / 휴지통 조회 요청 처리해 주는 메소드
	 * @param currentPage : 요청한 페이지 번호
	 * @param boxType     : {1:받은메일함, 2:받은메일함, 3:내게쓴메일함, 4:스팸메일함, 5:휴지통, 6: 중요메일함, 7: 안읽은메일함}
	 */
	@RequestMapping("box.ma")
	public ModelAndView selectBox(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, 
								  @RequestParam(value = "boxType", defaultValue = "1") int boxType, ModelAndView mv, HttpSession session) {

		Member mem = (Member) session.getAttribute("loginUser");
		String email = mem.getEmail();

		int listCount = mService.selectListCount(boxType, email);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 18);

		// 읽지 않은 메일 개수 조회
		int notReadCount = mService.selectNotReadCount(boxType, email);

		// 메일 리스트 조회
		ArrayList<Mail> list = new ArrayList<>();
		if (boxType == 1){ // 받은 메일함

			list = mService.selectInbox(pi, email);
			mv.setViewName("mail/inboxListView");

		}else if (boxType == 2){ // 보낸 메일함

			list = mService.selectSentbox(pi, email);
			mv.setViewName("mail/sentboxListView");

		}else if (boxType == 3){ // 내게쓴메일함
			list = mService.selectToMe(pi, email);
			mv.setViewName("mail/toMeListView");
			
		}else if (boxType == 4){ // 스팸메일함
			
			list = mService.selectSpambox(pi, email);
			mv.setViewName("mail/spamboxListView");
			
		}else if (boxType == 5){ // 휴지통

			list = mService.selectEtcbox(pi, boxType, email);
			mv.setViewName("mail/trashboxListView");
			
		}else if (boxType == 6){ // 중요메일함

			list = mService.selectEtcbox(pi, boxType, email);
			mv.setViewName("mail/etcListView");
			mv.addObject("boxType", boxType);
			
		}else if (boxType == 7){ // 안읽은메일함

			list = mService.selectEtcbox(pi, boxType, email);
			mv.setViewName("mail/etcListView");
			mv.addObject("boxType", boxType);
			
		}

		mv.addObject("listCount", listCount);
		mv.addObject("notReadCount", notReadCount);
		mv.addObject("pi", pi);
		mv.addObject("list", list);

		return mv;

	}

	/**
	 * Author : 정주윤 
	 * 메일 상세 조회 요청 처리해 주는 메소드
	 * @param no      : 조회하고자 하는 메일번호
	 * @param boxType : {1:받은메일함, 2:보낸메일함, 3:내게쓴메일함, 4:스팸메일함, 5:휴지통, 6:중요메일함, 7:안읽은메일함}
	 * @param preview : {1:미리보기 아님, 2:미리보기}
	 */
	@RequestMapping("detail.ma")
	public ModelAndView selectMailDetail(int no, @RequestParam(value = "boxType", defaultValue = "1") int boxType,
										@RequestParam(value = "preview", defaultValue = "1") int preview, ModelAndView mv, HttpSession session) {

		Member mem = (Member) session.getAttribute("loginUser");
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

		mv.setViewName("mail/mailDetailView");

		mv.addObject("m", m);
		mv.addObject("atList", atList);
		mv.addObject("receiverList", receiverList);
		mv.addObject("refList", refList);
		mv.addObject("boxType", boxType);
		mv.addObject("preview", preview);
		
		return mv;

	}
	

	/**
	 * Author : 정주윤 
	 * 메일 답장 페이지 요청 처리해 주는 메소드
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

	/**
	 * Author : 정주윤 
	 * 메일 전달 / 임시보관함->작성 페이지 요청 처리해 주는 메소드
	 * @param no : 전달하고자 하는 글번호
	 * @param type : {relay:전달, out:임시보관}
	 */
	@RequestMapping("relay.ma")
	public ModelAndView relayForm(String type, int no, ModelAndView mv) {

		// 메일 번호로 글제목, 내용 조회해 오기
		Mail m = mService.selectMailByNo(no);
		// 첨부파일 조회해 오기
		ArrayList<Attachment> atList = mService.selectAttachment(no);
		
		mv.addObject("type", type);
		mv.addObject("m", m);
		mv.addObject("relayAtList", atList);
		mv.setViewName("mail/mailEnrollForm");

		return mv;

	}

	/**
	 * Author : 정주윤 
	 * 임시보관함 조회 요청 처리해 주는 메소드
	 */
	@RequestMapping("outbox.ma")
	public ModelAndView selectOutbox(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
									 ModelAndView mv, HttpSession session) {

		Member mem = (Member) session.getAttribute("loginUser");
		String email = mem.getEmail();

		int listCount = mService.selectOutboxListcount(email);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 18);

		// 메일 리스트 조회
		ArrayList<Mail> list = new ArrayList<>();
		list = mService.selectOutbox(pi, email);

		mv.setViewName("mail/outboxListView");

		mv.addObject("listCount", listCount);
		mv.addObject("pi", pi);
		mv.addObject("list", list);

		return mv;

	}
	
	@RequestMapping("sendSave.ma")
	public String sendSaveMail(String deleteFileNo, Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		int mailNo = Integer.parseInt(m.getMailNo());
		deleteFileNo = deleteFileNo.substring(0,deleteFileNo.lastIndexOf(",")); 
    	
		
		// 보낸사람 + 받은사람 + 참조 명수만큼 ArrayList에 담기 (mailNo 담아서)
		ArrayList<MailStatus> msList = new ArrayList<>();

		// sender
		String userName = mService.selectUserName(m.getSender());
		msList.add(new MailStatus(mailNo, m.getSender(), userName, 2));

		// receiver
		String[] receiverArr = m.getReceiver().split(","); // ["aaa.com", "bbb.com"]
		for (String receiver : receiverArr) {
			msList.add(new MailStatus(mailNo, receiver, mService.selectUserName(receiver), 1));
		}

		// ref
		if (!m.getMailRef().equals("")) { // 참조인이 있는 경우
			String[] refArr = m.getMailRef().split(",");
			for (String ref : refArr) {
				msList.add(new MailStatus(mailNo, ref, mService.selectUserName(ref), 3));
			}
		}
		
		ArrayList<Attachment> atList = new ArrayList<>();
		String[] noArr = deleteFileNo.split(",");
		int[] fileNoArr = new int[noArr.length];
        
        for (int i=0; i<noArr.length; i++) {
        	fileNoArr[i] = Integer.parseInt(noArr[i]);
        }
        
		// mailNo으로 첨부파일 리스트 조회
		ArrayList<Attachment> saveMailAt = mService.selectAttachment(mailNo);

		if(!saveMailAt.isEmpty()) { // 해당 메일에 기존 첨부파일 있었을 경우
			
			for(int fileNo : fileNoArr) {
				
				// deleteFileNo들을 ATTACHMENT에 DELETE
				int atResult = mService.deleteAttachmentbyFileNo(fileNo);
				
				if(atResult > 0) { // DELETE 성공 시 서버에 업로드된 파일도 삭제
					for(Attachment at : saveMailAt) {
						new File( session.getServletContext().getRealPath(at.getChangeName()) ).delete();
					}
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
	
		// MAIL 한 행 UPDATE
		int result1 = mService.sendSaveMail(m, atList);

		if (result1 > 0) { // MAIL UPDATE 성공 => MAILSTATUS INSERT && 발송 성공 페이지

			int result2 = mService.insertMailStatusSaveMail(msList);

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

}
