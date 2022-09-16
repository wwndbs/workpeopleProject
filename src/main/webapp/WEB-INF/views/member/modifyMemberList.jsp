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
	author : 최영헌
	
	경로는 servlet-context.xml파일에 <resources mapping="/resources/**" location="/resources/" /> 로 명시되어있어
	resources로 경로를 시작하면됨
	
	header.jsp에 link 넣음
 -->
<style>
#list_2>ul{width:100%; height:50px; list-style-type: none; margin: auto; padding:0;}
#list_2>ul>li{float:left; height:50px; line-height: 55px; text-align:center;}
#list_2>ul>li a{text-decoration: none; color:black; font-size: 18px; font-weight: 900;}
#searchForm{text-decoration: none; color:black; font-size: 18px; font-weight: 900;}
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
	                <div class="top-wrapper" id="list-wrapper">
	
	                    <!--게시판 부분-->
	                    <div id="list-area" class="list-area">
	                        <h2>사원 관리</h2>
	                        <div id="list2">
	                            
	                            <form id="list_2">
	                                <ul>
	                                    <li style="width: 80px;"><a href="">전체</a></li>
	                                    <li style="width: 80px;"><a href="">인사부</a></li>
	                                    <li style="width: 80px;"><a href="">총무부</a></li>
	                                    <li style="width: 80px;"><a href="">개발부</a></li>
	                                    <li style="width: 80px;"><a href="">영업부</a></li>
	                                    <li style="width: 80px;"><a href="">회계부</a></li>
	                                </ul>
	                            </form>
	                            <hr>
	
	
	                            <form id="listForm" method="post" action="" enctype="multipart/form-data">
	                                <table border="1px" id="listTable" class="table table-hover" align="center">
	                                    <thead>
	                                      <tr>
	                                        <th style="width: 10px;"></th>
	                                        <th style="width: 50px;">번호</th>
	                                        <th style="width: 80px;">사원명</th>
	                                        <th style="width: 80px;">부서명</th>
	                                        <th style="width: 80px;">직책</th>
	                                        <th style="width: 100px;">입사일</th>
	                                        <th style="width: 80px;">퇴사여부</th>
	                                        <th style="width: 120px;">부서/직급 수정</th>
	                                      </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td><input type="checkbox" name=""></td>
	                                            <td>1</td>
	                                            <td>박상현</td>
	                                            <td>개발부</td>
	                                            <td>사원</td>
	                                            <td>2020-09-01</td>
	                                            <td>N</td>
	                                            <td><button style="width:100%" data-toggle="modal" data-target="#loginModal">수정하기</button></td>
	                                        </tr>
	
	                                        <tr>
	                                            <td><input type="checkbox"></td>
	                                            <td>2</td>
	                                            <td>이상현</td>
	                                            <td>개발부</td>
	                                            <td>사원</td>
	                                            <td>2020-09-01</td>
	                                            <td>N</td>
	                                            <td><button style="width:100%" data-toggle="modal" data-target="#loginModal">수정하기</button></td>
	                                        </tr>
	
	
	                                        <tr>
	                                            <td><input type="checkbox"></td>
	                                            <td>3</td>
	                                            <td>김상현</td>
	                                            <td>개발부</td>
	                                            <td>사원</td>
	                                            <td>2020-09-01</td>
	                                            <td>N</td>
	                                            <td><button style="width:100%" data-toggle="modal" data-target="#loginModal">수정하기</button></td>
	                                        </tr>
	
	                                    </tbody>
	                                </table>
	                                <br>
	                                <div align="right">
	                                    <button type="submit" id="loginbtn" >선택 회원 삭제</button>
	                                </div>
	                            </form>
	                        </div>
	
	                        <div id="list3">
	                        </div>
	                        
	                    </div>
	
	                </div>
	
	                <div class="modal fade" id="loginModal">
	                    <div class="modal-dialog modal-sm">
	                        <div class="modal-content">
	            
	                            <form action="login.me" method="post">
	                                <!-- Modal Body -->
	                                <table>
	                                    <tr><h3>부서/직책 변경</h3></tr>
	                                    <tr>
	                                        <td><h4>사원명</h4></td>
	                                    </tr>
	                                    <tr>
	                                        <td>부서 변경 : </td>
	                                        <td>
	                                            <select id="" class="form-control" name="" style="height:30px; width:100px" required>
	                                                <option value="">부서선택</option>
	                                                <option value="">인사부</option>
	                                                <option value="">총무부</option>
	                                                <option value="">영업부</option>
	                                                <option value="">회계부</option>
	                                                <option value="">개발부</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <br><br>
	                                    <tr> 
	                                        <td> 직급변경 : </td>
	                                        <td>
	                                            <select id="" class="form-control" name="" style="height:30px; width:100px" required>
	                                                <option value="">직책선택</option>
	                                                <option value="">사원</option>
	                                                <option value="">대리</option>
	                                                <option value="">과장</option>
	                                                <option value="">팀장</option>
	                                                <option value="">부장</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                </table>
	                                <br>
	                                <!-- Modal footer -->
	                                <div class="modal-footer">
	                                    <button type="submit" class="btn btn-primary">변경</button>
	                                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	
	
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
		// 프로젝트 슬라이드
		$(function() {
			let position = 0;
			$(".slide-btn>#right-btn").click(function() {
				position += 235;
				$(".project-container").css('transform', 'translateX(-' + position + 'px)');
				
				if (position > 235) {
					position = -235;
				}
			})

			$(".slide-btn>#left-btn").click(function() {
				position -= 235;
				$(".project-container").css('transform', 'translateX(-' + position + 'px)');
				
				if (position < 0) {
					position = 705;
				}
			})
		})
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>