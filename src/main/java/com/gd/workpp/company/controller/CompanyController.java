package com.gd.workpp.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gd.workpp.company.model.service.CompanyService;
import com.gd.workpp.company.model.vo.Department;
import com.gd.workpp.company.model.vo.OrgChart;
import com.gd.workpp.member.model.vo.Member;

@Controller
public class CompanyController {
	
	@Autowired 
	private CompanyService cService;
	
	
	@RequestMapping("orgchart.co")
	public ModelAndView documentListView(ModelAndView mv) {
		
		ArrayList<OrgChart> list = cService.orgChartList();
		
		mv.addObject("list", list)
		  .setViewName("company/orgchartView");
		
		return mv;
	}
	
	@RequestMapping("updateOrgChartForm.co")
	public ModelAndView documentListView1(ModelAndView mv) {
		
		ArrayList<OrgChart> list = cService.orgChartList();
		
		mv.addObject("list", list)
		  .setViewName("company/updateOrgchartView");
		
		return mv;
	}
	
	@RequestMapping("updateDepForm.co")
	public ModelAndView documentListView2(ModelAndView mv) {
		
		ArrayList<Department> list = cService.updateDepList();
		
		mv.addObject("list",list)
		  .setViewName("company/depUpdate");
		
		return mv;
	}
	
	@RequestMapping("addOrgChart.co")
	public String addOrgChart(OrgChart o,HttpSession session, Model model) {
		
		int result = cService.addOrgChart(o);
		
		if(result>0) { // 성공
			return "redirect:/updateOrgchartForm.co";
		}else { // 실패

			// 에러페이지 포워딩
			return "common/errorPage";
		}
		
	}

	@RequestMapping("deleteOrgChart.co")
	public String deleteOrgChart(OrgChart o, HttpSession session,Model model) {
		
		int result = cService.deleteOrgChart(o);
		
		if(result > 0) {
			return "redirect:/updateOrgchartForm.co";
			
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
			return "redirect:/updateDepForm.co";
		}else { // 실패
			// 에러페이지 포워딩
			return "common/errorPage";
		}
		
	}

	@RequestMapping("updateDep.co")
	public String updateDepartment(Department d, Model model,HttpSession session,String updateName) {
		
		d.setUpdateName(updateName);
		
		int result = cService.updateDepartment(d);
		System.out.println(d);
		if(result>0) {
			return "redirect:/updateDepForm.co";
		}else {
			session.setAttribute("alertMsg", "부서 변경에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
}
