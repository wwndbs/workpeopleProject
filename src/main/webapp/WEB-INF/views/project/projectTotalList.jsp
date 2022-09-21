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
 .font2{font-size: 75%; width:200%}
 .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14); width:300%}
 .approval1{width: 98.5% !important; font-weight: bold; font-size: 15px;}
 .btn1{margin: 10px -1500px 0px 1500px; width: 70%;}
 .box1{cursor : pointer; margin: 0px -5px 0px 0px;} 
 .box1:hover{background-color : #f4f9fe;}
 .col-lg-3{max-width: 80%;}
 .container-fluid{margin-right: 0px !important;}
 .modifyPro, .deletePro{cursor : pointer}	
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
	              <h5 style="font-weight: 400"><b>전체 프로젝트 조회</b></h2>
	            </div>
	
	            <!--프로젝트 박스 시작-->
	            <div class="row">
	
	              <!-- 전체 프로젝트 -->
	              <c:choose>
	                <c:when test="${ empty list }">
	                  <span style="margin: 0px 0px 0px 730px"><br><br><br><br><br>현재 진행하고 있는 프로젝트가 없습니다.</span>
	                </c:when>
	                <c:otherwise>
	                  <c:forEach var="pp" items="${ list }">
	                  
			              <div class="col-md-6 col-lg-3 d-flex">
			                <div class="color"></div>
			                <div class="card mb-grid project w-100 box1" onclick="location.href='proList.pr?no=${pp.projectNo}'">
			                  <div class="card-body d-flex flex-column">                                            
			                    <div class="d-flex justify-content-between mb-3">
			                      <h5 class="card-title mb-0">
			                        <!-- 승인여부 -->
			                        <div style="float:right; font-size: 70%; margin: 0px -220px 0px 0px;">
			                          <div class="demo-icon-display">
			                              <i data-feather="unlock" style="width: 30px; height:30px; margin: 0px 0px 8px 13px"></i>
			                              <br>
			                              <span>승인완료</span>
			                          </div>
			                        </div>
			                        <br>
			                        <label class="font1">&nbsp;&nbsp;${ pp.projectTitle }</label><br>                        
			                        <label class="font2">&nbsp;&nbsp;${ pp.depName }</label><br>
			                        <div style="position:absolute;  bottom:30px !important">
										<c:if test="${ pp.category == '기획중' }">
					                        <label class="font3" style="">&nbsp;&nbsp;기획중</label>
				                        </c:if>
										<c:if test="${ pp.category == '기획완료' }">
					                        <label class="font3" style="color:orange;">&nbsp;&nbsp;기획완료</label>
				                        </c:if>
										<c:if test="${ pp.category == '프로젝트 진행중' }">
					                        <label class="font3" style="color:rgb(42, 187, 42)">&nbsp;&nbsp;프로젝트 진행중</label>
				                        </c:if>
										<c:if test="${ pp.category == '프로젝트 완료' }">
					                        <label class="font3" style="color:rgb(113, 113, 255)">&nbsp;&nbsp;프로젝트 완료</label>
				                        </c:if>
										<c:if test="${ pp.category == '피드백' }">
					                        <label class="font3" style="color:rgb(185, 101, 213)">&nbsp;&nbsp;피드백</label>
				                        </c:if>	
			                        </div>
			                      </h5>
			                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right; width:27px !important"></i>
			                      <span for="" style="margin: 230px 0px -20px 21px;" id="pcount">${ pp.pmMemberCount }</span]>
			                    </div>
			                  </div>
			                </div>
			              </div>
		              
		              </c:forEach>
		            </c:otherwise>  
	              </c:choose>
	
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
