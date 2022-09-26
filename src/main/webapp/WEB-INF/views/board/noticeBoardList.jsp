<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
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

                    <!-- <div class="board-search">
                        <select name="" id="" style="height: 27px;">
                            <option value="">제목+내용</option>
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">작성자</option>
                        </select>
                        <input type="text">
                        <button type="button" class="btn btn-sm btn-primary">search</button>
                    </div> -->
                </div>

                <br>

                <div class="board-table">
                    <table class="table table-hover" align="center">
                        <thead>
                            <tr>
                                <th width="10px">번호</th>
                                <th width="230px">제목</th>
                                <th width="30px">작성자</th>
                                <th width="30px">작성일</th>
                                <th width="10px">조회</th>
                            </tr>
                        </thead>
                        <tbody> <!-- 시간 다르게 표현하기 도전 -->
                        	<c:choose>
                        		<c:when test="${ empty list }">
                        			<tr>
                        				<td colspan="5">현재 게시글이 없습니다.</td>
                        			</tr>
                        		</c:when>
                        		<c:otherwise> 
                        			<c:forEach var="b" items="${ list }">
			                            <tr class="board">
			                            	<input type="hidden" name="boardNo" value="${ b.boardNo }">
			                                <td>${ b.boardOrder }</td>
			                                <td>${ b.boardTitle }</td>
			                                <td>${ b.userName } ${ b.jobName }</td>
			                                <td>${ b.createDate }</td>
			                                <td>${ b.count }</td>
			                            </tr>
		                            </c:forEach>
		                        </c:otherwise>
		                    </c:choose>
                        </tbody>
                    </table>
                    
                    <script>
                    	$(".board").click(function(){
                    		let boardNo = $(this).children().eq(0).val();
                    		
                    		location.href="noticeDetail.bo?boardNo=" + boardNo + "&cpage=" + ${pi.currentPage};
                    	})
                    </script>
                    
                    <c:if test="${ loginUser.jobName eq '부장' or loginUser.jobName eq '팀장' }">
	                    <div class="write-button">
	                      <button type="button" class="btn btn-sm btn-primary" onclick="location.href='enrollForm.bo?no=1'">글쓰기</button>
	                    </div>
                    </c:if>
                    
                    <c:if test="${ not empty list }">

	                    <!-- 페이징 -->
	                    <div class="card-footer d-flex justify-content-end">
	                      <ul class="pagination pagination-clean pagination-sm mb-0">
	                      	<c:if test="${ pi.currentPage ne 1 }">
		                        <li class="page-item">
		                          <a class="page-link" href="list.bo?no=1&cpage=${ pi.currentPage - 1 }">‹</a>
		                        </li>
	                      	</c:if>
	                      	
	                      	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                      		
	                      		<c:choose>
	                      			<c:when test="${ p eq pi.currentPage }">
	                      				<li class="page-item active"><a class="page-link" href="list.bo?no=1&cpage=${ p }">${ p }</a></li>
	                      			</c:when>
	                      			<c:otherwise>
	                      				<li class="page-item"><a class="page-link" href="list.bo?no=1&cpage=${ p }">${ p }</a></li>
	                      			</c:otherwise>
	                      		</c:choose>
	                      		
	                      	</c:forEach>
	                      	
	                      	<c:if test="${ pi.currentPage ne pi.maxPage }">
	                      		<li class="page-item">
		                          <a class="page-link" href="list.bo?no=1&cpage=${ pi.currentPage + 1 }">›</a>
		                        </li>
	                      	</c:if>
	                        
	                      </ul>
	                    </div>
	                    
                    </c:if>
                </div>


              </div>
              <!-- 게시판 내용 끝 -->
		
			  </div>
			</div>
		</div>
	</div>

</body>
</html>