<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
  .adminx-content{height: 85vh;}
  .adminx-main-content{height: 85vh;}
  .div3{width: 50%; margin: 0 auto; border-radius: 5px; text-align: center;}
  .row{width:100%; height: 100px; margin: 0px 0px -5px -13px;}
  .color{
    background-color:rgb(118, 194, 252);
    width: 5%;
    height: 90.7%;
  }
  .font1{font-weight: bold; font-size: 100%;
  }
  .font2{font-size: 80%;} 
  .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14)}
  .div1{height: 750px; width: 101.15% !important}
  .insert-div{width: 50%; margin:0 auto;}
  #exampleFormControlTextarea1{height: 200px !important}
  .check1{margin: 17px 50px 0px 0px;}
  .pro1{margin: 10px 0px 0px 0px;}
  .member-div{width: 100%; margin: 10px 0px 0px 0px;}
  .mdiv1{
    width: 53%;  
    height: 10px;
    float: left; 
    margin: 0px 0px -100px 0px;
  }
  .mdiv2{
    width: 53%;
    height: 10px;
    float: right; 
    margin: 0px -45px -100px 30px
  }
  .bdiv{
    font-weight: bold;
    width: 10px;
    color:gray;
    margin: 10px 0px -186px 430px
    !important
  }
  .btn4{margin: -20px 0px 15px 0px; height: 39px !important;}
  .search1{margin: 10px 10px 10px 10px; width: 85%;}
  .h5-1{margin: 20px 690px 20px 20px;}
  .btn2{width: 100px;}
  .ssm{margin: -45px -350px 0px 325px;}
  .person1{width: 94%; margin: 15px 480px 0px -323px !important;}
  .important1{margin: 15px 748px 0px 0px;}
  .ifect1{pointer-events:none;}
  .pro-content{margin: 0px 20px 0px 20px}
  .form1{top: 0; left: 0; right: 0; bottom: 0;}
  .rep-div{
    background-color: rgb(232, 232, 232);
    width: 100%;
    height: 80%;
  }
  .reply1{
    width: 95%; 
    height: 80px; 
    margin: 18px 15px -20px 20px;
    font-size: 15px;
  }
  .reply-insert{width: 98%; height: 20%;}
  .btn3{width: 10%; margin: 10px 10px 0px -7px;}
  .form-div{margin: 15px 15px 15px 15px;}
  .pro1{float: left;}
  #datePicker{height: 35px; width: 120px;}
  #exampleFormControlTextarea1{height: 380px !important;}
  .file1{margin: 0px 20px 0px 20px;}
  .file2{height:10px}
  .date1{width:150px !important}
  .form-control-file{width:100% !important;}
