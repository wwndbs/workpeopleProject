<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<span>결재조회</span>
						<div class="search-area">
							<input type="text" placeholder="결재검색" class="form-control">
							<button class="btn btn-primary">검색</button>
						</div>
					</div>
					<div class="menu-wrapper">
						<button class="btn btn-secondary btn-sm">전체(99)</button>
						<button class="btn btn-secondary btn-sm">진행(99)</button>
						<button class="btn btn-secondary btn-sm">완료(99)</button>
						<button class="btn btn-secondary btn-sm">반려(99)</button>
						<button class="btn btn-secondary btn-sm">대기(99)</button>
					</div>
					<div class="list-wrapper">
						<table class="table table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th width="100">번호 <a href="#"><strong>⇅</strong></a></th>
									<th width="200">결재양식</th>
									<th>제목</th>
									<th width="100">작성자</th>
									<th width="200">작성일 <a href="#"><strong>⇅</strong></a></th>
									<th width="150">결재상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-orange">진행중</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-orange">진행중</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-red">반려</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-red">반려</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-green">완료</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-green">완료</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-gray">대기</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-gray">대기</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-orange">진행중</div>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>차량배차 신청서</td>
									<td>차량배차 신청합니다.</td>
									<td>홍길동</td>
									<td>2022-22-22</td>
									<td>
										<div class="tag-orange">진행중</div>
									</td>
								</tr>
							</tbody>
						</table>
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="javascript:void(0);">«</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">‹</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">›</a></li>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">»</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>