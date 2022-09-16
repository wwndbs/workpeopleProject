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
  .adminx-content{height: 100vh;}
  .div3{
    width: 50%;
    margin: 0 auto;
    border-radius: 5px;
    text-align: center;
  }
  .row{
    width:100%;
    height: 100px;
    margin: 0px 0px -5px -13px;
  }
  .color{
    background-color:rgb(118, 194, 252);
    width: 5%;
    height: 90.7%;
  }
  .font1{
    font-weight: bold;
    font-size: 100%;
  }
  .font2{font-size: 80%;} 
  .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14)}
  .div1{
    height: 750px;
    width: 101.15%
    !important
  }
  .insert-div{
    width: 50%;
    margin:0 auto; 
  }
  #exampleFormControlTextarea1{
    height: 200px
    !important
  }
  .check1{
    margin: 17px 50px 0px 0px;
  }
  .pro1{margin: 10px 0px 0px 0px;}
  .member-div{
    width: 100%;
    margin: 10px 0px 0px 0px;
  }
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
  .btn1{margin: 180px -520px -90px 520px; height: 35px !important;}
  .search1{margin: 10px 10px 10px 10px; width: 85%;}
  .h5-1{margin: 20px 690px 20px -70px;}
  .btn2{width: 100px;}
  .ssm{margin: -45px -350px 0px 325px;}
  .person1{width: 94%; margin: 15px 480px 0px -323px !important;}
  .important1{margin: 15px 748px 0px 0px;}
  .ifect1{pointer-events:none;}
  .pro-content{margin: 0px 20px 0px 20px}
  .form1{
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }
  .rep-div{
    background-color: rgb(232, 232, 232);
    width: 95.5%;
    height: 80%;
    margin: -8px 20px 20px 20px;
  }
  .reply1{
    width: 95%; 
    height: 80px; 
    margin: 18px 15px 0px 20px;
    font-size: 15px;
  }
  .reply-insert{
    width: 98%;
    height: 20%;
  }
  .btn3{width: 10%; margin: 10px 10px 0px -7px;}
  .attend1{border-radius: 5px; margin: 10px 5px 10px 5px; width: 110px; height: 80px;}
  .attend1>label{margin: 10px 0px 0px 0px;}
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
	              <h5 style="font-weight: 400"><b>마감된 설문</b></h2>
	              <hr style="margin: 15px 0px 6px 0px">
	            </div>
	            
	              <div class="card mb-grid div3" style="color:rgb(79, 79, 79);">
	                <form class="form1">
	                  <!-- 제목쪽 div -->
	                  <div>
	                    <h5 class="h5-1" style="font-weight: 400;"><b>설문 제목</b></h5>
	                    <!-- 수정|삭제|목록가기 -->
	                    <div class="ssm">
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <span style="margin: 0px 0px 0px 0px;">삭제</span>&nbsp;&nbsp;
	                      <button type="button" onclick="location.href='endList.su'" class="btn btn-sm btn-secondary btn2">목록으로</button>
	                    </div>
	                  </div>
	                  <hr width="850px">
	
	                  <!-- 진행중설문 간략정보 -->
	                  <div class="demo-icon-display" style="font-size: 15px;">
	                    <!-- 작성자 -->
	                    <div style="margin: 10px 0px 0px 0px; display: flex;">
	                      <span style="margin: 0px 0px 0px 23px;"><b>작성자 : </b></span>
	                      <span style="margin: 0px 0px 0px 24px;">강개똥 대리</span>
	                    </div>
	                    <!-- 작성일 --> 
	                    <div style="margin: 10px 0px 0px 0px; display: flex;">
	                      <span style="margin: 0px 0px 0px 23px;"><b>작성일 : </b></span>
	                      <span style="margin: 0px 0px 0px 24px;">2022-09-01</span>
	                    </div>
	                    <!-- 설문기간 --> 
	                    <div style="margin: 10px 0px 0px 0px; display: flex;">
	                      <span style="margin: 0px 0px 0px 23px;"><b>설문기간 : </b></span>
	                      <span style="margin: 0px 0px 0px 10px;">2022-09-01 ~ 2022-09-01</span>
	                    </div>
	                  </div>
	
	                  <!-- 전체참여자|참여완료|미참여 -->
	                  <div style="margin: 7px 0px 0px 14px;">
	                    <div style="display: flex;">
	                      <div class="card mb-grid attend1">
	                        <label for="">전체 참여자</label>
	                        <label for="" style="font-size: 18px;"><b>10</b></label>
	                      </div>
	                      <div class="card mb-grid attend1">
	                        <label for="">참여율</label>
	                        <label for="" style="font-size: 18px;"><b>80%</b></label>
	                      </div>
	                      <div class="card mb-grid attend1">
	                        <label for="">미참여율</label>
	                        <label for="" style="font-size: 18px;"><b>20%</b></label>
	                      </div>
	                    </div>
	                  </div>
	
	                  <!-- 설문 정보 -->
	                  <div action="" class="rep-div">
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <div style="margin: 0px 0px -0px 0px; text-align: left;">
	                        <pre style="margin: 0px 0px -8px 0px;">
