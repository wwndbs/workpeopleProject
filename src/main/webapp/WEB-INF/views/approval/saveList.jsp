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
						<span>임시저장 문서</span>
						<form class="search-area">
							<input type="text" placeholder="임시저장문서 제목 검색" class="form-control" id="search">
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
							<c:choose>
								<c:when test="${ not empty list }">
									<c:forEach var="list" items="${ list }">
									    <tr>
									        <td>
									            <input type="checkbox" value="${ list.documentNo }" name="delete-check">
									            <input type="hidden" value="${list.changeName}" id="fileName">
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
								</c:when>
								<c:otherwise>
								    <tr>
								        <td colspan="7">임시저장 문서가 없습니다.</td>
								    </tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="bottom-btn">
							<c:if test="${ not empty list }">
							    <ul class="pagination justify-content-center">
							    
							    	<c:if test="${ pi.currentPage != 1 }">
								        <li class="page-item"><a class="page-link" href="saveList.ap?cpage=1">«</a></li>
								        <li class="page-item"><a class="page-link" href="saveList.ap?cpage=${ pi.currentPage - 1 }">‹</a></li>
							        </c:if>
							        
							        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
							        	<c:choose>
							        		<c:when test="${ pi.currentPage != p }">
									        	<li class="page-item"><a class="page-link" href="saveList.ap?cpage=${ p }">${ p }</a></li>
							        		</c:when>
							        		<c:otherwise>
							        			<li class="page-item"><a class="page-link" href="saveList.ap?cpage=${ p }"><strong>${ p }</strong></a></li>
							        		</c:otherwise>
							        	</c:choose>
							        </c:forEach>
							        
							        <c:if test="${ pi.currentPage != pi.endPage }">
								        <li class="page-item"><a class="page-link" href="saveList.ap?cpage=${ pi.currentPage + 1 }">›</a></li>
								        <li class="page-item"><a class="page-link" href="saveList.ap?cpage=${ pi.endPage }">»</a></li>
								    </c:if>
							    </ul>
						    </c:if>
							<button class="btn btn-danger" id="delete-btn">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		// 문서 상세조회
		$(".list-wrapper>table>tbody>tr").click(function(){
			let approvalNo = $(this).children().eq(1).text();
			let approvalForm = $(this).children().eq(2).text();
			
			location.href="saveListModify?no=" + approvalNo + "&form=" + approvalForm;
		})
	</script>
	
	<script>
	    // 임시저장 문서 검색
		$("#search").keyup(function(){
			let keyword = $("#search").val();
			
			$.ajax({
				url : "searchSaveList.ap",
				data : {
					keyword : keyword
				},
				success : function(map){
					let pi = map.pi;
					let list = map.list;
					value="";
					page="";
					
					if(list.length != 0){
						for(let i = 0; i < list.length; i++){
							value += '<tr>'
							      +  	'<td>'
							      +     	'<input type="checkbox" value="' + list[i].documentNo + '" name="delete-check">'
							      +     '</td>'
								  +     '<td>' + list[i].documentNo + '</td>'
								  +     '<td>' + list[i].documentForm + '</td>'
								  +     '<td>' + list[i].documentTitle + '</td>'
								  +     '<td>' + list[i].userNo + '</td>'
								  +     '<td>' + list[i].createDate + '</td>'
								  +     '<td>'
								  +     	'<div class="tag-gray">임시저장</div>'
								  +     '</td>'
							      +  '</tr>'
							
							$('.list-wrapper>table>tbody').html(value);
						}
					}else{
						selectData(1);
					}
					
					if(list.length != 0){
						page += '<ul class="pagination justify-content-center">';
						
						if(pi.currentPage != 1){
							page += '<li class="page-item"><a class="page-link" href="savelListView.ap?cpage=' + pi.startPage + '">«</a></li>'
								 +  '<li class="page-item"><a class="page-link" href="savelListView.ap?cpage=' + (pi.currentPage - 1) + '">‹</a></li>';
						}
						
						for(let p = pi.startPage; p <= pi.endPage; p++){
							page += '<li class="page-item"><a class="page-link" href="savelListView.ap?cpage=' + p + '">' + p + '</a></li>';
						}
						
						if(pi.currentPage != pi.endPage){
							page += '<li class="page-item"><a class="page-link" href="savelListView.ap?cpage=' + (pi.startPage + 1) + '">›</a></li>'
								 +  '<li class="page-item"><a class="page-link" href="savelListView.ap?cpage=' + pi.endPage + '">»</a></li>';
						}
						page += '</ul>'
						     +  '<button class="btn btn-danger" id="delete-btn">삭제</button>'
						
						$('.list-wrapper>div').html(page);
					}
					$('.bottom-btn ul').html("");
				},
				error : function(){
					console.log("임시저장문서 검색부분 ajax연결 실패");
				}
			})
		})
	</script>
	
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
					$("input[name='delete-check']").prop("checked", true);
				}else{
					$("input[name='delete-check']").prop("checked", false);
				}
			})
			
			$("input[name='delete-check']").click(function(){
				let count = $("input[name='delete-check']").length; // 체크박스 수
				let check =  $("input[name='delete-check']:checked").length; // 체크된 체크박스 수

				// 체크박스 수와 체크된 체크박스 수 일치하면 all-check 체크박스 check상태 true 일치하지 않으면 false
				if(count == check){
					$("#all-check").prop("checked", true);
				}else{
					$("#all-check").prop("checked", false);
				}
			})
		})
	</script>
	
	<script>
	    // 임시저장문서 삭제
		$(document).on("click", "#delete-btn", function(){

			let checkCount = $("input[name='delete-check']:checked").length; // 체크된 체크박스 수
			let checkList = $("input[name='delete-check']:checked"); // 체크된 체크박스 리스트
			let checkListNext = $("input[name='delete-check']:checked + input[type=hidden]"); // 체크된 체크박스 리스트의 다음 요소

			if(checkCount > 0){
				if(confirm("정말 삭제 하시겠습니까?")){
					let documentNo = "";
					let fileName = "";
					for(let i = 0; i < checkList.length; i++){
						if(i == (checkList.length - 1)){
							documentNo += checkList[i].value;
							fileName += checkListNext[i].value;
						}else{
							documentNo += checkList[i].value + ",";
							fileName += checkListNext[i].value; + ",";
						}
					}
					
					$.ajax({
						url : "deleteSaveList.ap",
						data : {
							no : documentNo,
							changeName : fileName
						},
						success : function(msg){
							location.reload();
							alert(msg);
							
						},
						error : function(){
							console.log("임시저장문서 삭제 부분 ajax 연결 실패");
						}
					})
				}
			}else{
				alert("선택된 목록이 없습니다.");				
			}
		})
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>