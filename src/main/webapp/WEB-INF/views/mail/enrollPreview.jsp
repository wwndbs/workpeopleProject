<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
미리보기
</title>
<!-- bootstrap template -->
<link rel="stylesheet" type="text/css" href="resources/bootstrap/dist/css/adminx.css" media="screen" />

<!--bootstrap, jQuery-->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!--pretendard font-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="resources/bootstrap/dist/css/font-pretendard.css">

<!--fontawesome kit-->
<script src="https://kit.fontawesome.com/ea8287c514.js" crossorigin="anonymous"></script>

<!-- google icon -->
<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    
<!-- css -->
<link rel="stylesheet" href="resources/css/juyun.css">
<style>
	hr {
		margin-top: 0.5rem !important;
	}
</style>
</head>
<body>

	<div class="adminx-container" style="padding-top:0px">
		
      <!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content" style="padding-left:65px;">
        <div class="adminx-main-content" style="padding: 0; height: 100%;">
          <div class="container-fluid" style="padding: 0; height: 100%;">
            <!-- 메일 전체 div 시작 -->
            <div class="container-mail">
	
              <!-- 메일 내용 시작 -->
              <div class="mail-main-form">
              
                <span class="mail-h">미리보기</span>

               <hr>

                 <!-- 상세보기 시작 -->
                 <div class="mail-detail-content">

                   <div class="header">
                     <h5>
                       <span>${ m.mailTitle }</span>
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
                     	<c:when test="${ empty atOriginNameList }">
	                     	<li>
	                         <a>첨부파일이 없습니다.</a>
	                       	</li>
                     	</c:when>
                     	<c:otherwise>
                     		<c:forEach var="originName" items="${ atOriginNameList }">
		                     	<li>
		                         <a>${ originName }</a>
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

              </div>
              <!-- 메일 내용 끝 -->
             
            </div>
            <!-- 메일 전체 div 끝 -->
          </div>
        </div>
      </div>
      
      <script>
      
      $(function(){

    	  var parent = window.opener;
	      window.opener.document.getElementById("mailForm").value = resultInput;
    	  
      })

      
      </script>
		
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>