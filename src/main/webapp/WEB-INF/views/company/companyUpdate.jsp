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
                    <div id="company-area" class="company-area">
                        
                        <div id="company2">
                            
                            <h2>회사 관리</h2>
                            <br>
                            <form id="createForm" method="post" action="" enctype="multipart/form-data">
                              
                                <table border="1px">
                                    <tr style="height:50px">
                                        <th id="hold" style="width:80px;">업체명</th>
                                        <td><input style="width:100%; height:50px" placeholder="신규값 입력"></td>
                                        <td><input style="width:100%; height:50px" value="기존 저장값" readonly></td>
                                        <th id="hold" style="width:150;">법인등록번호</th>
                                        <td><input style="width:100%; height:50px" placeholder="신규값 입력"></td>
                                        <td><input style="width:100%; height:50px" value="기존 저장값" readonly></td>
                                    </tr>

                                    <tr style="height:50px">
                                        <th id="hold">대표자명</th>
                                        <td><input style="width:100%; height:50px" placeholder="기존 저장값"></td>
                                        <th id="hold">전화</th>
                                        <td><input style="width:100%; height:50px" placeholder="기존 저장값"></td>
                                        <th id="hold">팩스</th>
                                        <td><input style="width:100%; height:50px" placeholder="기존 저장값"></td>
                                    </tr>

                                    <tr style="height:50px">
                                        <th id="hold">주소</th>
                                        <td colspan="3"><input style="width:100%; height:50px" placeholder="기존 저장값"></td>
                                        <th id="hold">우편번호</th>
                                        <td><input style="width:100%; height:50px" placeholder="기존 저장값"></td>
                                    </tr>
                                </table>

                                <br>
                                <div>
                                    <button>사업자 등록증 이미지 등록</button>
                                    <br>
                                    <br>
                                    <div style="height: 100px;">
                                        <img alt="image" class="img-fluid rounded" src="./imgs/people/7.jpg">
                                    </div>
                                </div>


                                <br>
                                <div align="right">
                                    <button type="submit" id="loginbtn" >저장</button>
                                    <button type="submit" id="loginbtn" >취소</button>
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