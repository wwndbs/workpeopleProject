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
							<input type="text" placeholder="결재제목 검색" class="form-control" id="search">
						</form>
					</div>
					<div class="menu-wrapper">
						<button class="btn btn-secondary btn-sm" onclick="location.href='approvalList.ap'">전체</button>
						<button class="btn btn-secondary btn-sm" onclick="location.href='approvalList.ap?category=1'">진행</button>
						<button class="btn btn-secondary btn-sm" onclick="location.href='approvalList.ap?category=2'">완료</button>
						<button class="btn btn-secondary btn-sm" onclick="location.href='approvalList.ap?category=3'">반려</button>
						<button class="btn btn-secondary btn-sm" onclick="location.href='approvalList.ap?category=0'">대기</button>
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
									        <td colspan="6">결재 내역이 없습니다.</td>
									    </tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div>
							<c:if test="${ not empty list }">
							    <ul class="pagination justify-content-center">
							    
							    	<c:if test="${ pi.currentPage != 1 }">
							    		<c:choose>
							    			<c:when test="${ category != 4 }">
										        <li class="page-item"><a class="page-link" href="approvalList.ap?category=${ category }&cpage=1">«</a></li>
										        <li class="page-item"><a class="page-link" href="approvalList.ap?category=${ category }&cpage=${ pi.currentPage - 1 }">‹</a></li>							    			
							    			</c:when>
							    			<c:otherwise>
										        <li class="page-item"><a class="page-link" href="approvalList.ap?cpage=1">«</a></li>
										        <li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ pi.currentPage - 1 }">‹</a></li>							    										    			
							    			</c:otherwise>
							    		</c:choose>
							        </c:if>
							        
							        <c:choose>
							        	<c:when test="${ category != 4 }">
									        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
									        	<c:choose>
									        		<c:when test="${ pi.currentPage != p }">
											        	<li class="page-item"><a class="page-link" href="approvalList.ap?category=${ category }&cpage=${ p }">${ p }</a></li>
									        		</c:when>
									        		<c:otherwise>
									        			<li class="page-item"><a class="page-link" href="approvalList.ap?category=${ category }&cpage=${ p }"><strong>${ p }</strong></a></li>
									        		</c:otherwise>
									        	</c:choose>
									        </c:forEach>
							        	</c:when>
							        	<c:otherwise>
									        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
									        	<c:choose>
									        		<c:when test="${ pi.currentPage != p }">
											        	<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ p }">${ p }</a></li>
									        		</c:when>
									        		<c:otherwise>
									        			<li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ p }"><strong>${ p }</strong></a></li>
									        		</c:otherwise>
									        	</c:choose>
									        </c:forEach>
							        	</c:otherwise>
							        </c:choose>

							        
							        <c:choose>
							        	<c:when test="${ category != 4 }">
									        <li class="page-item"><a class="page-link" href="approvalList.ap?category=${ category }&cpage=${ pi.currentPage + 1 }">›</a></li>
									        <li class="page-item"><a class="page-link" href="approvalList.ap?category=${ category }&cpage=${ pi.endPage }">»</a></li>							        	
							        	</c:when>
							        	<c:otherwise>
									        <li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ pi.currentPage + 1 }">›</a></li>
									        <li class="page-item"><a class="page-link" href="approvalList.ap?cpage=${ pi.endPage }">»</a></li>							        	
							        	</c:otherwise>
							        </c:choose>
							        <c:if test="${ pi.currentPage != pi.endPage }">
								    </c:if>
							    </ul>
						    </c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/commonToast.jsp" />

	<script>
	      // 검색창에 value값이 없을 시 
	      $("#search").keyup( function() {
	    	  let keyword = $("#search").val();
				
	    	  if(!keyword){
	    		  location.href="approvalList.ap";
	    	  }
	      })
	</script>

	<script>
	    // 문서 상세조회
		$(".list-wrapper>table>tbody>tr").click(function(){
			let approvalNo = $(this).children().eq(0).text();
			let approvalForm = $(this).children().eq(1).text();
			
			location.href="approvalDetail.ap?no=" + approvalNo + "&form=" + approvalForm;
		})
	</script>
	
	<script>
	    // 결재 내역 검색
		$(function(){
			$("#search").keyup(function(){
				let keyword = $("#search").val();
				
				$.ajax({
					url : "searchApproval.ap",
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
							      +  	'<td colspan="6">검색결과가 없습니다.</td>'
							      +  '</tr>'
							$('.list-wrapper>table>tbody').html(value);
						}
						$('.list-wrapper>div').html("");
					},
					error : function(){
						console.log("검색 부분 ajax연결 실패");
					}
				})
			})
		})
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>