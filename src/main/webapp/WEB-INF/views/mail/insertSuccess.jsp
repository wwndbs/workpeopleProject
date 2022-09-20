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
<style>
  .mail-success{
    text-align: center;
    margin: auto;
    padding: 100px 0px 100px 0px;
  }

  .mail-success>button{
    height: 30px;
    background-color: white;
    border : 1px solid rgb(41, 128, 185);
    font-size: 15px;
    margin: 50px 5px 0px 5px;
    cursor: pointer;
  }
  
  .mail-success>button:hover{
    background-color: #9fcdff;
    color: white;
    border: none;
  }

  .mail-success>label{
    font-weight: 500;
    font-size: 17px;
  }

  .mail-success>span{
    color: gray;
    font-size: 15px;
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
		           <span class="mail-h">메일 쓰기</span>
		           <br>
		
	               <div class="mail-success">
	                 <label>메일을 성공적으로 발송하였습니다.</label><br>
	                 <span>보낸메일함에서 확인할 수 있습니다.</span>
	                 <br>
	                 <button type="button" style="width:120px;" onclick="location.href='box.ma'">받은메일함 이동</button>
	                 <button type="button" style="width:80px;" onclick="location.href='enrollForm.ma'">다시쓰기</button>
	                 <button type="button" style="width:100px;" onclick="location.href='main.wp'">홈으로 이동</button>
	               </div>
			
		        </div>
		        <!-- 메일 내용 끝 -->
		        
		      </div>
		      <!-- 메일 전체 div 끝 -->
		    </div>
		  </div>
		</div>
      
		<jsp:include page="../common/footer.jsp" />
		
	</div>
</body>
</html>