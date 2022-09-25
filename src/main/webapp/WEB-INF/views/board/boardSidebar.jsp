<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>

	<!-- 컨텐츠 부분 wrapper -->
	
			<!-- 토스트 메시지 -->
	   		  <div id="toast" class="">
				    
			  </div>
			  
				
				<script>
					
					// 토스트
	            	
	          	
					function toast(string) {
					    const toast = document.getElementById("toast");

					    toast.classList.contains("reveal") ?
					        (clearTimeout(removeToast), removeToast = setTimeout(function () {
					            document.getElementById("toast").classList.remove("reveal")
					        }, 1000)) :
					        removeToast = setTimeout(function () {
					            document.getElementById("toast").classList.remove("reveal")
					        }, 1500)
					    toast.classList.add("reveal"),
					        toast.innerText = string
					}
				</script>
					
				<c:if test="${ not empty toastMsg }">
					<script>
						toast("${toastMsg}");
					</script>
					<c:remove var="toastMsg" scope="session" />
				</c:if>
				
            <!-- 게시판 전체 div 시작 -->
            <div class="container-board">
              <!-- 게시판 사이드바 시작 -->
              <div class="board-sidebar" >

                <div class="sidebar1">
                  <h5>게시판</h5>
                </div>

                <div class="sidebar2">
                  <a href="list.bo?no=1"><h6 style="margin-bottom: 30px;">공지 게시판</h6></a>

                  <h6>부서별 게시판</h6>
                  <ul class="dept-list">
                  	<li><a href="list.bo?no=2&dept=개발팀" class="dept">개발팀</a></li>
                    <li><a href="list.bo?no=2&dept=인사팀" class="dept">인사팀</a></li>
                    <li><a href="list.bo?no=2&dept=총무팀" class="dept">총무팀</a></li>
                    <li><a href="list.bo?no=2&dept=회계팀" class="dept">회계팀</a></li>
                    <li><a href="list.bo?no=2&dept=영업팀" class="dept">영업팀</a></li>
                  </ul>
                  
                  <script>
                  	$(function(){
                  		$(".dept").click(function(){
                  			// 다른 부서에 접근할 경우
                  			
                  			let dept = $(this).text();
                  			
                  			if(dept != "${loginUser.depName}"){
                  				
                  				toast("본인이 속한 부서만 접근 가능합니다.");
                  				$(this).removeAttr("href");
                  				
                  			}
                  			
                  		})
                  	})
                  </script>
                  
                  <a href="list.bo?no=3"><h6>익명 게시판</h6></a>
                
                  <a href=""><h6>내 게시글 조회</h6></a>
                  
                  <c:if test="${ loginUser.jobName eq '부장' or loginUser.jobName eq '팀장' }">
                  	<a href="rpHandle.bo"><h6>신고 관리</h6></a>
                  </c:if>
                </div>

              </div>
              
			  
			 
              <!-- 게시판 사이드바 끝 -->

</body>
</html>