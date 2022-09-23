package com.gd.workpp.member.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.company.model.service.CompanyService;
import com.gd.workpp.company.model.vo.Department;
import com.gd.workpp.company.model.vo.Job;
import com.gd.workpp.member.model.service.MemberService;
import com.gd.workpp.member.model.service.certificationService;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired 
	private CompanyService cService;
	
	@Autowired 
	private MemberService mService;
	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		// 세션 만료
		session.invalidate();
		// 메인페이지  url 재요청
		return "redirect:/";
	}
	
	@RequestMapping("updateForm.me")
	public ModelAndView updateMemberForm(ModelAndView mv) {
		mv.setViewName("member/updateMember");
		return mv;
	}
	
	@RequestMapping("findPwd.me")
	public ModelAndView findPwdForm(ModelAndView mv) {
		mv.setViewName("member/updatePwd");
		return mv;
	}
	
	@RequestMapping("createForm.me")
	public ModelAndView createMemberForm(ModelAndView mv,Member m) {
		
		ArrayList<Department> deplist = cService.departmentList();
		ArrayList<Job> joblist = cService.jobList();
		
		mv.addObject("deplist", deplist)
		  .addObject("joblist", joblist)
		  .setViewName("member/createMember");
		return mv;
		
	}
	
	
	@RequestMapping("tel.me")
	public ModelAndView tel(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv,@RequestParam(value="dep", defaultValue="") String dep) {
		
		
			int listCount = mService.telListCount(dep);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 12);
			ArrayList<Member> list = mService.telList(pi,dep);
			ArrayList<Department> deplist = cService.departmentList();
	
			mv.addObject("pi", pi)
			  .addObject("dep",dep)
			  .addObject("deplist", deplist)
			  .addObject("list", list)
			  .setViewName("member/telListView");
			
			return mv;
		
		
	}
	
	@RequestMapping("modifyList.me")
	public ModelAndView modifyList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv,@RequestParam(value="dep", defaultValue="") String dep) {
		
		int listCount = mService.modifyListCount(dep);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> list = mService.modifyList(pi,dep);
		ArrayList<Department> deplist = cService.departmentList();
		

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("dep",dep)
		  .addObject("deplist", deplist)
		  .setViewName("member/modifyMemberList");
		
		return mv;
	}
	
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { // 로그인 성공
			// 아이디가 일치하고 , 비밀번호도 일치할때 ( 매치를이용해서 db의 랜덤값과 유저가 입력한 비밀번호를 검사함 )
			session.setAttribute("loginUser", loginUser); // 여기 비밀번호 암호문으로 담겨있음
			return "main";
		}else {
			session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model,HttpSession session) {
		
		int result = mService.updateMember(m);
		
		if(result>0) { // 수정성공
			session.setAttribute("loginUser",mService.loginMember(m));
			
			// 마이페이지 url재요청
			return "redirect:updateForm.me";
			
		}else { // 수정실패
			model.addAttribute("errorMsg","개인정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	
	@ResponseBody
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
	
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(Member m,HttpSession session,String updatePwd,String userPwd) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(bcryptPasswordEncoder.matches(userPwd, loginUser.getUserPwd())) {
			String encPwd = bcryptPasswordEncoder.encode(updatePwd);
			m.setUserPwd(encPwd);
			int result = mService.updatePwd(m);
			
			if(result > 0) {
				session.setAttribute("loginUser",mService.loginMember(m));
				session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
				return "redirect:updateForm.me";
				
			}else {
				session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다.");
				return "redirect:updateForm.me";
				
			}
		}else {
			session.setAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:updateForm.me";
		}

	}
	
	// 사원 계정 생성 창 이동
	@RequestMapping("create.me")
	public String createMember(Member m ,HttpSession session, Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = mService.createMember(m);
		
		
		if(result>0) { // 성공
			return "redirect:/createForm.me";
		}else { // 실패

			// 에러페이지 포워딩
			return "common/errorPage";
		}
		
	}
	
	// 맴버 수정 창으로 이동
	@RequestMapping("modify.me")
	public ModelAndView selectmodifyMember(int no, ModelAndView mv) {

		ArrayList<Department> deplist = cService.departmentList();
		ArrayList<Job> joblist = cService.jobList();
		Member m = mService.selectmodifyMember(no);
		
		mv.addObject("deplist", deplist)
		  .addObject("joblist", joblist)
		  .addObject("m",m)
		  .setViewName("member/modifyMember");

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
	
	@RequestMapping("pwdChange.me")
	public String changePwd(Member m,HttpSession session,String updatePwd) {

		String encPwd = bcryptPasswordEncoder.encode(updatePwd);
		m.setUserPwd(encPwd);
		int result = mService.updatePwd(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
			return "redirect:findPwd.me";
			
		}else {
	        //> 변경 실패 시
	           //- 마이페이지가 보여질 수 있도록 처리 (이때 alert로 실패 알림)
			session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다.");
			return "redirect:findPwd.me";
			
		}
	}
	
	
			
	
}
