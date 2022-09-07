<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .div1{
    width: 98%;
    height: 40% !important;
    background-color: white 
    !important
  }
  .div2{width: 98%; height: 46% !important;}
  .div1 span{color:black !important}
  .div3{width: 248px !important; height: 350px !important; margin: -340px 0px 340px 0px;}
  .div4{width: 11000px !important; height: 780px !important; margin: 0px 200px 0px -140px;}
  .bottom-wrapper{height: 1px;}
  .btn1{margin: 21px -1560px -36px 1560px; font-size: 16px; height: 38px !important;}
  .notice-list tr{margin: 23px 30px 300px 25px; vertical-align: middle; height: 29px;}
  .btn2{pointer-events:none; width: 100px; color:white;}
  .page1>ul>li{margin: -7px 650px 7px -650px;}
  .search-div{height: 10px; margin: -63px -1450px 210px 1250px;}
  .search1{width: 250px !important;}
  .form-group{height: 1px; margin: -65px -1465px 10px 1200px; width: 100px;}
  .select1{width: 100px; height: 39px !important; margin: 2px 0px 0px -216px;}
  .pro-table{width: 100%; height: 90%; text-align: center; margin: 0px 0px 0px 0px;}
  th{border-bottom: 1px solid #d9d9d9; height: 43px;}
  tbody tr{cursor: pointer;}
  .notice-area{margin-right:-10px !important}
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
	            <div class="pb-3">
	              <h5 style="font-weight: 400">
	              	<b>프로젝트명</b>
	              		<button type="submit" onclick="location.href='enrollBoard.pr'" class="btn btn-primary btn1" style="width: 7%; height: 40px;">게시물 등록</button>
	              </h5>	              	
	            </div>
	
	            <!--메인페이지 컨텐츠-->
	            <h5 style="font-weight: 400; font-size: 16px;"><b>프로젝트 관리자</b></h2>
	            <div class="top-wrapper">
	              <!--프로필 부분-->
	              <div class="profile-alert-wrapper">
	                <div class="profile-area div1">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="margin: -23px 150px 0px 30px; width:70px; height: 70px;"><br>
	                  <div style="margin: -65px -80px 0px 0px;">
	                    <span id="profile-name" style="">홍길동</span><br>
	                    <span id="department-name">인사부서/대리</span>
	                  </div>
	                </div>
	
	                <!-- 상태로 선택하는 부분 -->
	                <h5 style="font-weight: 400; font-size: 16px; margin: 10px 0px 0px 0px;"><b>상태</b></h2>
	                <div class="alert-area div2">
	                  <div class="alert-item" style="margin: 10px -30px 0px 30px;">
	                    <input class="form-check-input" name="gridRadios" id="gridRadios1" type="radio" value="option1" checked>진행<br>
	                  </div>
	                  <div class="alert-item" style="margin: 57px 35px 0px -55px;">
	                    <input class="form-check-input" name="gridRadios" id="gridRadios1" type="radio" value="option1" checked>완료<br>
	                  </div>
	                  <div class="alert-item" style="margin: 107px 130px 0px -120px;">
	                    <input class="form-check-input" name="gridRadios" id="gridRadios1" type="radio" value="option1" checked>보류<br>
	                  </div>
	                </div>
	              </div>
	
	              <!-- 검색 -->
	              <div style="display:flex; padding-top:10px;">
	
	                <div class="form-group formgroup">
	                  <select class="form-control select1" id="demoStyle" name="demoStyle" style="height:40px;">
	                    <option value="default" class="op1">제목</option>
	                    <option class="text-secondary" value="secondary"><label class="se-la">내용</label></option>
	                    <option class="text-secondary" value="secondary"><label class="se-la">작성자</label></option>
	                  </select>
	                </div>
	                <div class="search-div" style="width:30%; display:flex; ">
	                  <input class="form-control mb-2 search1" type="text" placeholder="게시물 검색" style="height:40px;">
	                  <button type="submit" class="btn btn-sm btn-primary" style="height:38px;">&nbsp;&nbsp;&nbsp;검색&nbsp;&nbsp;&nbsp;&nbsp;</button>
	                </div>
	
	              </div>
	              
	              <!-- 게시글 시작 -->
	              <h5 style="font-weight: 400; font-size: 16px; margin: -30px 0px 0px 0px; width: 1000px;"><b>전체 업무</b>&nbsp;<b>(20)</b></h2>
	              <div class="notice-area div4">
	                <table class="pro-table table-hover mb-0">
	                  <thead>
	                    <tr>
	                      <th width="40px"></th>
	                      <th>번호</th>
	                      <th>상태</th>
	                      <th>우선순위</th>
	                      <th>제목</th>
	                      <th>담당자</th>
	                      <th>수정일</th>
	                      <th>마감기한</th>
	                    </tr>
	                  </thead>
	                  <tbody class="notice-list">
	                    <tr onclick="location.href='boardDetail.pr'">
	                      <td></td>
	                      <td>12</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>11</td>
	                      <td><div class="btn btn-sm btn-warning btn2">보류</div></td>
	                      <td>높음</span>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</span>
	                      <td>2022-09-02 ~ 2022-09-02</span>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>10</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                    <tr>
	                      <td></td>
	                      <td>9</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>8</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>7</td>
	                      <td><div class="btn btn-sm btn-success btn2">진행</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>6</td>
	                      <td><div class="btn btn-sm btn-success btn2">진행</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>5</td>
	                      <td><div class="btn btn-sm btn-success btn2">진행</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>4</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>3</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>2</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                    <tr>
	                      <td></td>
	                      <td>1</td>
	                      <td><div class="btn btn-sm btn-primary btn2">완료</div></td>
	                      <td>높음</td>
	                      <td>업무게시글 제목</td>
	                      <td>김동동 대리</td>
	                      <td>2022-09-02</td>
	                      <td>2022-09-02 ~ 2022-09-02</td>
	                    </tr>
	                </table>
	                <br>
	                <!-- 페이징처리 -->
	                <div class="card-footer d-flex justify-content-end page1">
	                  <ul class="pagination pagination-clean pagination-sm mb-0">
	                    <li class="page-item disabled">
	                      <a class="page-link" href="#" tabindex="-1">‹</a>
	                    </li>
	                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                    <li class="page-item"><a class="page-link" href="#">2</a></li>
	                    <li class="page-item"><a class="page-link" href="#">3</a></li>
	                    <li class="page-item"><a class="page-link" href="#">4</a></li>
	                    <li class="page-item"><a class="page-link" href="#">5</a></li>
	                    <li class="page-item">
	                      <a class="page-link" href="#">›</a>
	                    </li>
	                  </ul>
	                </div>
	              </div>
	
	            </div>
	
	            <!-- 프로젝트 참여자 부분 -->
	            <h5 style="font-weight: 400; font-size: 16px; margin: -380px 0px 350px 0px;"><b>프로젝트 참여자</b></h2>
	            <div class="bottom-wrapper">
	              <div class="time-area div3">
	                <!-- 스크롤박스 -->
	                <div class="scroll"style="overflow:auto; width:100%; height:320px; margin: 0px 10px 0px 8px;">
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>
	                <!-- 한명에 대한 정보 -->
	                <div class="profile-area" style="margin: 0px 150px 0px 0px;">
	                  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                  <div style="margin: -42px -100px 0px 50px; float: left; width:80px">
	                    <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                    <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                  </div>
	                </div>
	                <br>   
	
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