package com.gd.workpp.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gd.workpp.company.model.vo.Company;
import com.gd.workpp.company.model.vo.Department;
import com.gd.workpp.company.model.vo.Job;
import com.gd.workpp.company.model.vo.OrgChart;

@Repository
public class CompanyDao {
	
	public ArrayList<OrgChart> orgChartList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("companyMapper.orgChartList");
	}
	
	public ArrayList<Department> departmentList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("companyMapper.departmentList");
	}
	
	public ArrayList<Job> jobList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("companyMapper.jobList");
	}
	
	public int addOrgChart(SqlSessionTemplate sqlSession,OrgChart o) {
		return sqlSession.insert("companyMapper.addOrgChart",o);
	}
	
	public int deleteOrgChart(SqlSessionTemplate sqlSession,OrgChart o) {
		return sqlSession.update("companyMapper.deleteOrgChart",o);
	}
	
	public ArrayList<Department> updateDepList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("companyMapper.updateDepList");
	}
	
	public int createDepartment(SqlSessionTemplate sqlSession,Department d) {
		return sqlSession.insert("companyMapper.createDepartment",d);
	}
	
	public int deleteDepartment(SqlSessionTemplate sqlSession,Department d) {
		return sqlSession.delete("companyMapper.deleteDepartment",d);
	}
	
	public Company selectCompany(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("companyMapper.selectCompany");
	}
}
