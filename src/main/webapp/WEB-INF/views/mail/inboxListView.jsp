<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>

	<div class="adminx-container">
	
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/menubar.jsp" />
		
		
      <!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content" style="padding-left:65px;">
        <div class="adminx-main-content" style="padding: 0; height: 100%;">
          <div class="container-fluid" style="padding: 0; height: 100%;">
            <!-- 메일 전체 div 시작 -->
            <div class="container-mail">
	
			<jsp:include page="../mail/mailSidebar.jsp"/>
              
              <!-- 메일 내용 시작 -->
              <div class="mail-main-form">
              	<!-- 제목 + 버튼 + 리스트 div 시작 -->
				<div class="mail-main-form-list">                
	                <span class="mail-h">받은 메일함</span>
	                <span>전체 메일 ${ listCount } / 안 읽은 메일 ${ notReadCount } </span>
	
	                <form action="">
	                  <!-- 상단 버튼 박스 시작 -->
	                  <div class="mail-btn-content" style="width: 580px;">
	                    <input type="checkbox" id="checkAll" style="margin-right: 10px;">
	
	                    <button type="button" class="mail-btn4" id="spamBtn">
	                      <ion-icon name="ban-sharp" style="margin-top:5px; font-size: 20px;"></ion-icon>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;스팸신고</span>
	                    </button>
	                    
	                    <button type="button" class="mail-btn5">
	                      <ion-icon name="return-down-forward-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;답장</span>
	                    </button>                    
	                    
	                    <button type="button" class="mail-btn5">
	                      <ion-icon name="trash-outline" style="margin-top:5px; font-size: 19px;"></ion-icon>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;삭제</span>
	                    </button>    
	
	                    <button type="button" class="mail-btn5 dropdown">
	                      <i class="fas fa-tag" style="margin-top:8px; font-size: 16px;"></i>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;태그</span>
	                      <!--태그 드롭다운-->
	                      <div class="dropdown-tagList">
	                        <table style="width: 100%;">
	                          <tr>
	                            <td>
	                              <i class="fas fa-tag" style="margin-top:8px; font-size: 16px; color: crimson;"></i>
	                              <span class="tagName">나의부서</span>
	                            </td>
	                            <td>
	                              <a href="" class="mail-a-taglist">적용</a>
	                            </td>
	                            <td>
	                              <a href="" class="mail-a-taglist">X해제</a>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <i class="fas fa-tag" style="margin-top:8px; font-size: 16px; color: dodgerblue;"></i>
	                              <span class="tagName">외부업체</span>
	                            </td>
	                            <td>
	                              <a href="" class="mail-a-taglist">적용</a>
	                            </td>
	                            <td>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td>
	                              <i class="fas fa-tag" style="margin-top:8px; font-size: 16px; color: gold;"></i>
	                              <span class="tagName">참고자료</span>
	                            </td>
	                            <td>
	                            </td>
	                            <td>
	                              <a href="" class="mail-a-taglist">X해제</a>
	                            </td>
	                          </tr>
	                        </table>
	                      </div>
	                    </button>  
	
	                    <button type="button" class="mail-btn5">
	
	                      <i class="material-icons-sharp" style="margin-top:3px; font-size: 25px;">
	                        arrow_right_alt
	                      </i>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;전달</span>
	                    </button>
	                    
	                    <button type="button" class="mail-btn5" id="readBtn">
	                      <ion-icon name="mail-open-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;읽음</span>
	                    </button>
	                  </div>
	                  <!-- 상단 버튼 박스 끝 -->
	
	                  <!-- 메일함 시작 -->
	                  <div class="mail-list-content">
	
	                   <table class="mail-table-list">
	                     <tr class="mail-list-division">
	                      <td colspan="3">최근 메일</td>
	                      <td colspan="3"><hr></td>
	                     </tr>
	                    
	                    <c:choose>
	                		<c:when test="${ empty list }">
	                			<tr>
	                				<td colspan="5" class="noList">현재 받은 메일이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
	                			<c:forEach var="m" items="${ list }">
									<tr>
				                      <td class="d1">
				                      	  <input type="checkbox" name="check" value="${ m.mailNo }">
				                      </td>
				                      <td class="d2">
				                      	<c:choose>
				                      		<c:when test="${ m.mailStatus.mailImportant eq 'Y' }">
				                        		<ion-icon name="bookmark" class="important"></ion-icon>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<ion-icon name="bookmark-outline" class="important"></ion-icon>
				                        	</c:otherwise>
				                        </c:choose>
				                      </td>
				                      <td class="d3">
				                      	<c:choose>
				                      		<c:when test="${ m.mailStatus.mailRead eq 'Y' }">
				                        		<ion-icon name="mail-open-outline" class="read"></ion-icon>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<ion-icon name="mail" class="read"></ion-icon>
				                        	</c:otherwise>
				                        </c:choose>
				                      </td>
				                      <td class="d4">
				                      	<c:choose>
				                      		<c:when test="${ empty m.senderName }">
				                      			<span>${ m.sender }</span>
				                      		</c:when>
				                      		<c:otherwise>
						                        <span>${ m.senderName }</span>
				                      		</c:otherwise>
				                      	</c:choose>
				                      </td>
				                      <td class="d5">
				                      	<c:choose>
				                      		<c:when test="${ not empty m.tag }">
				                      			<i class="fas fa-tag" style="color: ${ m.tag.tagColor };"></i>
				                      		</c:when>
				                      	</c:choose>
				                        <span>${ m.mailTitle }</span>
				                        <ion-icon name="copy-outline"></ion-icon>
				                      </td>
				                      <td class="d6">${ m.sendDate }</td>
				                    </tr>
			                    </c:forEach>
		                    </c:otherwise>
						</c:choose>
	                   </table>
						
					<!--toast div-->
					<div id="toast">
					</div>
					
						<script>
							$(function(){
								// 메일 상세조회 페이지 요청
			            		$(".d5>span").click(function(){
			            			location.href = 'detail.ma?no=' + $(this).parent().siblings().eq(0).children().val();
								})
			            	
	            				// 상단 체크박스로 전체 선택, 전체 해제 
								$("#checkAll").click(function(){

									 if($("#checkAll").prop("checked")){
										 $("input[name=check]").prop("checked", true);
									 }else {
										 $("input[name=check]").prop("checked", false);
									 }
									 
								})
								
								// 전체 체크박스 수와 체크된 체크박스 수 일치하면 상단 체크박스도 check:true,
								// 일치하지 않으면 상단 체크박스도 check:false
								$("input[name=check]").click(function(){
									let total = $("input[name=check]").length; // 리스트 전체 체크박스 수
									let checked =  $("input[name=check]:checked").length; // 체크된 체크박스 수
					
									if(total == checked){
										$("#checkAll").prop("checked", true);
									}else{
										$("#checkAll").prop("checked", false);
									}
								})
								
	                            // 체크박스 클릭 시 메일번호 담기, 모달 속성 변경
	                            let checkMailNo = "";
								$("input:checkbox").change(function(){
									
									checkMailNo = "";
									$("input:checkbox[name=check]:checked").each(function(){
										checkMailNo += ($(this).val()) + ","; // 체크된 것만 메일번호 뽑기 "2,3,4,"
		                            })
		                            checkMailNo = checkMailNo.substring(0,checkMailNo.lastIndexOf(",")); // 맨 뒤 콤마 삭제
									
		                            console.log(checkMailNo);

								})        
								
								// 메일 읽음 기능 (체크박스로 선택하여 읽음 버튼 클릭 시)
								$("#readBtn").click(function(){
									
									if(checkMailNo == ''){
										toast("선택된 메일이 없습니다.");
										return;
									}
									
									$.ajax({
										url: "updateStatus.ma",
				            			data: {checkMailNo:checkMailNo,
				            				   type:"mail_read"},
				            			success:function(result){
				            				if(result == 'success'){
					            				location.reload();
				            				}else{
				            					toast("읽음 처리 실패하였습니다.");
				            				}
				            			},
				            			error:function(){
											console.log("메일 읽음여부 변경 ajax통신 실패");
				            			}
									})
									
								})
								
				            	// 스팸 신고 버튼 클릭 시 토스트나 모달 출력
				            	$("#spamBtn").click(function(){
	
									if(checkMailNo == ''){
										toast("선택된 메일이 없습니다.");
										return;
									}
				            		
				            		 $('#jyModal_confirm').modal('show'); 
				            		 
				            	})
				            	
				            	// 스팸 신고 요청 (스팸메일함 이동, 스팸주소 등록)
				            	$("#realSpam").click(function(){
				            		
				            		$.ajax({
	                                    url:"updateStatus.ma",
	                                    data:{checkMailNo:checkMailNo,
	                                    	  type:"mail_spam"},
	                                    success:function(result){
	                        				if(result == "success"){
		                                        location.reload();
	                        				}else{
	                        					toast("스팸 신고에 실패하였습니다.");
	                        				}
	                                    },
	                                    error:function(){
	                                        console.log("스팸 신고 ajax통신 실패")
	                                    }
					            	})
				       
				            	})
								
							})
							
			            	// 메일 중요여부 변경 요청
			            	$(".important").click(function(){
			            		
			            		let type = "";
			            		if($(this).attr("name") == "bookmark"){
			            			type = "N";
			            		}else{
			            			type = "Y";
			            		}
			            		
			            		$.ajax({
			            			url: "updateImp.ma",
			            			data: {
			            				no:$(this).parent().prev().children().val(),
			            				type:type
			            			},
			            			context: this,
			            			success:function(result){

			            				if(result == "success"){
			            					if($(this).attr("name") == "bookmark"){
												$(this).attr("name", "bookmark-outline");
			            					}else{
			            						$(this).attr("name", "bookmark");
			            					}
										}
										
			            			},
			            			error:function(){
										console.log("메일 중요여부 변경 ajax통신 실패");
			            			}
			            		})
			            		
			            	})
			            	
			            	// 메일 읽음여부 변경 요청 (편지 아이콘 클릭 시)
			            	$(".read").click(function(){
			            		
			            		let type = "";
			            		if($(this).attr("name") == "mail"){
			            			type = "Y";
			            		}else{
			            			type = "N";
			            		}
			            		
			            		$.ajax({
			            			url: "updateRead.ma",
			            			data: {
			            				no:$(this).parent().prev().prev().children().val(),
			            				type:type
			            			},
			            			context: this,
			            			success:function(result){

			            				if(result == "success"){
			            					if($(this).attr("name") == "mail"){
												$(this).attr("name", "mail-open-outline");
			            					}else{
			            						$(this).attr("name", "mail");
			            					}
										}
										
			            			},
			            			error:function(){
										console.log("메일 중요여부 변경 ajax통신 실패");
			            			}
			            		})
			            		
			            	})
			            	
			            	
							// toast script
							let removeToast;
							
							function toast(string) {
							    const toast = document.getElementById("toast");
							
							    toast.classList.contains("reveal") ?
							        (clearTimeout(removeToast), removeToast = setTimeout(function () {
							            document.getElementById("toast").classList.remove("reveal")
							        }, 1000)) :
							        removeToast = setTimeout(function () {
							            document.getElementById("toast").classList.remove("reveal")
							        }, 1500)
							    toast.classList.add("reveal"),
							        toast.innerText = string
							}
							
			            </script>
					    
		                  <!-- 모달: 스팸신고 컨펌 -->
			              <div class="modal" id="jyModal_confirm">
			                <div class="modal-dialog modal-dialog-centered">
			                    <div class="modal-content">
			                        <!-- Modal Header -->
			                        <div class="modal-header">
			                          <h6 class="modal-title">스팸신고</h6>
			                          <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
			                        </div>
			                        <!-- Modal body -->
			                        <div class="modal-body" style="text-align: center;">
			                          보낸 사람을 수신거부 목록에 추가하고, <br>
			                          신고한 메일은 스팸메일함으로 이동됩니다.
			                        </div>
			                        <!-- Modal footer -->
			                        <div class="modal-footer">
			                        <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
			                        <button type="button" class="btn btn-jyok" id="realSpam" data-dismiss="modal">확인</button>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <!-- 모달 끝 -->
					    
	                  </div>
	                  <!-- 메일함 끝 -->
	                </form>
					</div>
					<!-- 제목 + 버튼 + 리스트 div 끝 -->
					
					<!-- 페이징 시작 -->
					<div class="mail-main-form-page">
		                <hr>
		                <div class=" d-flex justify-content-end" style="justify-content:center !important; ">
		                  <ul class="pagination pagination-clean pagination-sm mb-0">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
				                    <li class="page-item disabled">
				                      <a class="page-link"tabindex="-1">‹</a>
				                    </li>
			                    </c:when>
								<c:otherwise>                    
			                    	<li class="page-item">
				                      <a class="page-link" href="box.ma?cpage=${ pi.currentPage - 1 }" tabindex="-1">‹</a>
				                    </li>
                				</c:otherwise>
		                    </c:choose>
		                    
		                	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">    
		                    	<li class="page-item"><a class="page-link" href="box.ma?cpage=${ p }">${ p }</a></li>
		                	</c:forEach>
		                	
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled">
				                      <a class="page-link">›</a>
				                    </li>
			                	</c:when>
			                    <c:otherwise>
			                    	<li class="page-item">
				                      <a class="page-link" href="box.ma?cpage=${ pi.currentPage + 1 }">›</a>
				                    </li>
								</c:otherwise>
		                    </c:choose>
		                  </ul>
		                </div>
	                </div>
					<!-- 페이징 끝 -->
				
              </div>
              <!-- 메일 내용 끝 -->
            </div>
            <!-- 메일 전체 div 끝 -->
          </div>
        </div>
      </div>
		
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>