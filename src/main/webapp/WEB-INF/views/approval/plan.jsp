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

					<!--메인페이지 컨텐츠-->
					<form class="document-wrapper">
						<div class="write-area" action="" method="POST">
							<table class="table table-bordered">
								<tr>
									<th colspan="2">
										<br><br>
										<h1><strong>${ document.documentForm }</strong></h1>
									</th>
									<td colspan="4" id="approval-section">
									<!-- ajax 조회 -->
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="5">
										<input type="text" name="" class="form-control form-control-sm" required>
									</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>${ member.depName }</td>
									<th>기안자</th>
									<td>${ member.userName }</td>
									<th>작성일</th>
									<td>${ document.createDate }</td>
								</tr>
								<tr>
									<th>시행일자</th>
									<td colspan="5">
										<div class="date-form" style="display: flex;">
											<input type="date" class="form-control form-control-sm" style="width: 150px;" required>
										</div>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="5" style="text-align: left;">
										<textarea id="summernote" name="editordata" required></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="5">
										<input type="file" class="form-control-file border">
									</td>
								</tr>
							</table>
							<div class="btn-area">
								<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='backPage.ap?documentNo=${ document.documentNo }'">돌아가기</button>
								<button type="submit" class="btn btn-primary btn-sm" id="save">임시저장</button>
								<button type="submit" class="btn btn-primary btn-sm" id="approval">결재상신</button>
							</div>
						</div>
						<div class="approval-wrapper">
							<button class="btn btn-primary btn-sm" id="approval-line" type="button">결재선 설정</button>
							<div class="approval-reference-area" id="approval-list">
								<p>결재선</p>
								<div>
									<!-- ajax 조회 -->								
								</div>
							</div>
							<div class="approval-reference-area" id="reference-list">
								<p>참조</p>
								<div>
									<!-- ajax 조회 -->								
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="approvalModal.jsp" />

	<jsp:include page="../common/footer.jsp" />

	<script>
	    // 결재자, 참조자 조회
		$(function(){
			$.ajax({
				url : "approvalLineView.ap",
				data : {
					documentNo : ${document.documentNo}
				},
				success : function(list){
					approvalSection="";
					approval="";
					reference="";

					if(list.length != 0){
						for(let i = 0; i < list.length; i++){
							if(list[i].referenceStatus == 0){
								approvalSection += '<table align="right">'
								               +  	'<tr>'
								               +    	'<th width="120">' + list[i].userNo + " " + list[i].jobName + '</th>'
								               +  	'</tr>'
								               +  	'<tr>'
								               +  		'<td>'
								               +    		'<br><br><br>'
								               +  		'</td>'
								               +  	'</tr>'
								               +  '</table>';
								               
								approval += '<ul>'
								         +  	'<li>'
								         +  		'<div>'
								         +  			'<img src="' + list[i].profImg + '" alt="프로필이미지">  <strong>' + list[i].depName + '</strong>  ' + list[i].userNo + ' ' + list[i].jobName
								         +  		'</div>'
								         +  	'</li>'
								         +  '</ul>';
							}
							
							if(list[i].referenceStatus == 1){
								reference += '<ul>'
								          +  	'<li>'
								          +  		'<div>'
								          +  			'<img src="' + list[i].profImg + '" alt="프로필이미지">  <strong>' + list[i].depName + '</strong>  ' + list[i].userNo + ' ' + list[i].jobName
								          +  		'</div>'
								          +  	'</li>'
								          +  '</ul>';
							}
						}
						$("#approval-section").html(approvalSection);
						$("#approval-list>div").html(approval);
						$("#reference-list>div").html(reference);
					}
				},
				error : function(){
					console.log("결재자, 참조자 조회 부분 ajax연결 실패");
				}
			})
		})
	</script>
</body>
</html>