사내 복지제도 관련 만족도 조사입니다.
적극적으로 의견을 반영해 개선하도록 하겠습니다.

성실한 참여 부탁드립니다.
	                        </pre>
	                      </div>
	                    </div>
	                  </div>
	
	                  <!-- 설문 선택항목 -->
	                  <div style="text-align: left;">
	                    <span style="margin: 0px 0px 0px 20px"><b>1. 사내 복지제도에 만족하십니까?</b></span><br>
	                    <div style="margin: 7px 0px 0px 40px">
	                      <input class="form-control mb-2" type="text" style="width: 99.8%; margin: 0px 0px 0px -20px; background-color: white;" placeholder="평균점수 : 80점" disabled>
	                    </div>
	                    <br>
	                  </div>
	
	                  <!-- 설문 선택항목 -->
	                  <div style="text-align: left;">
	                    <span style="margin: 0px 0px 0px 20px"><b>2. 복지담당자의 안내는 친절했습니까?</b></span><br>
	                    <div style="margin: 7px 0px 0px 40px">
	                      <input class="form-control mb-2" type="text" style="width: 99.8%; margin: 0px 0px 0px -20px; background-color: white;" placeholder="평균점수 : 65점" disabled>
	                    </div>
	                    <br>
	                  </div>
	
	                  <!-- 통계형 -->
	                  <div style="text-align: left;">
	                    <span style="margin: 0px 0px 0px 20px"><b>3. 현재 어떤 교통수단으로 출퇴근중이신가요?</b></span><br>
	                    <div style="margin: 7px 0px 0px 20px; font-size: 15px;">
	                      <div style="display: flex; margin: 0px 0px -6px 0px;">
	                        <div style="background-color: rgb(253, 200, 65); width: 20px; height: 13px; margin: 4px 0px 0px 0px;"></div>&nbsp;&nbsp;&nbsp;
	                        <label for="">버스 (1명)</label>
	                      </div>
	                      <div style="display: flex; margin: 0px 0px -6px 0px;">
	                        <div style="background-color: rgb(58, 84, 250); width: 20px; height: 13px; margin: 4px 0px 0px 0px;"></div>&nbsp;&nbsp;&nbsp;
	                        <label for="">지하철 (3명)</label>
	                      </div>
	                      <div style="display: flex; margin: 0px 0px -6px 0px;">
	                        <div style="background-color: rgb(255, 78, 78); width: 20px; height: 13px; margin: 4px 0px 0px 0px;"></div>&nbsp;&nbsp;&nbsp;
	                        <label for="">자차 (2명)</label>
	                      </div>
	                      <div style="display: flex; margin: 0px 0px -6px 0px;">
	                        <div style="background-color: rgb(67, 187, 79); width: 20px; height: 13px; margin: 4px 0px 0px 0px;"></div>&nbsp;&nbsp;&nbsp;
	                        <label for="">걷기 (1명)</label>
	                      </div>
	                      <div style="display: flex; margin: 0px 0px -6px 0px;">
	                        <div style="background-color: rgb(178, 71, 255); width: 20px; height: 13px; margin: 4px 0px 0px 0px;"></div>&nbsp;&nbsp;&nbsp;
	                        <label for="">기타 (1명)</label>
	                      </div>
	                    </div>
	                    <br>
	                  </div>   
	
	                  <!-- 버튼 -->
	                  <div>
	                    <button type="submit" class="btn btn-secondary btn4" style="width: 14%;">목록으로</button>
	                  </div>                  
	                  <br>
	
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