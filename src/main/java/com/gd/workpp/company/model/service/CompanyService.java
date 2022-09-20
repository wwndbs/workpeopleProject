package com.gd.workpp.company.model.service;

import java.util.ArrayList;

import com.gd.workpp.company.model.vo.Company;
import com.gd.workpp.company.model.vo.Department;
import com.gd.workpp.company.model.vo.Job;
import com.gd.workpp.company.model.vo.OrgChart;

public interface CompanyService {
	
	ArrayList<OrgChart> orgChartList();
	
	ArrayList<Job> jobList();
	
	ArrayList<Department> departmentList();
	
	int addOrgChart(OrgChart o);
	
	int deleteOrgChart(OrgChart o);
	
	ArrayList<Department> updateDepList();
	
	int createDepartment(Department d);
	
	int deleteDepartment(Department d);
	
	Company selectCompany();
	
}
