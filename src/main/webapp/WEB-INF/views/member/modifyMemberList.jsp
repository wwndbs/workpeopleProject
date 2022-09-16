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
	                                        <th style="width: 50px;">사원번호</th>
	                                        <th style="width: 80px;">사원명</th>
	                                        <th style="width: 80px;">부서명</th>
	                                        <th style="width: 80px;">직책</th>
	                                        <th style="width: 100px;">입사일</th>
	                                        <th style="width: 80px;">퇴사여부</th>
	                                      </tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:choose>
						                		<c:when test="${ empty list }">
						                			<tr>
						                				<td colspan="6">현재 게시글이 없습니다.</td>
						                			</tr>
						                		</c:when>
						                		<c:otherwise>
						                			<c:forEach var="m" items="${ list }">
								                    <tr>
								                    	<td><input type="checkbox" name=""></td>
								                        <td class="no">${ m.userNo }</td>
								                        <td>${ m.userName }</td>
								                        <td>${ m.depName }</td>
								                        <td>${ m.jobName }</td>
								                        <td>${ m.createDate }</td>
								                        <td>${ m.status }</td>
								                    </tr>
						                    		</c:forEach>
						                    	</c:otherwise>
											</c:choose>
	                                    </tbody>
	                                </table>
	                                <script>
						               $(function(){
						                  $("#listTable>tbody>tr").click(function(){
						                     location.href='modify.me?no=' + $(this).children(".no").text();
						                  })
						               })
						            </script>
	                                
	                                <br>
	                                <div id="pagingArea">
						                <ul class="pagination">
						                	
						                	<c:choose>
						                		<c:when test="${ pi.currentPage eq 1 }">
						                    		<li class="page-item disabled"><a class="page-link">Previous</a></li>
						                    	</c:when>
						                    	<c:otherwise>
						                    		<li class="page-item"><a class="page-link" href="modifyList.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
						                    	</c:otherwise>
						                    </c:choose>
						                    
						                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						                    	<li class="page-item"><a class="page-link" href="modifyList.me?cpage=${ p }">${ p }</a></li>
						                    </c:forEach>
						                    
						                    <c:choose>
						                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
						                    		<li class="page-item disabled"><a class="page-link">Next</a></li>
						                    	</c:when>
						                    	<c:otherwise>
						                    		<li class="page-item"><a class="page-link" href="modifyList.me?cpage=${ pi.currentPage+1 }">Next</a></li>
						                    	</c:otherwise>
						                    </c:choose>
						                </ul>
						            </div>
	                                <div align="right">
	                                    <button type="submit" id="loginbtn" >선택 회원 삭제</button>
	                                </div>
	                            </form>
	                        </div>
	
	                        <div id="list3">
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