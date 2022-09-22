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
              
                <span class="mail-h">보낸 메일함</span>

                <form action="">
                
                 <div class="mail-btn-cntbox">
                  <!-- 상단 버튼 박스 시작 -->
                  <div class="mail-btn-content" style="width: 570px;">
                  	<input type="hidden" name="no" value="${ m.mailNo }">

                    <button type="button" class="mail-btn4">
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
                    
                    <button type="button" class="mail-btn5">
                      <ion-icon name="mail-open-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
                      <span style="margin-top: 0px;">&nbsp;&nbsp;읽음</span>
                    </button>
                  </div>
                  <!-- 상단 버튼 박스 끝 -->
                  <!--위아래목록 버튼박스 시작-->
                  <div class="mail-btn-content2" style="width: 200px;">
                    <ion-icon name="arrow-up-outline"></ion-icon>
                    <span>위</span>
                    <ion-icon name="arrow-down-outline"></ion-icon>
                    <span>아래</span>
                    <ion-icon name="list-outline"></ion-icon>
                    <span>목록</span>
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
                      			<i class="fas fa-tag" style="color: ${ m.tag.tagColor };"></i>
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
		            	
                 		
                 		
                 		
                 	})
                 	
                 
                 </script>

                </form>
				
              </div>
              <!-- 메일 내용 끝 -->
             

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
              
            </div>
            <!-- 메일 전체 div 끝 -->
          </div>
        </div>
      </div>
		
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>