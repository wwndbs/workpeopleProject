package com.gd.workpp.member.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.service.MemberService;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired 
	private MemberService mService;
	
	
	@RequestMapping("updateForm.me")
	public ModelAndView documentListView(ModelAndView mv) {
		mv.setViewName("member/updateMember");
		return mv;
	}
	
	@RequestMapping("createForm.me")
	public ModelAndView documentListView1(ModelAndView mv) {
		mv.setViewName("member/createMember");
		return mv;
	}
	
	@RequestMapping("modifyList.me")
	public ModelAndView modifyList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = mService.modifyListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> list = mService.modifyList(pi);
		

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("member/modifyMemberList");
		
		return mv;
	}
	
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
	
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { // 실패
			mv.setViewName("redirect:/");
		}else { // 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
		}
		
		return mv;
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model,HttpSession session) {
		
		int result = mService.updateMember(m);
		
		if(result>0) { // 수정성공
			session.setAttribute("loginUser",mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 개인정보 변경되었습니다");
			
			// 마이페이지 url재요청
			return "redirect:updateForm.me";
			
		}else { // 수정실패
			model.addAttribute("errorMsg","개인정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	
	@ResponseBody // 응답데이터를 보내주지 않아서 붙임
	@RequestMapping("uploadProfile.me")
	public void ajaxUploadProfile(MultipartFile uploadFile, Member m,String originalFile, HttpSession session) {
		
		if(uploadFile != null) { // 넘어온 파일이 있을경우
			
			String saveFilePath = FileUpload.saveFile(uploadFile, session , "resources/profile_images/");
			// 업로드 시킬 파일 / session / 저장시킬 경로 / 를 넣으면 파일 경로 + 파일명이 붙어서 파일 경로가 반환됨
			m.setProfImg(saveFilePath);
			
			int result = mService.uploadProfileImg(m);
			
			if(result > 0) { // db에 update 성공시
				
				session.setAttribute("loginUser", mService.loginMember(m));
				
				// 기존의 파일 지우기
				if(!originalFile.equals("")) {
					new File(session.getServletContext().getRealPath(originalFile)).delete();
											// original 파일의 물리적인 경로 찾기
				}
			}
		}
	}
	
	// 비밀번호 수정
	@RequestMapping("updatePwd.me")
	public String updatePwd(Member m,HttpSession session,String updatePwd,String userPwd) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(userPwd.equals(loginUser.getUserPwd())) {
			m.setUserPwd(updatePwd);
			int result = mService.updatePwd(m);
			
			if(result > 0) {
				// > 변경 성공 시
		           //- 갱신된 회원 객체 조회해서 session에 덮어씌우기
		           //- 마이페이지가 보여질 수 있도록 처리 (이때 alert로 성공 알림)
				session.setAttribute("loginUser",mService.loginMember(m));
				session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
				return "redirect:updateForm.me";
				
			}else {
		        //> 변경 실패 시
		           //- 마이페이지가 보여질 수 있도록 처리 (이때 alert로 실패 알림)
				session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다.");
				return "redirect:updateForm.me";
				
			}
		}else {
			session.setAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:updateForm.me";
		}
		
		
		/*
		if(bcryptPasswordEncoder.matches(userPwd, loginUser.getUserPwd())) {
			String encPwd = bcryptPasswordEncoder.encode(updatePwd);
			m.setUserPwd(encPwd);
			int result = mService.updatePwd(m);
			if(result > 0) {
				// > 변경 성공 시
		           //- 갱신된 회원 객체 조회해서 session에 덮어씌우기
		           //- 마이페이지가 보여질 수 있도록 처리 (이때 alert로 성공 알림)
				session.setAttribute("loginUser",mService.loginMember(m));
				session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
				return "redirect:myPage.me";
				
			}else {
		        //> 변경 실패 시
		           //- 마이페이지가 보여질 수 있도록 처리 (이때 alert로 실패 알림)
				session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다.");
				return "redirect:myPage.me";
				
			}
		}else {
			session.setAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:myPage.me";
		}
		*/
	}
	
	// 사원 계정 생성 창 이동
	@RequestMapping("create.me")
	public String createMember(Member m ,HttpSession session, Model model) {
		int result = mService.createMember(m);
		
		if(result>0) { // 회원가입 성공
			// sessionScope 영역에 alertMsg라는 키값으로 "성공적으로 회원가입 되었습니다" 담아주기
			session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			// 메인페이지 url 재요청
			return "redirect:/createForm.me";
		}else { // 회원가입 실패
			// requsetScope 영역에 에러문구 담고
			model.addAttribute("errorMsg","회원가입 실패");
			// 에러페이지 포워딩
			return "common/errorPage";
		}
		
	}
	
	// 맴버 수정 창으로 이동
	@RequestMapping("modify.me")
	public ModelAndView selectmodifyMember(int no, ModelAndView mv) {

		Member m = mService.selectmodifyMember(no);
		mv.addObject("m",m).setViewName("member/modifyMember");
		
		return mv;
	}
	
	// 사원 정보 수정
	@RequestMapping("modifyMember.me")
	public String modifyMember(Member m, HttpSession session,Model model) {
	
		int result = mService.modifyMember(m);
		
		if(result > 0) {
			// alert 문구 담아서 상세보기 페이지로 이동
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다");
			return "redirect:modify.me?no="+m.getUserNo();
			
		}else {
			// 실패 = 에ㅔ러 문구 담아서 에러메세지
			model.addAttribute("errorMsg","사원 정보 수정 실패");
			return "common/errorPage";
			
		}
		
	}
	
	// 사원 퇴사 처리
	@RequestMapping("delete.me")
	public String deleteMember(int no,String filePath, Model model, HttpSession session) {
		// filePath= "" | "resources/xxxx/xxx.pdf"
		
		int result = mService.deleteMember(no);
		
		if(result >0) { // db에 삭제 성공시
			session.setAttribute("alertMsg", "성공적으로 사원정보가 삭제되었습니다");
			return "redirect:/modifyList.me";
			
		}else { // db에 삭제 실패시
			model.addAttribute("errorMsg","사원정보 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
}
