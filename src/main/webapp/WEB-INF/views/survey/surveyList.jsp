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
  .div4{width: 10000px !important; height: 800px !important; margin: 0px 0px 0px 0px;}
  .bottom-wrapper{height: 1px;}
  .btn1{margin: 21px -1560px -36px 1560px; font-size: 16px; height: 38px !important;}
  .notice-list li{margin: 23px 30px 300px 25px; vertical-align: middle; height: 25px;}
  .btn2{pointer-events:none; width: 100px; color:white;}
  .page1>ul>li{margin: -7px 650px 7px -650px;}
  .pro-table{width: 100%; height:83%; text-align: center; margin: 0px 0px 0px 0px;}
  th{border-bottom: 1px solid #d9d9d9; height: 43px;}
  tbody tr{cursor: pointer;}
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
	              <h5 style="font-weight: 400"><b>진행중인 설문</b></h2>
	            </div>
	
	            <!--메인페이지 컨텐츠-->
	            <div class="top-wrapper">
	              
	              <!-- 게시글 시작 -->
	                <div class="notice-area div4">
	                  <table class="pro-table table-hover mb-0">
	                    <thead>
	                      <tr>
	                        <th width="40px"></th>
	                        <th>번호</th>
	                        <th>상태</th>
	                        <th>대상자</th>
	                        <th>제목</th>
	                        <th>작성자</th>
	                        <th>작성일</th>
	                        <th>마감기한</th>
	                      </tr>
	                    </thead>
	                    <tbody class="notice-list">
	                      <tr>
	                        <td></td>
	                        <td>10</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                        </tr>
	                      <tr>
	                        <td></td>
	                        <td>9</td>
	                        <td><div class="btn btn-sm btn-secondary btn2">미참여</div></td>
	                        <td>전사원</td>
	                        <td>송년회 장소</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>8</td>
	                        <td><div class="btn btn-sm btn-secondary btn2">미참여</div></td>
	                        <td>개발팀</td>
	                        <td>2022년 개인정보보호교육 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>7</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>6</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>5</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>4</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>3</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>2</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                      <tr>
	                        <td></td>
	                        <td>1</td>
	                        <td><div class="btn btn-sm btn-primary btn2">참여완료</div></td>
	                        <td>인사팀, 개발팀, 회계팀</td>
	                        <td>12차 의료비지원사업 만족도 조사</td>
	                        <td>김동동 대리</td>
	                        <td>2022-09-02</td>
	                        <td>2022-09-02 ~ 2022-09-02</td>
	                      </tr>
	                  </table>
	                  <br>
	
	                  <!-- 검색 -->
	                  <div style="display:flex; padding-top:10px; margin: 0px 0px 0px 660px;">
	                    <div class="form-group">
	                      <select class="form-control select1" id="demoStyle" name="demoStyle" style="height:40px;">
	                        <option value="default" class="op1">사원명</option>
	                        <option class="text-secondary" value="secondary"><label class="se-la">부서명</label></option>
	                      </select>
	                    </div>
	                    <div class="search-div" style="width:30%; display:flex; ">
	                      <input class="form-control mb-2 search1" type="text" placeholder="게시물 검색" style="height:40px;">
	                      <button type="submit" class="btn btn-sm btn-primary" style="height:40px; width:100px">검색</button>
	                    </div>
	                  </div>
	
	                  <!-- 페이징처리 -->
	                  <div class="card-footer d-flex justify-content-end page1">
	                    <ul class="pagination pagination-clean pagination-sm mb-0;">
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
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    </ul>
	                  </div>
	                </div>
	              
	
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
    
</body>
</html>