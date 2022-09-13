<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
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
                                <th width="10%">번호</th>
                                <th width="50%">제목</th>
                                <th width="15%">작성자</th>
                                <th width="15%">작성일</th>
                                <th width="10%">조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>55</td>
                                <td>공지사항</td>
                                <td>김재현 부장</td>
                                <td>11:30</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>55</td>
                                <td>공지사항</td>
                                <td>김재현 부장</td>
                                <td>11:30</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>55</td>
                                <td>공지사항</td>
                                <td>김재현 부장</td>
                                <td>11:30</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>55</td>
                                <td>공지사항</td>
                                <td>김재현 부장</td>
                                <td>11:30</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>55</td>
                                <td>공지사항</td>
                                <td>김재현 부장</td>
                                <td>11:30</td>
                                <td>5</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="write-button">
                      <button type="button" class="btn btn-sm btn-primary">글쓰기</button>
                    </div>

                    <!-- 페이징 -->
                    <div class="card-footer d-flex justify-content-end">
                      <ul class="pagination pagination-clean pagination-sm mb-0">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" tabindex="-1">‹</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#">›</a>
                        </li>
                      </ul>
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