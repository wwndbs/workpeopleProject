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

</head>
<body>
	<div class="adminx-container">
      <!-- 상단 메뉴 바 -->
      <jsp:include page="../common/header.jsp" />
      
      <!-- 좌측 슬라이드 메뉴 바 -->
      <jsp:include page="../common/menubar.jsp" />
		
		<div class="adminx-content">
	        <div class="adminx-main-content">
	            <div class="container-fluid" style="width:2000px">
	
	                <!--메인페이지 컨텐츠-->
	                <div class="top-wrapper">
	
	                    <!--게시판 부분-->
	                    <div class="tel_area">
		                    <h1> 주소록 </h1>
		                    <form id="tel_2">
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
		                    <form id="telsearchForm" action="searchTel.me" method="Get">
				                <div class="telsearchdiv">
				                    <input style="height:42px;" type="text" class="telsearchForm" name="keyword" placeholder="이름검색">
				                </div>
				                <div>
				                	<button type="submit" class="searchBtn btn btn-secondary">검색</button>
				                </div>
				            </form>
							<br>
							
		                    <div class="tel_area2">
		                        
		                        <c:choose>
			                		<c:when test="${ empty list }">
		                				<h1>조회된 데이터가 없습니다.<h1>
			                		</c:when>
			                		<c:otherwise>
			                			<c:forEach var="m" items="${ list }">
			                				<div>
							                    <table style="border: 1px solid #444444;">
						                            <tr style="height:50px">
						                                <td rowspan="3" style="width:130px">
						                                	<img style="width:115px;"id="profileImg" src="<c:out value='${loginUser.profImg}' default='resources/profile_images/defaultProfile.jpg' />">
						                                </td>
						                                <td colspan="2" style="width:300px">
						                                    <h4>${m.userName }</h4>
						                                </td>
						                            </tr>
						                            <tr style="height:30px">
						                                <td colspan="2">${m.email}</td>
						                            </tr>
						
						                            <tr style="height:40px">
						                                <td style="width:100px">${m.depName }/${m.jobName }</td>
						                                <td style="width:200px">${m.phone}</td>
						                            </tr>
						                        </table>
					                        </div>
			                    		</c:forEach>
			                    	</c:otherwise>
								</c:choose>
							
		                    </div>
		                    
		                    <div id="pagingArea">
				                <ul class="pagination">
				                	
				                	<c:choose>
				                		<c:when test="${ pi.currentPage eq 1 }">
				                    		<li class="page-item disabled"><a class="page-link">Previous</a></li>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<li class="page-item"><a class="page-link" href="tel.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
				                    	</c:otherwise>
				                    </c:choose>
				                    
				                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				                    	<li class="page-item"><a class="page-link" href="tel.me?cpage=${ p }">${ p }</a></li>
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
				            
							<br><br>
		                </div>
		            </div>
		        </div>
		     </div>
	    </div>
		
		
	</div>
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>