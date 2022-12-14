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
  .div1{
    width: 165%;
    height: 40% !important;
    background-color: white
    !important;
  }
  .div2{width: 165%; height: 46% !important;}
  .div1 span{color:black !important; width:200% !important}
  .div3{width: 244px !important; height: 350px !important; margin: -340px 0px 340px 0px;}
  .div4{width: 365% !important; height: 780px !important; margin: 0px 200px 0px -140px;}
  .bottom-wrapper{height: 1px;}
  .btn1{margin: 21px -1560px -36px 1560px; font-size: 16px; height: 38px !important;}
  .notice-list tr{margin: 23px 30px 300px 25px; vertical-align: middle; height: 29px;}
  .btn2{pointer-events:none; width: 100px; color:white;}
  .page1>ul>li{margin: -7px 650px 7px -650px;}
  .search-div{height: 10px; margin: -63px -1560px 210px 1250px;}
  .search1{width: 250px !important; margin: 45px 165px 0px -165px}
  .form-group{height: 1px; margin: -65px -1465px 10px 1200px; width: 100px;}
  .select1{width: 100px; height: 39px !important; margin: 2px 0px 0px -216px;}
  .pro-table{width: 100%; height: 90%; text-align: center; margin: 0px 0px 0px 0px;}
  th{border-bottom: 1px solid #d9d9d9; height: 43px;}
  tbody tr{cursor: pointer;}
  .notice-area{margin-right:-10px !important}
  .pp1{margin: 0px 110px -70px -65px; font-color:black}
  .searchForm{margin: 0px -100px 0px 100px}
  .searchBtn{margin: 46px 165px 0px -165px}
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
	
	            <!-- 상단 카테고리명 -->
	            <div class="pb-3" style="margin: -11px 0px 0px 0px">
	              <h5 style="font-weight: 400">
	              	<b>프로젝트</b>
	              		<input type="hidden" name="projectNo" value="${ no }">
	              		<button type="submit" class="btn btn-primary btn1" id="insert" style="width: 7%; height: 40px;">게시물 등록</button>
	              </h5>	              	
	            </div>
	            <script>
	            	$(function(){
	            		$("#insert").click(function(){
	            			location.href = 'enrollBoard.pr?no=${no}';
	            		})
	            	})
            	</script>
	
	            <!--메인페이지 컨텐츠-->
	            <h5 style="font-weight: 400; font-size: 16px;"><b>프로젝트 관리자</b></h2>
	            <div class="top-wrapper">
	              <!--프로필 부분-->
	              <div class="profile-alert-wrapper">
	                <div class="profile-area div1">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="margin: -27px 77px 0px -10px; width:80px; height: 80px;"><br>
	                  <div style="margin: -65px -40px 0px 70px;">
	                  <c:choose>
	                  	<c:when test="${ empty pList }">
	                  	  현재 담당 관리자가 없습니다.
	                  	</c:when>
	                  	<c:otherwise>
	                  	  <c:forEach var="p" items="${ pList }">
		                    <td id="profile-name"><b>${ p.pbUserName }</b></td><br>
		                    <td id="department-name" name="pbDepName pbJobName">${ p.pbDepName }/${ p.pbJobName }</td>
		                  </c:forEach>  
	                    </c:otherwise>
	                  </c:choose>  
	                  </div>
	                </div>
	
	                <!-- 상태로 선택하는 부분 -->
	                <h5 style="font-weight: 400; font-size: 16px; margin: 10px 0px 0px 0px;"><b>상태</b></h2>
	                <div class="alert-area div2" name="bCategory">
	                  <div class="alert-item" style="margin: 10px -30px 0px 30px; font-size:16px">
	                    <input class="form-check-input" name="gridRadios" id="gridRadios1" type="radio" value="option1" checked>진행<br>
	                  </div>
	                  <div class="alert-item" style="margin: 57px 35px 0px -55px; font-size:16px">
	                    <input class="form-check-input" name="gridRadios" id="gridRadios1" type="radio" value="option1">완료<br>
	                  </div>
	                  <div class="alert-item" style="margin: 107px 130px 0px -120px; font-size:16px">
	                    <input class="form-check-input" name="gridRadios" id="gridRadios1" type="radio" value="option1">보류<br>
	                  </div>
	                </div>
	              </div>
		
	              <!-- 검색영역 -->
	              <div style="display:flex; padding-top:10px; border:none" class="searchForm">
					<form action="search.pr" method="get">
		                <div class="form-group formgroup">
		                  <input type="hidden" name="cpage" value="1">
		                  <input type="hidden" name="no" value="${ no }">
		                  <select class="form-control select1" id="demoStyle" name="condition" style="height:40px;">
		                    <option value="title" class="op1">제목</option>
		                    <option class="text-secondary" value="content"><label class="se-la">내용</label></option>
		                    <option class="text-secondary" value="writer"><label class="se-la">작성자</label></option>
		                  </select>
		                </div>
		                <div class="search-div" style="width:30%; display:flex; ">
		                  <input class="form-control mb-2 search1" type="text" name="keyword" placeholder="게시물 검색" style="height:40px;" value="${ keyword }">
		                  <button type="submit" class="btn btn-sm btn-primary searchBtn" style="height:38px;">&nbsp;&nbsp;&nbsp;검색&nbsp;&nbsp;&nbsp;&nbsp;</button>
		                </div>
					</form>
	              </div>
	              
	              <!-- 게시글 시작 -->
	              <h5 style="font-weight: 400; font-size: 16px; margin: -30px -100px 0px 100px; width: 1000px;"><b>전체 업무</b></h2>
	              <div class="notice-area div4">
	                <table class="pro-table table-hover mb-0" id="proList">
	                  <thead>
	                    <tr>
	                      <th width="20px"></th>
	                      <th>번호</th>
	                      <th>상태</th>
	                      <th>우선순위</th>
	                      <th>제목</th>
	                      <th>담당자</th>
	                      <th>작성일</th>
	                      <th>수정일</th>
	                      <th>마감기한</th>
	                    </tr>
	                  </thead>
	                  <tbody class="notice-list">	                               
	                  	<c:choose>
	                  		<c:when test="${ empty list }">
	                  			<tr>
	                  				<td colspan="9">현재 게시글이 없습니다.</td>
	                  			</tr>
	                  		</c:when>
	                  		<c:otherwise>
	                  			<c:forEach var="pb" items="${ list }">
			                    <tr>
			                      <td height="20px !important"></td>
			                      <td height="20px !important" class="no">${ pb.proBoardNo }</td>
			                      <c:if test="${ pb.proBoardStatus == 1}">
				                      <td height="20px !important"><div class="btn btn-sm btn-success btn2">진행</div></td>		                      
			                      </c:if>
			                      <c:if test="${ pb.proBoardStatus == 3}">
			                      	<td height="20px !important"><div class="btn btn-sm btn-warning btn2" style="color:white">보류</div></td>
			                      </c:if>
			                      <c:if test="${ pb.proBoardStatus == 2}">
			                      	<td height="20px !important"><div class="btn btn-sm btn-primary btn2">완료</div></td>
			                      </c:if>
			                      <c:if test="${ pb.proBoardLevel == 6}">
				                      <td height="20px !important">낮음</td>		                      
			                      </c:if>
			                      <c:if test="${ pb.proBoardLevel == 5}">
				                      <td height="20px !important">보통</td>		                      
			                      </c:if>
			                      <c:if test="${ pb.proBoardLevel == 4}">
				                      <td height="20px !important">높음</td>		                      
			                      </c:if>
			                      <td height="20px !important">${ pb.proTitle }</td>
			                      <td height="20px !important">${ pb.pbUserName }${ pb.pbJobName }</td>
			                      <td height="20px !important">${ pb.createDate }</td>
			                      <td height="20px !important">${ pb.modifyDate }</td>
			                      <td height="20px !important">${ pb.startDate } ~ ${ pb.endDate }</td>
			                    </tr>
			                    </c:forEach>
		                    </c:otherwise>
	                    </c:choose>
	                </table>
	                <script>
	                	// 게시물 상세조회
	                	$(function(){
	                		$("#proList>tbody>tr").click(function(){
	                			console.log("클릭");
	                			location.href = 'boardDetail.pr?no=' + $(this).children(".no").text();
	                		})
	                	})
	                </script>
	                <br>
	                <!-- 페이징처리 -->
	                <div class="card-footer d-flex justify-content-end page1">
	                  <ul class="pagination pagination-clean pagination-sm mb-0">		                    
                    	<c:choose>
	                    	<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link"><</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="proList.pr?no=8&cpage=${ pi.currentPage-1 }"><</a></li>
								<%-- <li class="page-item"><a class="page-link" href="proList.pr?no=8&cpage=${ pi.currentPage-1 }&status=${status}"><</a></li> --%>
							</c:otherwise>	
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="proList.pr?no=8&cpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link">></a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="proList.pr?no=8&cpage=${ pi.currentPage+1 }">></a></li>
	                    	</c:otherwise>	
	                    </c:choose>       
	                  </ul>
	                </div>
	              </div>
	
	            </div>
	
	            <!-- 프로젝트 참여자 부분 -->
	            <h5 style="font-weight: 400; font-size: 16px; margin: -380px 0px 350px 0px;"><b>프로젝트 참여자</b></h2>
	            <div class="bottom-wrapper">
	              <div class="time-area div3">
	                <!-- 스크롤박스 -->
	                <div class="scroll"style="overflow:auto; width:110%; height:320px; margin: -5px 12px 0px -10px;">
	                  <c:choose>	
	                    <c:when test="${ empty pmList }">
	                      현재 참여자가 없습니다.
	                    </c:when>
	                    <c:otherwise>
	                      <c:forEach var="pm" items="${ pmList }">
			                <!-- 한명에 대한 정보 -->
			                <div class="profile-area pp1">
			                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; margin: 0px -30px 0px 0px">
			                  <div style="margin: -40px 0px 0px 120px; float: left; width:80px">
			                    <span id="profile-name" style="float: left"><b>&nbsp;&nbsp;${ pm.pbUserName }</b></span><br>
			                    <span id="department-name" style="font-size: 14px;">${ pm.pbDepName }/${ pm.pbJobName }</span>
			                  </div>
			                </div>
			                <br><br><br><br>
			              </c:forEach>  
			           </c:otherwise>    
		             </c:choose>      
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
	
	</div>
			  
</body>
</html>