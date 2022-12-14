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
					<form class="document-wrapper" method="post" enctype="multipart/form-data">
						<div class="write-area">
							<table class="table table-bordered">
								<tr>
									<th colspan="2">
										<br><br>
										<h1><strong>${ document.documentForm }</strong></h1>
										<input type="hidden" name="documentNo" value="${ document.documentNo }">	
										<br>
									</th>
									<td colspan="4" id="approval-section">
									<!-- ajax 조회 -->
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="5">
										<input type="text" name="documentTitle" class="form-control form-control-sm" value="${ document.documentTitle }" required>
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
								<c:choose>
									<c:when test="${ document.documentForm eq '업무기안서' }">
										<tr>
											<th>시행일자</th>
											<td colspan="5">
												<div class="date-form" style="display: flex;">
													<input type="date" name="planStart" class="form-control form-control-sm" style="width: 150px;" value="${ obj.planStart }">
												</div>
											</td>
										</tr>
									</c:when>
									<c:when test="${ document.documentForm eq '휴가신청서' }">
										<tr>
				                            <th>휴가종류</th>
				                            <td colspan="5">
				                                <select class="form-control form-control-sm" id="sel1" name="vacationCategory">
				                                  <option value="연차">연차</option>
				                                  <option value="병가">병가</option>
				                                  <option value="경조사">경조사</option>
				                                  <option value="기타">기타</option>
				                                </select>
				                            </td>
				                        </tr>
			                            <script>
			                            	$(function(){
			                            		let value = '${obj.vacationCategory}';
			                            		$("#sel1").val(value);
			                            	})
			                            </script>
				                        <tr>
				                            <th>휴가기간</th>
				                            <td colspan="5">
				                              <div class="date-form" style="display : flex;">
				                                <input type="date" name="vacationStart" class="form-control form-control-sm" style="width : 150px;" value='${ obj.vacationStart }'>
				                                <span>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;</span>
				                                <input type="date" name="vacationEnd" class="form-control form-control-sm" style="width : 150px;" value='${ obj.vacationEnd }'>
				                              </div>   
				                            </td>
				                        </tr>
									</c:when>
									<c:when test="${ document.documentForm eq '결근사유서' }">
				                        <tr>
				                            <th>결근일</th>
				                            <td colspan="5">
				                              <div class="date-form" style="display : flex;">
				                                <input type="date" name="absenceDate" class="form-control form-control-sm" style="width : 150px;" value='${ obj.absenceDate }'>
				                              </div>   
				                            </td>
				                        </tr>
									</c:when>
									<c:otherwise>
				                        <tr>
				                            <th>근무일</th>
				                            <td colspan="5">
				                              <div class="date-form" style="display : flex;">
				                                <input type="date" name="workDate" class="form-control form-control-sm" style="width : 150px;" value='${ obj.workDate }'>
				                              </div>   
				                            </td>
				                        </tr>
				                        <tr>
				                            <th>근무시간</th>
				                            <td colspan="5">
				                              <div class="date-form" style="display : flex;">
				                                <input type="time" name="workStart" class="form-control form-control-sm" style="width : 150px;" value='${ obj.workStart }'>
				                                <span>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;</span>
				                                <input type="time" name="workEnd" class="form-control form-control-sm" style="width : 150px;" value='${ obj.workEnd }'>
				                              </div>   
				                            </td>
				                        </tr>
									</c:otherwise>
								</c:choose>
								<tr>
									<th>내용</th>
									<td colspan="5" style="text-align: left;">
										<textarea id="summernote" name="documentContent">${ document.documentContent }</textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="5" style="text-align : left;">
			                    		<input type="file" id="upfile" class="form-control-file border" name="upfile">
			                            현재 업로드된 파일 : 
			                            <a href="${ document.changeName }" download="${ document.originName }">${ document.originName }</a>
										<input type="hidden" name="originName" value="${ document.originName }">
										<input type="hidden" name="changeName" value="${ document.changeName }">
									</td>
								</tr>
							</table>
							<div class="btn-area">
								<button type="button" class="btn btn-secondary btn-sm" onclick="history.back();">돌아가기</button>
								<c:choose>
									<c:when test="${ document.documentForm eq '업무기안서' }">
										<button type="submit" class="btn btn-primary btn-sm" id="save" formaction="insertApprovalPlan.ap" name="status" value="2">임시저장</button>
										<button type="submit" class="btn btn-primary btn-sm" id="approval" formaction="insertApprovalPlan.ap" formenctype="multipart/form-data" disabled>결재상신</button>
									</c:when>
									<c:when test="${ document.documentForm eq '휴가신청서' }">
										<button type="submit" class="btn btn-primary btn-sm" id="save" name="status" formaction="insertApprovalVacation.ap" value="2">임시저장</button>
										<button type="submit" class="btn btn-primary btn-sm" id="approval" formaction="insertApprovalVacation.ap" formenctype="multipart/form-data" disabled>결재상신</button>
									</c:when>
									<c:when test="${ document.documentForm eq '결근사유서' }">
										<button type="submit" class="btn btn-primary btn-sm" id="save" name="status" formaction="insertApprovalAbsence.ap" value="2">임시저장</button>
										<button type="submit" class="btn btn-primary btn-sm" id="approval" formaction="insertApprovalAbsence.ap" formenctype="multipart/form-data" disabled>결재상신</button>
									</c:when>
									<c:otherwise>
										<button type="submit" class="btn btn-primary btn-sm" id="save" name="status" formaction="insertApprovalOvertime.ap" value="2">임시저장</button>			
										<button type="submit" class="btn btn-primary btn-sm" id="approval" formaction="insertApprovalOvertime.ap" formenctype="multipart/form-data" disabled>결재상신</button>
									</c:otherwise>
								</c:choose>																						
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

	<jsp:include page="../common/commonToast.jsp" />

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
								               
								approval += '<ul id="a">'
								         +  	'<li>'
								         +  		'<div>'
								         +  			'<img src="' + list[i].profImg + '" alt="프로필이미지">  <strong>' + list[i].depName + '</strong>  ' + list[i].userNo + ' ' + list[i].jobName
								         +  		'</div>'
								         +  	'</li>'
								         +  '</ul>';
								$("#approval").prop("disabled", false);
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