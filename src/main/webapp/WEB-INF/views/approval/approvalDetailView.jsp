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

					<!--메인페이지 컨텐츠-->
					<div class="document-wrapper">
			            <div class="write-area" style="margin : auto;">
							<table class="table table-bordered">
								<tr>
									<th colspan="2">
										<br><br>
										<h1><strong>${ document.documentForm }</strong></h1>
										<input type="hidden" name="documentNo" value="">	
									</th>
									<td colspan="4" id="approval-section">
										<c:forEach var="list" items="${ list }">
											<table align="right">
			                                	<tr>
			                                    	<th width="120">${ list.userNo }&nbsp;&nbsp; ${ list.jobName }</th>
			                                    </tr>
			                                    <tr style="cursor : pointer;" onclick="location.href='approvalOfApproval.ap?approvalUser=${ list.userNo }&order=${list.approvalOrder}&approvalCount=${ document.approvalCount }&form=${ document.documentForm }&documentNo=${ document.documentNo }'">
			                                    	<td>
			                                    	<br>
				                                    	<c:if test="${ list.status != 0 }">
				                                    		${ list.userNo }
				                                    	</c:if>
			                                    	<br><br>
			                                    	</td>
			                                    </tr>
			                                </table>
			                            </c:forEach>
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="5" style="text-align: left;">
										${ document.documentTitle }
									</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>${ document.depName }</td>
									<th>기안자</th>
									<td>${ document.userNo }</td>
									<th>작성일</th>
									<td>${ document.createDate }</td>
								</tr>
								<c:choose>
									<c:when test="${ document.documentForm eq '업무기안서' }">
										<tr>
											<th>시행일자</th>
											<td colspan="5" style="text-align: left;">
												<div class="date-form" style="display: flex;">
													${ obj.planStart }
												</div>
											</td>
										</tr>
									</c:when>
									<c:when test="${ document.documentForm eq '휴가신청서' }">
										<tr>
						                    <th>휴가종류</th>
						                    <td colspan="5" style="text-align: left;">
						                      <div class="date-form" style="display : flex;">
						                        ${ obj.vacationCategory }
						                      </div>   
						                    </td>
						                </tr>
						                <tr>
						                    <th>휴가기간</th>
						                    <td colspan="5" style="text-align: left;">
						                      <div class="date-form" style="display : flex;">
						                        ${ obj.vacationStart } ~ ${ obj.vacationEnd } (${ obj.vacationCount }일)
						                      </div>   
						                    </td>
						                </tr>
									</c:when>
									<c:when test="${ document.documentForm eq '결근사유서' }">
										<tr>
						                    <th>결근일</th>
						                    <td colspan="5" style="text-align: left;">
							                    <div class="date-form" style="display : flex;">
							                          ${ obj.absenceDate }
							                    </div>   
						                    </td>
					                  	</tr>
									</c:when>
									<c:otherwise>
										<tr>
						                    <th>근무일</th>
						                    <td colspan="5">
						                      <div class="date-form" style="display : flex;">
						                        ${ obj.workDate }
						                      </div>   
						                    </td>
						                </tr>
						                <tr>
						                    <th>근무시간</th>
						                    <td colspan="5">
						                      <div class="date-form" style="display : flex;">
						                        ${ obj.workStart } ~ ${ obj.workEnd } (${ obj.workUse }시간)
						                      </div>   
						                    </td>
						                </tr>
									</c:otherwise>
								</c:choose>
								<tr>
									<th>내용</th>
									<td colspan="5" style="text-align: left; min-height : 200px;" id="document-content">
										<!-- script조회중 -->
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="5" style="text-align : left;">
										<a href="${ document.changeName }" download="${ document.originName }">${ document.originName }</a>
									</td>
								</tr>
								<c:if test="${ not empty document.message }">
					                <tr>
					                    <th>반려사유</th>
					                    <td colspan="5" style="text-align : left;">
					                        ${ document.message }
					                    </td>
					                </tr>
								</c:if>
							</table>
				              <div class="btn-area" align="right">
				                <button class="btn btn-secondary btn-sm" onclick="history.back();">돌아가기</button>
				                <c:if test="${ list[0].status == 0 && document.userNo == m.userName}">
							        <button class="btn btn-danger btn-sm" onclick="deleteApproval();">삭제</button>
						        </c:if>
						        <c:forEach var="i" items="${ list }">
							        <c:if test="${ i.userNo == m.userNo}">
					                	<button class="btn btn-danger btn-sm">반려</button>
					              	</c:if>
				              	</c:forEach>
				              </div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="approvalModal.jsp" />

	<jsp:include page="../common/footer.jsp" />
	
	<script>
		function deleteApproval(){
			if(confirm("삭제하시겠습니까?")){
				let documentNo = '${document.documentNo}';
				location.href="deleteApproval.ap?documentNo=" + documentNo;
			}
		}
	</script>
	
	<c:choose>
		<c:when test="${ document.documentContent eq null}">
			<script>
				// 내용부분 내용 삽입
				$(function(){
					$("#document-content").css('height', "300px");
					$("#document-content").html('내용이 없습니다.');
				})
			</script>
		</c:when>
		<c:otherwise>
			<script>
				// 내용부분 내용 삽입
				$(function(){
					$("#document-content").css('height', "300px");
					$("#document-content").html('${document.documentContent}');
				})
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>