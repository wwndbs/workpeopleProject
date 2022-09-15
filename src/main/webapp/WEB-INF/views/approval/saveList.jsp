<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<span>임시저장 문서</span>
						<form class="search-area">
							<input type="text" placeholder="임시저장문서 검색" class="form-control">
							<button class="btn btn-primary">검색</button>
						</form>
					</div>

					<div class="menu-wrapper"></div>

					<div class="list-wrapper">
						<table class="table table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th width="10">
										<input type="checkbox" id="all-check">
									</th>
									<th width="100">번호 <a href="#"><strong>⇅</strong></a></th>
									<th width="200">결재양식</th>
									<th>제목</th>
									<th width="100">작성자</th>
									<th width="200">작성일 <a href="#"><strong>⇅</strong></a></th>
									<th width="150">결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${ list }">
									<tr>
										<td>
											<input type="checkbox">
										</td>
										<td>${ list.documentNo }</td>
										<td>${ list.documentForm }</td>
										<td>${ list.documentTitle }</td>
										<td>${ list.userNo }</td>
										<td>${ list.createDate }</td>
										<td>
											<div class="tag-gray">임시저장</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${ not empty list }">
							<div class="bottom-btn">
								<ul class="pagination justify-content-center">
									<c:if test="${ pi.currentPage != 1 }">
										<li class="page-item"><a class="page-link" href="saveList?cpage=${ pi.startPage }">«</a></li>
										<li class="page-item"><a class="page-link" href="saveList?cpage=${ pi.currentPage - 1 }">‹</a></li>
									</c:if>
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
										<li class="page-item"><a class="page-link" href="saveList?cpage=${ p }">${ p }</a></li>
									</c:forEach>
									<c:if test="${ pi.currentPage != pi.endPage }">
										<li class="page-item"><a class="page-link" href="saveList?cpage=${ pi.currentPage + 1 }">›</a></li>
										<li class="page-item"><a class="page-link" href="saveList?cpage=${ pi.endPage }">»</a></li>
									</c:if>
								</ul>
								<button class="btn btn-danger">삭제</button>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		/*
			체크박스 관련 script
			- all-check 체크박스 클릭시 하위 모든 체크박스 체크상태 전환
			- all-check 체크박스 클릭 후 하위 체크박스 중 하나라도 check상태가 false면 all-check 체크박스 check상태 false전환
			- 하위 체크박스가 모두 체크된 상태면 all-check 체크박스 체크상태 전환
			- 
		*/
		$(function(){
			$("#all-check").click(function(){
				if($("#all-check").is(":checked")){
					$(".list-wrapper>table>tbody input").prop("checked", true);
				}else{
					$(".list-wrapper>table>tbody input").prop("checked", false);
				}
			})
			
			$(".list-wrapper>table>tbody input").click(function(){
				let count = $(".list-wrapper>table>tbody input").length; // 체크박스 수
				let check =  $(".list-wrapper>table>tbody input:checked").length; // 체크된 체크박스 수

				// 체크박스 수와 체크된 체크박스 수 일치하면 all-check 체크박스 check상태 true 일치하지 않으면 false
				if(count == check){
					$("#all-check").prop("checked", true);
				}else{
					$("#all-check").prop("checked", false);
				}
			})
		})
	</script>
</body>
</html>