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
						<form class="search-area" action="">
							<input type="text" placeholder="결재검색" class="form-control" id="search">
							<button class="btn btn-primary">검색</button>
						</form>
					</div>
					<div class="menu-wrapper">
						<button class="btn btn-secondary btn-sm" onclick="approvalList();">전체</button>
						<button class="btn btn-secondary btn-sm" onclick="approvalList(2);">진행</button>
						<button class="btn btn-secondary btn-sm" onclick="approvalList(3);">완료</button>
						<button class="btn btn-secondary btn-sm" onclick="approvalList(4);">반려</button>
						<button class="btn btn-secondary btn-sm" onclick="approvalList(5);">대기</button>
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
								<!-- ajax 조회 -->
							</tbody>
						</table>
						<div>
							<!-- ajax 조회 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		// 최초 페이지 로딩 시 조회되는 결재 내역 조회
		$(function(){
			$.ajax({
				url : "approvalListView.ap",
				success : function(map){
					let pi = map.pi;
					let list = map.list;
					value="";
					page="";

					if(list.length != 0){
						for(let i = 0; i < list.length; i++){
							value += '<tr>'
							      +  	'<td>' + list[i].documentNo + '</td>'
							      +  	'<td>' + list[i].documentForm + '</td>'
							      +  	'<td>' + list[i].documentTitle + '</td>'
							      +  	'<td>' + list[i].userNo + '</td>'
							      +  	'<td>' + list[i].createDate + '</td>';
							if(list[i].progress == 0){
								value += '<td>'
								      +  	'<div class="tag-gray">대기</div>'
								      +  '</td>';
							}else if(list[i].progress == 1){
								value += '<td>'
								      +  	'<div class="tag-orange">진행중</div>'
								      +  '</td>';	
							}else if(list[i].progress == 2){
								value += '<td>'
								      +  	'<div class="tag-green">완료</div>'
								      +  '</td>';							
							}else if(list[i].progress == 3){
								value += '<td>'
								      +  	'<div class="tag-red">반려</div>'
								      +  '</td>';						
							}
							
							$('.list-wrapper>table>tbody').html(value);
						}
					}else{
						value += '<tr>'
						      +  	'<td colspan="6">결재 문서가 없습니다.</td>'
						      +  '</tr>'
						$('.list-wrapper>table>tbody').html(value);
					}
					
					if(list.length != 0){
						page += '<ul class="pagination justify-content-center">';
						
						if(pi.currentPage != 1){
							page += '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + pi.startPage + '">«</a></li>'
								 +  '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + (pi.currentPage - 1) + '">‹</a></li>';
						}
						
						for(let p = pi.startPage; p <= pi.endPage; p++){
							page += '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + p + '">' + p + '</a></li>';
						}
						
						if(pi.currentPage != pi.endPage){
							page += '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + (pi.startPage + 1) + '">›</a></li>'
								 +  '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + pi.endPage + '">»</a></li>';
						}
						page += '</ul>';
						
						$('.list-wrapper>div').html(page);
					}
				},
				error : function(){
					console.log("전체 결재 내역 조회 ajax연결 실패");
				}
			})
		})
	</script>
	
	<script>
		// 각 카테고리별 데이터 조회
		function approvalList(category){
			$.ajax({
				url : "approvalListView.ap",
				data : {
					category : category
				},
				success : function(map){
					let pi = map.pi;
					let list = map.list;
					value="";
					page="";

					if(list.length != 0){
						for(let i = 0; i < list.length; i++){
							value += '<tr>'
							      +  	'<td>' + list[i].documentNo + '</td>'
							      +  	'<td>' + list[i].documentForm + '</td>'
							      +  	'<td>' + list[i].documentTitle + '</td>'
							      +  	'<td>' + list[i].userNo + '</td>'
							      +  	'<td>' + list[i].createDate + '</td>';
							if(list[i].progress == 0){
								value += '<td>'
								      +  	'<div class="tag-gray">대기</div>'
								      +  '</td>';
							}else if(list[i].progress == 1){
								value += '<td>'
								      +  	'<div class="tag-orange">진행중</div>'
								      +  '</td>';	
							}else if(list[i].progress == 2){
								value += '<td>'
								      +  	'<div class="tag-green">완료</div>'
								      +  '</td>';							
							}else if(list[i].progress == 3){
								value += '<td>'
								      +  	'<div class="tag-red">반려</div>'
								      +  '</td>';						
							}
							
							$('.list-wrapper>table>tbody').html(value);
						}
					}else{
						value += '<tr>'
						      +  	'<td colspan="6">결재 문서가 없습니다.</td>'
						      +  '</tr>'
						$('.list-wrapper>table>tbody').html(value);
					}
					
					if(list.length != 0){
						page += '<ul class="pagination justify-content-center">';
						
						if(pi.currentPage != 1){
							page += '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + pi.startPage + '">«</a></li>'
								 +  '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + (pi.currentPage - 1) + '">‹</a></li>';
						}
						
						for(let p = pi.startPage; p <= pi.endPage; p++){
							page += '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + p + '">' + p + '</a></li>';
						}
						
						if(pi.currentPage != pi.endPage){
							page += '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + (pi.startPage + 1) + '">›</a></li>'
								 +  '<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=' + pi.endPage + '">»</a></li>';
						}
						page += '</ul>';
						
						$('.list-wrapper>div').html(page);
					}
				},
				error : function(){
					console.log("카테고리별 결재 내역 조회 ajax연결 실패");
				}
			})
		}
	</script>
	
	<script>
		$(function(){
			$("#search").keydown(function(){
				let keyword = $("#search").val();
				console.log(keyword);
			})
		})
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>