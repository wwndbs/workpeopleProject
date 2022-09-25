package com.gd.workpp.company.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.workpp.company.model.dao.CompanyDao;
import com.gd.workpp.company.model.vo.Company;
import com.gd.workpp.company.model.vo.Department;
import com.gd.workpp.company.model.vo.Job;
import com.gd.workpp.company.model.vo.OrgChart;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired // 자동으로 생성된 객체를 주입받아 사용
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CompanyDao cDao;
	
	@Override
	public ArrayList<OrgChart> orgChartList() {
		return cDao.orgChartList(sqlSession);
	}

	@Override
	public ArrayList<Job> jobList() {
		return cDao.jobList(sqlSession);
	}

	@Override
	public ArrayList<Department> departmentList() {
		return cDao.departmentList(sqlSession);
	}

	@Override
	public int addOrgChart(OrgChart o) {
		return cDao.addOrgChart(sqlSession,o);
	}

	@Override
	public int deleteOrgChart(OrgChart o) {
		return cDao.deleteOrgChart(sqlSession,o);
	}

	@Override
	public ArrayList<Department> updateDepList() {
		return cDao.updateDepList(sqlSession);
	}

	@Override
	public int createDepartment(Department d) {
		return cDao.createDepartment(sqlSession,d);
	}

	@Override
	public int deleteDepartment(Department d) {
		return cDao.deleteDepartment(sqlSession,d);
	}

	@Override
	public Company selectCompany() {
		return cDao.selectCompany(sqlSession);
	}

	@Override
	public int updateCompany(Company co) {
		return cDao.updateCompany(sqlSession,co);
	}




	
	
	
}
