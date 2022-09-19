<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
	<title>워크피플</title>
	<!-- favicon 설정 -->
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
    <style>
      .row{
        width:100%;
        height: 320px;
        margin: 0px 0px -5px -13px;
      }
      .color{
        background-color:rgb(118, 194, 252);
        width: 5%;
        height: 90.7%;
      }
      .font1{
        font-weight: bold;
        font-size: 90%;
        width:300%
      }
      .font2{font-size: 75%;}
      .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14); width:300%}
      .approval1{width: 98.5% !important; font-weight: bold; font-size: 15px;}
      .btn1{margin: 10px -1500px 0px 1500px; width: 70%;}
      .box1{cursor : pointer; margin: 0px -5px 0px 0px;} 
	  .box1:hover{background-color : #f4f9fe;}
      .col-lg-3{max-width: 80%;}
	  .container-fluid{margin-right: 0px !important;}	
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
	
	            <!-- 관리자에게만 보여지는 승인탭(팀장/부장) -->
	            <c:if test="${ loginUser.jobName == '부장' || loginUser.jobName == '팀장' }">
		            <div class="form-group">
		              <select class="form-control approval1" id="demoStyle" name="demoStyle">
		                <option value="default" class="op1">가입요청 <label>3</label></option>
		                <option class="text-secondary" value="secondary"><label class="se-la">8월달 매출보고서</label><label for="">&nbsp; 인사팀 김동동대리</label></option>
		                <option class="text-secondary" value="secondary"><label class="se-la">8월달 매출보고서</label><label for="">&nbsp; 인사팀 김동동대리</label></option>
		                <option class="text-secondary" value="secondary"><label class="se-la">8월달 매출보고서</label><label for="">&nbsp; 인사팀 김동동대리</label></option>
		              </select>
		            </div>
	            </c:if>
	
	            <!-- 내팀 -->
	            <div class="pb-3">
	              <h5 style="font-weight: 400"><b>My Team</b>
	              <!-- 관리자에게만 보여지는 프로젝트 생성버튼-->
	              <c:if test="${ loginUser.jobName == '부장' || loginUser.jobName == '팀장' }">
	              	<button type="button" class="btn btn-primary btn1" onclick="location.href='enrollPro.pr'" style="width: 7.5%; height: 40px; font-size: 17px;">프로젝트 생성</button>
	              </c:if>
	              </h5>
	            </div>
	            
	            <input type="hidden" name="projectNo" value="${ pp.projectNo }">
                <input type="hidden" name="no" value="${ p.proBoardNo }">
                
	            <!--프로젝트 박스-->
	            <div class="row">
	              <!-- 내가 참여한 프로젝트만  -->
	              <c:choose>
	              	<c:when test="${ empty list }">
	              		<span style="margin: 0px 0px 0px 730px"><br><br><br><br><br>현재 팀에서 진행하고 있는 프로젝트가 없습니다.</span>
	              	</c:when>	
	              	<c:otherwise>
                   	<c:set var="depName" value="${ loginUser.depName }"/>	
	                  <c:forEach var="pp" items="${ list }">	              
	                  	
			              <div class="col-md-6 col-lg-3 d-flex">
			                <div class="color"></div>
			                <div class="card mb-grid project w-100 box1" onclick="location.href='proList.pr?no=${no}'"> <!-- ${projectNo} -->
			                  <div class="card-body d-flex flex-column">                                            
			                    <div class="d-flex justify-content-between mb-3">
			                      <h5 class="card-title mb-0">
			                        <div style="float:right; font-size: 80%; margin: 0px -240px 0px 0px;">	
			                          <label for="">수정</label>
			                          <label for="">삭제</label>
			                        </div>
			                        <br>
			                        <label class="font1">&nbsp;&nbsp;${ pp.projectTitle }</label><br>                    
									<label class="font2">&nbsp;&nbsp;${ pp.depName }</label><br>
			                        <label class="font3" style="vertical-align: bottom;">&nbsp;&nbsp;${ pp.category }</label>
			                      </h5>
			                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right; width:27px !important"></i>
			                      <label for="" style="margin: 230px 0px -20px 21px;">23</label>
			                    </div>
			                  </div>
			                </div>
			              </div>
			              
			              
		              </c:forEach>
		            </c:otherwise>
	              </c:choose>
	              	              
	            </div>
	
	            <hr>
	
	            <div class="pb-3" style="margin: 30px 0px 0px 0px">
	              <h5 style="font-weight: 350"><b>참여중인 프로젝트</b></h2>
	            </div>
	
	            <div class="row">
	              <div class="col-md-6 col-lg-3 d-flex">
	                <div class="color"></div>
	                <div class="card mb-grid w-100 box1">
	                  <div class="card-body d-flex flex-column">                                            
	                    <div class="d-flex justify-content-between mb-3">
	                      <h5 class="card-title mb-0">
	                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
	                          <label for="">수정</label>
	                          <label for="">삭제</label>
	                        </div>
	                        <br>
	                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
	                      </h5>
	                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
	                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-6 col-lg-3 d-flex">
	                <div class="color"></div>
	                <div class="card mb-grid w-100 box1">
	                  <div class="card-body d-flex flex-column">                                            
	                    <div class="d-flex justify-content-between mb-3">
	                      <h5 class="card-title mb-0">
	                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
	                          <label for="">수정</label>
	                          <label for="">삭제</label>
	                        </div>
	                        <br>
	                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
	                      </h5>
	                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
	                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-6 col-lg-3 d-flex">
	                <div class="color"></div>
	                <div class="card mb-grid w-100 box1">
	                  <div class="card-body d-flex flex-column">                                            
	                    <div class="d-flex justify-content-between mb-3">
	                      <h5 class="card-title mb-0">
	                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
	                          <label for="">수정</label>
	                          <label for="">삭제</label>
	                        </div>
	                        <br>
	                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
	                      </h5>
	                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
	                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-6 col-lg-3 d-flex">
	                <div class="color"></div>
	                <div class="card mb-grid w-100 box1">
	                  <div class="card-body d-flex flex-column">                                            
	                    <div class="d-flex justify-content-between mb-3">
	                      <h5 class="card-title mb-0">
	                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
	                          <label for="">수정</label>
	                          <label for="">삭제</label>
	                        </div>
	                        <br>
	                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
	                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
	                      </h5>
	                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
	                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
	                    </div>
	                  </div>
	                </div>
	              </div>          
	            </div>
	
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










