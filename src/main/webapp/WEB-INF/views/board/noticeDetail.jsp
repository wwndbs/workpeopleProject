<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.adminx-container {
		height: 100% !important;
	}
</style>
</head>
<body>

	<div class="adminx-container">
		<!-- header -->
		<jsp:include page="../common/header.jsp"/>
		
		<!-- menubar -->
		<jsp:include page="../common/menubar.jsp"/>
		
		<div class="adminx-content" style="padding-left : 65px;">
	        <div class="adminx-main-content" style="padding : 0; height: 100%;">
	          <div class="container-fluid" style="padding: 0; height: 100%;">
		
				<!-- 게시판 sidebar -->
				<jsp:include page="boardSidebar.jsp"/>
		
				<!-- 게시판 내용 시작 -->
              <div class="board-main">
              
                <br>

                <div class="board-title">
                    <h5>공지 게시판</h5>
                </div>

                <br>

                <div class="board-content">

                    <div class="write-button">
                      <c:if test="${ loginUser.jobName eq '부장' or loginUser.jobName eq '팀장' }">
                      	<button type="button" class="btn btn-sm btn-primary" onclick="location.href='enrollForm.bo?no=1'">새글쓰기</button>
                      </c:if>
                      <!-- <button type="button" class="btn btn-sm btn-light">쪽지</button> -->
                      <c:if test="${ loginUser.userNo eq b.userNo }">
	                      <button type="button" class="btn btn-sm btn-light">수정</button>
	                      <button type="button" class="btn btn-sm btn-danger">삭제</button>
                      </c:if>
                    </div>

                    <div class="page-button">
                      <button type="button" class="btn btn-sm btn-light" onclick="location.href='noticeDetail.bo?boardNo=${b.boardNo - 1}&cpage=${ cpage }'">이전</button>
                      <button type="button" class="btn btn-sm btn-light" onclick="location.href='noticeDetail.bo?boardNo=${b.boardNo + 1}&cpage=${ cpage }'">다음</button>
                      <button type="button" class="btn btn-sm btn-light" onclick="location.href='list.bo?cpage=${cpage}&no=1'">목록</button>
                    </div>

                    <div class="content-header">
                      <h5>${ b.boardTitle }</h5>
                      <div class="profile">
                        <img src="resources/images/defaultProfile.jpg" alt="">
                        <div>${ b.userName } ${ b.jobName }</div>
                        <div id="date">${ b.createDate }</div>
                      </div>
                    </div>

                    <div class="content-body">
                      ${ b.boardContent }
                    </div>
                    
                </div>
              
              
              
              
              
              
              
              </div>
              <!-- 게시판 내용 끝 -->
		
			  </div>
			</div>
		</div>
	</div>

</body>
</html>