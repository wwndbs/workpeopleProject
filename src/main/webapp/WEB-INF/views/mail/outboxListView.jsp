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
	                <span class="mail-h">임시보관함</span>
	                <span>전체 보관 메일 <span id="allCount">${ listCount }</span></span>
	
	                <form action="">
	                  <!-- 상단 버튼 박스 시작 -->
	                  <div class="mail-btn-content" style="width: 110px;">
	                    <input type="checkbox" id="checkAll" style="margin-right: 10px;">
	
	                    <button type="button" class="mail-btn5" id="deleteBtn">
	                      <ion-icon name="trash-outline" style="margin-top:5px; font-size: 19px;"></ion-icon>
	                      <span>&nbsp;&nbsp;삭제</span>
	                    </button>    
	                  </div>
	                  <!-- 상단 버튼 박스 끝 -->
	
	                  <!-- 메일함 시작 -->
	                  <div class="mail-list-content">
	
	                   <table class="mail-table-list">
	                     <tr class="mail-list-division">
	                      <td colspan="6"><hr></td>
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
				                      		<c:when test="${ m.mailStatus.mailRead eq 'Y' }">
				                        		<ion-icon name="mail-open-outline" class="read"></ion-icon>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<ion-icon name="mail" class="read"></ion-icon>
				                        	</c:otherwise>
				                        </c:choose>
				                      </td>
				                      <td class="d4" colspan="2">
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
								
	                            // 체크박스 클릭 시 메일번호 담기
	                            let checkMailNo = "";
								
								$("input:checkbox").change(function(){
									
									checkMailNo = ""; // 초기화
									tagArr = [];
									
									$("input:checkbox[name=check]:checked").each(function(){
										checkMailNo += ($(this).val()) + ","; // 체크된 것만 메일번호 뽑기 "2,3,4,"
			                            tagArr.push($(this).next().val());
		                            })
		                            
		                            checkMailNo = checkMailNo.substring(0,checkMailNo.lastIndexOf(",")); // 맨 뒤 콤마 삭제

		                            /* 
		                            for (var i = 0; i < tagArr.length; i++) {
										console.log(i + "번째 : " + tagArr[i])
		                            }
		                             */
		                             
								})        
							
				            	// 메일 선택 삭제 요청 (휴지통 이동)
				            	$("#deleteBtn").click(function(){

									if(checkMailNo == ''){
										toast("선택된 메일이 없습니다.");
										return;
									}
				            		
				            		$.ajax({
	                                    url:"updateMailTag.ma",
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
	                                        console.log("메일 삭제 ajax통신 실패")
	                                    }
					            	})
				       
				            	})
								
							})
							
			            	// 페이지 재요청
							function reload(){
								location.reload();
							}
			            	
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
				                      <a class="page-link" href="outbox.ma?cpage=${ pi.currentPage - 1 }" tabindex="-1">‹</a>
				                    </li>
                				</c:otherwise>
		                    </c:choose>
		                    
		                	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">    
		                    	<li class="page-item"><a class="page-link" href="outbox.ma?cpage=${ p }">${ p }</a></li>
		                	</c:forEach>
		                	
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled">
				                      <a class="page-link">›</a>
				                    </li>
			                	</c:when>
			                    <c:otherwise>
			                    	<li class="page-item">
				                      <a class="page-link" href="outbox.ma?cpage=${ pi.currentPage + 1 }">›</a>
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