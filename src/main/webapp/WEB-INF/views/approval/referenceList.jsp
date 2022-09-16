<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />

		<!-- 컨텐츠 부분-->
		<div class="adminx-content">
			<div class="adminx-main-content">
				<div class="container-fluid">

					<div class="search-wrapper">
						<span>참조문서</span>
						<form class="search-area">
							<input type="text" placeholder="참조문서 검색" class="form-control">
							<button class="btn btn-primary">검색</button>
						</form>
					</div>

					<div class="menu-wrapper"></div>

					<div class="list-wrapper">
						<table class="table table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th width="100">번호 <a href="sortList.ap?type=noSort"><strong>⇅</strong></a></th>
									<th width="200">결재양식</th>
									<th>제목</th>
									<th width="100">작성자</th>
									<th width="200">작성일 <a href="sortList.ap?type=dateSort"><strong>⇅</strong></a></th>
									<th width="150">결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ not empty list }">
										<c:forEach var="list" items="${ list }">
											<tr>
												<td>${ list.documentNo }</td>
												<td>${ list.documentForm }</td>
												<td>${ list.documentTitle }</td>
												<td>${ list.userNo }</td>
												<td>${ list.createDate }</td>
												<c:choose>
													<c:when test="${ list.progress == 0 }">
														<td>
															<div class="tag-gray">대기</div>
														</td>
													</c:when>
													<c:when test="${ list.progress == 1 }">
														<td>
															<div class="tag-orange">진행중</div>
														</td>
													</c:when>
													<c:when test="${ list.progress == 2 }">
														<td>
															<div class="tag-green">완료</div>
														</td>
													</c:when>
													<c:when test="${ list.progress == 3 }">
														<td>
															<div class="tag-red">반려</div>
														</td>
													</c:when>
												</c:choose>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6">참조 문서가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<c:if test="${ not empty list }">
							<ul class="pagination justify-content-center">
								<c:if test="${ pi.currentPage != 1 }">
									<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ pi.startPage }">«</a></li>
									<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ pi.currentPage - 1 }">‹</a></li>								
								</c:if>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								
								<c:if test="${ pi.currentPage != pi.endPage }">
									<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ pi.currentPage + 1 }">›</a></li>
									<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ pi.endPage }">»</a></li>
								</c:if>
							</ul>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>