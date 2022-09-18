<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 게시판</title>
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
                    <h5>${ depName } 게시판</h5>

                    <div class="board-search">
                        <select name="" id="" style="height: 27px;">
                            <option value="">제목+내용</option>
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">작성자</option>
                        </select>
                        <input type="text">
                        <button type="button" class="btn btn-sm btn-primary">search</button>
                    </div>
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
                                <th width="10px">좋아요</th>
                            </tr>
                        </thead>
                        <tbody> <!-- 시간 다르게 표현하기 도전 -->
                        	<c:choose>
                        		<c:when test="${ empty list }">
                        			<tr>
                        				<td colspan="6">현재 게시글이 없습니다.</td>
                        			</tr>
                        		</c:when>
                        		<c:otherwise> 
                        			<c:forEach var="b" items="${ list }" varStatus="status">
			                            <tr>
			                            	<input type="hidden" name="boardNo" value="${ b.boardNo }">
			                                <td>${ list.size() - status.index }</td>
			                                <td>
		                                		${ b.boardTitle }
		                                		<!-- 댓글이 존재할 경우에만 보여짐 -->
		                                		<c:if test="${ b.reply ne 0 }">
			                                		<span class="i-reply">
			                                			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
			                                			[${ b.reply }]
			                                		</span>
		                                		</c:if>
		                                	</td>
			                                <td>${ b.userName } ${ b.jobName }</td>
			                                <td>${ b.createDate }</td>
			                                <td>${ b.count }</td>
			                                <td>${ b.like }</td>
			                            </tr>
		                            </c:forEach>
		                        </c:otherwise>
		                    </c:choose>
                        </tbody>
                    </table>
                    
                    <c:if test="${ not empty loginUser }">
	                    <div class="write-button">
	                      <button type="button" class="btn btn-sm btn-primary" onclick="location.href='enrollForm.bo?no=2'">글쓰기</button>
	                    </div>
                    </c:if>
                    
                    <c:if test="${ not empty list }">

	                    <!-- 페이징 -->
	                    <div class="card-footer d-flex justify-content-end">
	                      <ul class="pagination pagination-clean pagination-sm mb-0">
	                      	<c:if test="${ pi.currentPage ne 1 }">
		                        <li class="page-item">
		                          <a class="page-link" href="list.bo?no=2&dept=${ depName }&cpage=${ pi.currentPage - 1 }">‹</a>
		                        </li>
	                      	</c:if>
	                      	
	                      	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                      		
	                      		<c:choose>
	                      			<c:when test="${ p eq pi.currentPage }">
	                      				<li class="page-item active"><a class="page-link" href="list.bo?no=2&dept=${ depName }&cpage=${ p }">${ p }</a></li>
	                      			</c:when>
	                      			<c:otherwise>
	                      				<li class="page-item"><a class="page-link" href="list.bo?no=2&dept=${ depName }&cpage=${ p }">${ p }</a></li>
	                      			</c:otherwise>
	                      		</c:choose>
	                      		
	                      	</c:forEach>
	                      	
	                      	<c:if test="${ pi.currentPage ne pi.maxPage }">
	                      		<li class="page-item">
		                          <a class="page-link" href="list.bo?no=2&dept=${ depName }&cpage=${ pi.currentPage + 1 }">›</a>
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