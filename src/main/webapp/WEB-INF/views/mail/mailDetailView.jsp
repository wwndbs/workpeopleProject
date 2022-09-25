<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	hr {
		margin-top: 0.5rem !important;
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
              	
              	<c:choose>
              		<c:when test="${ boxType eq 1 }">
		                <span class="mail-h">받은 메일함</span>
              		</c:when>
					<c:when test="${ boxType eq 2 }">
						<span class="mail-h">보낸 메일함</span>
					</c:when>              	
              	</c:choose>

                <form action="">
                
                 <div class="mail-btn-cntbox">
                  <!-- 상단 버튼 박스 시작 -->
                 <c:choose>
              		<c:when test="${ boxType eq 1 }">
		                <div class="mail-btn-content" style="width: 460px;">
              		</c:when>
					<c:when test="${ boxType eq 2 }">
		                <div class="mail-btn-content" style="width: 350px;">
					</c:when>              	
              	</c:choose>
                  
                  	<input type="hidden" name="no" value="${ m.mailNo }">

					<c:if test="${ boxType eq 1 }">
	                    <button type="button" class="mail-btn4" data-toggle="modal" data-target="#jyModal_confirm">
	                      <ion-icon name="ban-sharp" style="margin-top:5px; font-size: 20px;"></ion-icon>
	                      <span>&nbsp;&nbsp;스팸신고</span>
	                    </button>
					</c:if>
                    
                    <button type="button" class="mail-btn5" id="replyBtn">
                      <ion-icon name="return-down-forward-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
                      <span>&nbsp;&nbsp;답장</span>
                    </button>                    
                    
                    <button type="button" class="mail-btn5" id="deleteBtn">
                      <ion-icon name="trash-outline" style="margin-top:5px; font-size: 19px;"></ion-icon>
                      <span>&nbsp;&nbsp;삭제</span>
                    </button>    

                    <button type="button" class="mail-btn5 dropdown">
                      <i class="fas fa-tag" style="margin-top:8px; font-size: 16px;"></i>
                      <span>&nbsp;&nbsp;태그</span>
                      <!--태그 드롭다운-->
                      <div class="dropdown-tagList">
                        <table style="width: 100%;" id="tagDropArea">
                        
						<!-- 사이드바에서 조회 -->

                        </table>
                      </div>
                    </button>  
                    
                    <script>
                    	$(function(){
                    		
                     		// 메일에 따라 태그 드롭다운 내부에 적용,해제 버튼 변경
                    		$(".dropdown").on("mouseover", function () {
                    			
	                     		let tagTrSelector = "#tag" + ${ m.tag.tagNo }; // "#tag4"
	                     		let removeTd = '<td class="removeBtn">'
	                     					 + '<input type="hidden" name="tagNo" value="' + ${ m.tag.tagNo } + '">'
		   								     +		'<a class="mail-a-taglist tagBtn">해제</a>'
		   								     +	'</td>';
		   								     
	    						if($(tagTrSelector).find(".removeBtn").length == 0){
	    							$(tagTrSelector).find(".addBtn").remove();
	                               	$(tagTrSelector).append(removeTd);		                            		
	                           	}
	    						
                    		});
                    		
                    	})
                    </script>

                    <button type="button" class="mail-btn5" id="relayBtn">
                      <i class="material-icons-sharp" style="margin-top:3px; font-size: 25px;">
                        arrow_right_alt
                      </i>
                      <span>&nbsp;&nbsp;전달</span>
                    </button>

                  </div>
                  <!-- 상단 버튼 박스 끝 -->
                  <!-- 목록 버튼박스 시작-->
                  <div class="mail-btn-content2">
                  	<!-- 
                    <ion-icon name="arrow-up-outline"></ion-icon>
                    <a>위</a>
                    <ion-icon name="arrow-down-outline"></ion-icon>
                    <a>아래</a>
                     -->
                    <ion-icon name="list-outline"></ion-icon>
                    <c:choose>
                    	<c:when test="${ boxType eq 1 }">
	                    	<a href="box.ma">목록</a>
                    	</c:when>
                    	<c:when test="${ boxType eq 2 }">
	                    	<a href="box.ma?boxType=2">목록</a>
                    	</c:when>
                    </c:choose>
                  </div>
                 </div>

               <hr>

                 <!-- 상세보기 시작 -->
                 <div class="mail-detail-content">

                   <div class="header">
                     <h5>
                     	<c:choose>
                      		<c:when test="${ m.mailStatus.mailImportant eq 'Y' }">
                        		<ion-icon name="bookmark" class="important"></ion-icon>
                        	</c:when>
                        	<c:otherwise>
                        		<ion-icon name="bookmark-outline" class="important"></ion-icon>
                        	</c:otherwise>
                        </c:choose>
                       <span>${ m.mailTitle }</span>
                      	<c:choose>
                      		<c:when test="${ not empty m.tag }">
                      			<i class="fas fa-tag tagColor" style="color: ${ m.tag.tagColor };"></i>
                      		</c:when>
                      	</c:choose>
                     </h5>
                   </div>

                   <table class="mail-table-detail">
                     <tr>
                       <th>
                         보낸사람 :
                       </th>
                       <td>
                         <span class="addr-sender">${ m.senderName } ${ m.sender }</span>
                       </td>
                     </tr>
                     <tr>
                       <th>
                         받는사람 : 
                       </th>
                       <td>
                       	<c:forEach var="receiver" items="${ receiverList }">
                       		<span class="addr-receiver">${ receiver.name } ${ receiver.email }</span>
                       	</c:forEach>
                       </td>
                     </tr>
                     <tr>
                       <th>
                         참조 : 
                       </th>
                       <td>
                        <c:if test="${ not empty m.mailRef }">
	                       	<c:forEach var="ref" items="${ refList }">
	                       		<span class="addr-ref">${ ref.name } ${ ref.email }</span>
	                       	</c:forEach>
                       	</c:if>
                       </td>
                     </tr>
                     <tr>
                       <th>
                         보낸날짜 :
                       </th>
                       <td>
                         <span style="margin-left: 10px;">${ m.sendDate }</span>
                       </td>
                     </tr>
                   </table>
                   <br>

                   <div class="filelist">
                     <div class="filelist-header">
                       <span>                          
                         <i class="material-icons-sharp" style="font-size: 16px; vertical-align: -3px;">
                         attach_file
                         </i>
                        <span><b>첨부파일</b></span>
                        <span>${ atList.size() }</span>
                        개
                       </span>
                     </div>
                     <ul class="filelist-wrap" style="list-style-type: none;">
                     <c:choose>
                     	<c:when test="${ empty atList }">
	                     	<li>
	                         <a>첨부파일이 없습니다.</a>
	                       	</li>
                     	</c:when>
                     	<c:otherwise>
                     		<c:forEach var="at" items="${ atList }">
		                     	<li>
		                         <a href="${ at.changeName }" download="${ at.originName }">${ at.originName }</a>
		                        </li>
	                        </c:forEach>
                     	</c:otherwise>
                     </c:choose>
                     </ul>
                   </div>
                   <br>

                   <div class="content">
                     ${ m.mailContent }
                   </div>

                 </div>
                 <!-- 상세보기 끝 -->

                 <script>
	                let tagArr = [];
                 	$(function(){
                 		
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
		            				no:$("input[name=no]").val(),
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
		            	
		            	// 스팸 신고 요청 (스팸메일함 이동, 스팸주소 등록)
		            	$("#realSpam").click(function(){
		            		
		            		$.ajax({
                                   url:"updateStatus.ma",
                                   data:{checkMailNo:${ m.mailNo },
                                   	             type:"mail_spam"
                                   	     },
                                   success:function(result){
                       				if(result == "success"){
                                        location.href = 'box.ma';
                       				}else{
                       					toast("스팸 신고에 실패하였습니다.");
                       				}
                                   },
                                   error:function(){
                                       console.log("스팸 신고 ajax통신 실패")
                                   }
			            	})
		       				
		            	})
		            	
		            	// 답장
		            	$("#replyBtn").click(function(){

							location.href = 'reply.ma?no=' + ${ m.mailNo };
		            		 
		            	})
		            	
		            	// 메일 삭제 요청 (휴지통 이동)
		            	$("#deleteBtn").click(function(){

		            		$.ajax({
                                   url:"updateStatus.ma",
                                   data:{checkMailNo:${ m.mailNo },
                                   	     	    type:"mail_delete"
                                   	     },
                                   success:function(result){
                       				if(result == "success"){
                       					location.href = 'box.ma';
                       				}else{
                       					toast("삭제에 실패했습니다.");
                       				}
                                   },
                                   error:function(){
                                       console.log("메일 삭제 ajax통신 실패")
                                   }
			            	})
		       
		            	})
               		
            			// 태그 적용/해제 요청, 제목 태그 색상 변경
		            	$(document).on("click", ".tagBtn", function(){

							let tagNo = "";
							if($(this).text() == '적용'){
								tagNo = $(this).prev().val();
							}else{
								tagNo = $(this).prev().val();
							}
							
							let color = $(this).parent().prev().children().eq(0).css("color");
							
		            		$.ajax({
		            			url:"tagChange.ma",
		            			data:{type:$(this).text(),
		            				  checkMailNo:${ m.mailNo },
								   	  tagNo:tagNo	            				
		            			},
		            			success:function(result){
                                      $(".tagColor").css("color", color);
		            			},
		            			error:function(){
		            				
		            			}
		            		})
		            		
		            	})
		            	
		            					            	
		            	// 전달
		            	$("#relayBtn").click(function(){

							location.href = 'relay.ma?no=' + ${ m.mailNo };
		            		 
		            	})
                 		
                 	})
                 </script>

                </form>
				
              </div>
              <!-- 메일 내용 끝 -->
             
		 	   <!--toast div-->
		       <div id="toast">
			   </div>
					
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
                        <button type="button" class="btn btn-jyok" id="realSpam">확인</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 끝 -->
            
            <script>
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
            <!-- 메일 전체 div 끝 -->
          </div>
        </div>
      </div>
		
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>