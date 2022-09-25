<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<!-- 
	author : 박상현
	
	경로는 servlet-context.xml파일에 <resources mapping="/resources/**" location="/resources/" /> 로 명시되어있어
	resources로 경로를 시작하면됨
	
	header.jsp에 link 넣음
 -->
<style>
	#hold{
	  	background-color: gainsboro;
	  	text-align:center;   
	}
</style>
</head>
<body>
	<div class="adminx-container">
      <!-- 상단 메뉴 바 -->
      <jsp:include page="../common/header.jsp" />
      
      <!-- 좌측 슬라이드 메뉴 바 -->
      <jsp:include page="../common/menubar.jsp" />
		
		<!-- 컨텐츠 부분 wrapper -->
    <div class="adminx-content">
        <div class="adminx-main-content">
            <div class="container-fluid">

                <!--메인페이지 컨텐츠-->
                <div class="top-wrapper">

                    <!--게시판 부분-->
                    <div id="company-area" class="company-area" style="width:2000px;">
                        
                        <div id="company2">
                            
                            <h2>회사 관리</h2>
                            <br>
                            <form id="companyForm" method="post" action="updateCom.co" enctype="multipart/form-data">
                              	<input type="hidden" name="createDate" value="${co.createDate}">
                                <table border="1px">
                                    <tr style="height:50px">
                                        <th id="hold" style="width:80px;">업체명</th>
                                        <td><input name="comName" style="width:100%; height:50px" placeholder="${co.comName}"></td>
                                        <td><input style="width:100%; height:50px" value="${co.comName}" readonly></td>
                                        <th id="hold" style="width:150;">법인등록번호</th>
                                        <td><input name="comNo" style="width:100%; height:50px" placeholder="${co.comNo}"></td>
                                        <td><input style="width:100%; height:50px" value="${co.comNo}" readonly></td>
                                    </tr>

                                    <tr style="height:50px">
                                        <th id="hold">대표자명</th>
                                        <td><input name="ceo" style="width:100%; height:50px" placeholder="${co.ceo}"></td>
                                        <th id="hold">전화</th>
                                        <td><input name="phone" style="width:100%; height:50px" placeholder="${co.phone}"></td>
                                        <th id="hold">팩스</th>
                                        <td><input name="fax" style="width:100%; height:50px" placeholder="${co.fax}"></td>
                                    </tr>

                                    <tr style="height:50px">
                                        <th id="hold">주소</th>
                                        <td colspan="3"><input name="address" style="width:100%; height:50px" placeholder="${co.address}"></td>
                                        <th id="hold">우편번호</th>
                                        <td><input name="postNo" style="width:100%; height:50px" placeholder="${co.postNo}"></td>
                                    </tr>
                                </table>

                                <br>
                                

                                <br>
                                <div align="right">
                                    <button class="btn btn-primary" type="submit" id="loginbtn" >저장</button>
                                    <button class="btn btn-secondary" type="submit" id="loginbtn" >취소</button>
                                </div>


                            </form>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    </div>

	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>