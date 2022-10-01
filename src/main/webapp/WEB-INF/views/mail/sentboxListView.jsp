<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
.mail-table-list .d4 span{
    margin-left: 10px !important;
}

</style>
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
	                <span class="mail-h">보낸 메일함</span>
	                <span>전체 메일 <span id="allCount">${ listCount }</span> / 안 읽은 메일 <span id="notReadCount">${ notReadCount }</span> </span>
	
	                <form action="">
	                  <!-- 상단 버튼 박스 시작 -->
	                  <div class="mail-btn-content" style="width: 480px;">
	                    <input type="checkbox" id="checkAll" style="margin-right: 10px;">
	                    
	                    <button type="button" class="mail-btn5" id="replyBtn">
	                      <ion-icon name="return-down-forward-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;답장</span>
	                    </button>                    
	                    
	                    <button type="button" class="mail-btn5" id="deleteBtn">
	                      <ion-icon name="trash-outline" style="margin-top:5px; font-size: 19px;"></ion-icon>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;삭제</span>
	                    </button>    
	
	                    <button type="button" class="mail-btn5 dropdown">
	                      <i class="fas fa-tag" style="margin-top:8px; font-size: 16px;"></i>
	                      <span style="margin-top: 0px;">&nbsp;&nbsp;태그</span>
	                      <!--태그 드롭다운-->
	                      <div class="dropdown-tagList">
	                        <table style="width: 100%;" id="tagDropArea">

	                        </table>
	                      </div>
	                    </button>  
	
	                    <button type="button" class="mail-btn5" id="relayBtn">
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
	                      <!-- <td colspan="3">최근 메일</td> -->
	                      <td colspan="6"><hr></td>
	                     </tr>
	                    
	                    <c:choose>
	                		<c:when test="${ empty list }">
	                			<tr>
	                				<td colspan="5" class="noList">현재 보낸 메일이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
	                			<c:forEach var="m" items="${ list }">
									<tr>
				                      <td class="d1">
				                      	  <input type="checkbox" name="check" value="${ m.mailNo }">
					                      <input type="hidden" name="tag" value="${ m.tag.tagNo }">
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
				                      			<c:when test="${ fn:length(fn:split(m.receiver, ',')) eq 1 }">
				                      				<span>${ m.receiver }</span>
				                      			</c:when>
				                      			<c:otherwise>
				                      				<span>${ fn:split(m.receiver, ',')[0] } 외 ${ fn:length(fn:split(m.receiver, ',')) -1 }명</span>
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
							let tagArr = [];
							$(function(){
								
								// 메일 상세조회 페이지 요청
			            		$(".d5>span").click(function(){
			            			location.href = 'detail.ma?no=' + $(this).parent().siblings().eq(0).children().val() + '&boxType=2';
								})
			            	
								
								// 메일 미리보기 팝업 요청
								$(document).on("click", "ion-icon[name=copy-outline]", function(){
									
									let url = 'detail.ma?no=' + $(this).parent().siblings().eq(0).children().val() + '&boxType=2&preview=2'; 
			               			window.open(url, "popupOpener", "width=900, height=800, top=80, left=400");
									
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
								
								let map = {};
								let checkMailNo = "";								
								$("input:checkbox").change(function(){
									
									// 체크박스 클릭 시마다 메일번호 담기
									checkMailNo = ""; // 초기화
									$("input:checkbox[name=check]:checked").each(function(){
										checkMailNo += ($(this).val()) + ","; // 체크된 것만 메일번호 뽑기 "2,3,4,"
		                            })
		                            checkMailNo = checkMailNo.substring(0,checkMailNo.lastIndexOf(",")); // 맨 뒤 콤마 삭제

									
		                            // 체크박스 클릭 시마다 태그 드롭다운 내부에 적용,해제 버튼 변경
									let mailNo = $(this).val();
									let tagNo = $(this).next().val();
									
									if($(this).prop("checked")){ // 체크됨
										map[mailNo] = tagNo;
									}else{
										delete(map[mailNo]);
									}
									
									$("#tagDropArea").find(".removeBtn").remove();
									
									let removeTd = '<td class="removeBtn">'
			   								   +		'<a class="mail-a-taglist tagBtn">해제</a>'
			   								   +	'</td>';
									
									for(let key in map){
										
										let tagTrSelector = "#tag" + map[key];
										if($(tagTrSelector).find(".removeBtn").length == 0){
			                            	$(tagTrSelector).append(removeTd);		                            		
		                            	}
									}
									
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
					            				toast("읽음 처리 성공하였습니다.");
					            				setTimeout(reload, 1000);
				            				}else{
				            					toast("읽음 처리 실패하였습니다.");
				            				}
				            			},
				            			error:function(){
											console.log("메일 읽음여부 변경 ajax통신 실패");
				            			}
									})
									
								})
				            	
				            	// 답장
				            	$("#replyBtn").click(function(){
	
									if(checkMailNo == ''){
										toast("선택된 메일이 없습니다.");
										return;
									}
									
									if($("input[name=check]:checked").length != 1){
										toast("하나의 메일만 답장 가능합니다.");
										return;
									}
										
									location.href = 'reply.ma?no=' + checkMailNo;
				            		 
				            	})
								
				            	// 메일 선택 삭제 요청 (휴지통 이동)
				            	$("#deleteBtn").click(function(){
				            		
				            		$.ajax({
	                                    url:"updateStatus.ma",
	                                    data:{checkMailNo:checkMailNo,
	                                    	  type:"mail_delete"},
	                                    success:function(result){
	                        				if(result == "success"){
		                                        toast("휴지통으로 이동했습니다.");
		                                        setTimeout(reload, 1000);
	                        				}else{
	                        					toast("삭제에 실패했습니다.");
	                        				}
	                                    },
	                                    error:function(){
	                                        console.log("스팸 신고 ajax통신 실패")
	                                    }
					            	})
				       
				            	})
								
				            	// 태그 적용/해제 요청
				            	$(document).on("click", ".tagBtn", function(){

									if(checkMailNo == ''){
										toast("선택된 메일이 없습니다.");
										return;
									}
									
									let tagNo = "";
									if($(this).text() == '적용'){
										tagNo = $(this).prev().val();
									}else{
										tagNo = $(this).parent().prev().children().eq(0).val();
									}
									
				            		$.ajax({
				            			url:"tagChange.ma",
				            			data:{type:$(this).text(),
				            				  checkMailNo:checkMailNo,
										   	  tagNo:tagNo,
										   	  mailType:2
				            			},
				            			success:function(result){
		                                      reload();
				            			},
				            			error:function(){
				            				
				            			}
				            		})
				            	
				            	})
				            	
				            	// 전달
				            	$("#relayBtn").click(function(){
	
									if(checkMailNo == ''){
										toast("선택된 메일이 없습니다.");
										return;
									}
									
									if($("input[name=check]:checked").length != 1){
										toast("하나의 메일만 전달 가능합니다.");
										return;
									}
										
									location.href = 'relay.ma?no=' + checkMailNo + '&type=relay';
				            		 
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
		            					// 아이콘 변경, 안 읽은 메일 수 변경
		            					if($(this).attr("name") == "mail"){
		            						$("#notReadCount").text( parseInt($("#notReadCount").text()) - 1 );
											$(this).attr("name", "mail-open-outline");
		            					}else{
		            						$("#notReadCount").text( parseInt($("#notReadCount").text()) + 1 );
		            						$(this).attr("name", "mail");
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
				                      <a class="page-link" href="box.ma?cpage=${ pi.currentPage - 1 }&boxType=2" tabindex="-1">‹</a>
				                    </li>
                				</c:otherwise>
		                    </c:choose>
		                    
		                	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">    
		                    	<li class="page-item"><a class="page-link" href="box.ma?cpage=${ p }&boxType=2">${ p }</a></li>
		                	</c:forEach>
		                	
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled">
				                      <a class="page-link">›</a>
				                    </li>
			                	</c:when>
			                    <c:otherwise>
			                    	<li class="page-item">
				                      <a class="page-link" href="box.ma?cpage=${ pi.currentPage + 1 }&boxType=2">›</a>
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