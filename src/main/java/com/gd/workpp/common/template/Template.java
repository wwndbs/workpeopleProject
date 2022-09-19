package com.gd.workpp.common.template;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {
	
	public static SqlSession getSqlSession() {
		// mybatis-config.xml 파일 읽어들여서
		// 해당 DB와 접속된 SqlSession 객체 생성해서 반환
		SqlSession sqlSession = null;
		
		// SqlSession 생성하기 위해서 => SqlSessionFactory 객체 필요
		// SqlSessionFactory 생성하기위해서 => SqlSessionFactoryBuilder 객체 필요 
		
		try {
			// /config/mybatis-config.xml 파일을 읽어들이기 위한 입력용스트림
			InputStream stream = Resources.getResourceAsStream("/config/mybatis-config.xml");
			sqlSession = new SqlSessionFactoryBuilder().build(stream).openSession(false);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSession;
	}

}