</style>
</head>
<body>
	<div class="adminx-container">
	      <!-- 상단 메뉴 바 -->
		  <jsp:include page="../common/header.jsp" />
		
		  <!-- 좌측 슬라이드 메뉴 바 -->
		  <jsp:include page="../common/menubar.jsp" />
		  
		  <!-- 컨텐츠 부분 wrapper -->
	      <div class="adminx-content">
	        <div class="adminx-main-content">
	          <div class="container-fluid">  
	
	            <div class="pb-3">
	              <h5 style="font-weight: 400"><b>프로젝트 게시물 수정</b></h5>
	              <hr style="margin: 15px 0px 6px 0px">
	            </div>	            
	            
	              <div class="card mb-grid div3" style="color:rgb(79, 79, 79);">
	                <form class="form1" id="enrollForm" method="post" action="updateBoard.pr" enctype="multipart/form-data">
               
			          <input type="hidden" name="projectNo" value="${ no }">
			          <input type="hidden" name="proBoardNo" value="${ pb.proBoardNo }">
			          <input type="hidden" name="boardWriterNo" value="${ loginUser.userNo }">
			          
	                  <!-- 제목쪽 div -->
	                  <div class="form-div">
	                    <!-- 게시물 제목 입력 -->
	                    <input class="form-control mb-2" type="text" name="proTitle" value="${ pb.proTitle }" required> <!--  placeholder="${ pb.proTitle }" -->
	                    <hr width="850px">
	                  </div>
	
	                  <!-- 게시물 진행단계 -->
	                  <div style="margin: -10px 20px 0px 20px;">
	                    <label class="form-check-label pro1">
	                      <label for="proBoardStatus"><b>진행단계</b>
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="proBoardStatus" id="proceed" value="1" required>
	                      진행
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="proBoardStatus" id="complete" value="2" required>
	                      완료
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="proBoardStatus" id="postpone" value="3" required>
	                      보류        
	                    </label>
	                  </div>
	                  <br>
	                  <c:if test="${ not empty pb.proBoardStatus }">
	                  	<script>
	                  		$(function(){
	                  			$("input[value=${pb.proBoardStatus}]").attr("checked", true);
	                  		})
	                  	</script>
	                  </c:if>
	
	                  <!-- 게시물 마감기한 -->
	                  <div style="display: flex; float: left !important; margin: 0px 10px -13px 20px;">
	                    <label for="" style="width: 110px; margin: 7px 0px 0px 0px;"><b>마감기한</b></label>
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <!-- 시작시 기본 날짜 설정은 value를 이용 -->
	                    <input type="date" name="startDate" id="datePicker" class="form-control date1" value="${ pb.startDate }" required/>
	                    &nbsp;~&nbsp;
	                    <input type="date" name="endDate" id="datePicker" class="form-control date1" value="${ pb.endDate }" required/>
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                  </div>
	
	                  <!-- 중요도 -->
	                  <div style="margin: 0px 20px 0px 20px;">
	                    <label class="form-check-label pro1">
	                      <label for=""><b>중요도</b></label>
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="proBoardLevel" id="high" value="4" required>
	                      높음
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="proBoardLevel" id="average" value="5" required>
	                      보통
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="proBoardLevel" id="low" value="6" required>
	                      낮음           
	                    </label>
	                  </div>
	                  <c:if test="${ not empty pb.proBoardLevel }">
	                  	<script>
	                  		$(function(){
	                  			$("input[value=${pb.proBoardLevel}]").attr("checked", true);
	                  		})
	                  	</script>
	                  </c:if>
	
	                  <hr style="width:855px; margin: 105px 20px 0px 20px">
	                  
	                  <!-- 게시물 내용 입력 -->
	                  <div class="form-group" style="margin: 0px 20px 0px 20px;">
	                    <br>
	                    <textarea class="form-control" id="exampleFormControlTextarea1" name="proContent" style="resize: none" required>${ pb.proContent }</textarea>
	                  </div>
	                  <br>
	
	                  <!-- 파일첨부 -->
	                  <div class="file1" style="text-align:left">
	                  	<c:if test="${ not empty pb.attachOrigin }">
		                    <label for="upfile" style="float: left"><b></b></label>	
	                        <td><input type="file" id="upfile" class="form-control-file border" name="reupfile" value="${ pb.attachOrigin }">	                        	
	                        	<label style="margin: 5px 0px 15px 83px; font-size:14px">${ pb.attachOrigin }</label>
	                        </td>
                        </c:if>
                        <c:if test="${ empty pb.attachOrigin }">
                        	<label for="upfile" style="float: left"><b></b></label>
	                        <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
                        </c:if>
	                  </div>
	                  <br>
	                  
	                  <!-- 버튼 -->
	                  <button type="button" onclick="javascript:history.go(-1);" class="btn btn-secondary btn4" style="width: 14%;">목록으로</button>
	                  <button type="submit" class="btn btn-primary btn4" style="width: 14%;">게시물 등록</button>
	                  
	                </form>
	              </div> 
	            </div>
	          </div>
	        </div>
	      </div>
	            
	    <!-- bootstrap -->
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	    <script src="resources/bootstrap/dist/js/vendor.js"></script>
	    <script src="resources/bootstrap/dist/js/adminx.js"></script>
					  
</body>
</html>














