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
		
		if(result>0) { // ????????????
			return "redirect:companyUpdateForm.co";
			
		}else { // ????????????
			model.addAttribute("errorMsg","???????????? ?????? ??????");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("addOrgChart.co")
	public String addOrgChart(OrgChart o,HttpSession session, Model model) {
		
		int result = cService.addOrgChart(o);
		
		if(result>0) { // ??????
			return "redirect:updateOrgChartForm.co";
		}else { // ??????

			// ??????????????? ?????????
			return "common/errorPage";
		}
		
	}

	@RequestMapping("deleteOrgChart.co")
	public String deleteOrgChart(OrgChart o, HttpSession session,Model model) {
		
		int result = cService.deleteOrgChart(o);
		
		if(result > 0) {
			return "redirect:updateOrgChartForm.co";
			
		}else {
			// ?????? = ????????? ?????? ????????? ???????????????
			model.addAttribute("errorMsg","????????? ?????? ?????? ??????");
			return "common/errorPage";
		}
		
	}

	@RequestMapping("createDep.co")
	public String createDepartment(Department d, HttpSession session, Model model) {
		
		int result = cService.createDepartment(d);
		
		if(result>0) { // ??????
			return "redirect:updateDepForm.co";
		}else { // ??????
			// ??????????????? ?????????
			return "common/errorPage";
		}
		
	}

	@RequestMapping("deleteDep.co")
	public String deleteDepartment(Department d, Model model,HttpSession session,String updateName) {
		
		int result = cService.deleteDepartment(d);
		if(result>0) {
			return "redirect:updateDepForm.co";
		}else {
			session.setAttribute("alertMsg", "?????? ????????? ?????????????????????.");
			return "common/errorPage";
		}
		
	}
	
	
	
	
}
