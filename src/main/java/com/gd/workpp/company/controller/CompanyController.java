package com.gd.workpp.company.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.company.model.service.CompanyService;
import com.gd.workpp.company.model.vo.Company;
import com.gd.workpp.company.model.vo.Department;
import com.gd.workpp.company.model.vo.OrgChart;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class CompanyController {
	
	@Autowired 
	private CompanyService cService;
	
	
	@RequestMapping("orgchart.co")
	public ModelAndView orgChartListView(ModelAndView mv) {
		
		ArrayList<OrgChart> list = cService.orgChartList();
		
		mv.addObject("list", list)
		  .setViewName("company/orgchartView");
		
		return mv;
	}
	
	@RequestMapping("updateOrgChartForm.co")
	public ModelAndView orgChartList(ModelAndView mv) {
		
		ArrayList<OrgChart> list = cService.orgChartList();
		ArrayList<Department> deplist = cService.departmentList();
		
		mv.addObject("deplist", deplist)
		  .addObject("list", list)
		  .setViewName("company/updateOrgchartView");
		
		return mv;
	}
	
	@RequestMapping("updateDepForm.co")
	public ModelAndView updateDepList(ModelAndView mv) {
		
		ArrayList<Department> list = cService.updateDepList();
		
		mv.addObject("list",list)
		  .setViewName("company/depUpdate");
		
		return mv;
	}
	
	@RequestMapping("companyUpdateForm.co")
	public ModelAndView selectCompany(ModelAndView mv) {
	    
		Company co = cService.selectCompany();
		mv.addObject("co",co)
		  .setViewName("company/companyUpdate");		  
		return mv;
	}

	@RequestMapping("updateCom.co")
	public String updateCompany(Company co, Model model,HttpSession session) {
		
		int result = cService.updateCompany(co);
		
		if(result>0) { // 수정성공
			return "redirect:companyUpdateForm.co";
			
		}else { // 수정실패
			model.addAttribute("errorMsg","회사정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("addOrgChart.co")
	public String addOrgChart(OrgChart o,HttpSession session, Model model) {
		
		int result = cService.addOrgChart(o);
		
		if(result>0) { // 성공
			return "redirect:updateOrgChartForm.co";
		}else { // 실패

			// 에러페이지 포워딩
			return "common/errorPage";
		}
		
	}

	@RequestMapping("deleteOrgChart.co")
	public String deleteOrgChart(OrgChart o, HttpSession session,Model model) {
		
		int result = cService.deleteOrgChart(o);
		
		if(result > 0) {
			return "redirect:updateOrgChartForm.co";
			
		}else {
			// 실패 = 에ㅔ러 문구 담아서 에러메세지
			model.addAttribute("errorMsg","조직도 객체 삭제 실패");
			return "common/errorPage";
		}
		
	}

	@RequestMapping("createDep.co")
	public String createDepartment(Department d, HttpSession session, Model model) {
		
		int result = cService.createDepartment(d);
		
		if(result>0) { // 성공
			return "redirect:updateDepForm.co";
		}else { // 실패
			// 에러페이지 포워딩
			return "common/errorPage";
		}
		
	}

	@RequestMapping("deleteDep.co")
	public String deleteDepartment(Department d, Model model,HttpSession session,String updateName) {
		
		int result = cService.deleteDepartment(d);
		if(result>0) {
			return "redirect:updateDepForm.co";
		}else {
			session.setAttribute("alertMsg", "부서 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("uploadImg.co")
	public void ajaxUploadProfile(MultipartFile uploadFile, Company co,String originalFile, HttpSession session) {
		
		if(uploadFile != null) { // 넘어온 파일이 있을경우
			
			String saveFilePath = FileUpload.saveFile(uploadFile, session , "resources/company_upfiles/");
			// 업로드 시킬 파일 / session / 저장시킬 경로 / 를 넣으면 파일 경로 + 파일명이 붙어서 파일 경로가 반환됨
			co.setComImg(saveFilePath);
			
			int result = cService.uploadComImg(co);
			
			if(result > 0) { // db에 update 성공시
				
				session.setAttribute("co", cService.updateCompany(co));

				// 기존의 파일 지우기
				if(!originalFile.equals("")) {
					new File(session.getServletContext().getRealPath(originalFile)).delete();
											// original 파일의 물리적인 경로 찾기
				}
			}
		}
	}
	
}
