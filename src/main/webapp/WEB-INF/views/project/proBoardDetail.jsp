<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      .adminx-content{height: 100vh;}
      .div3{width: 50%; margin: 0 auto; border-radius: 5px; text-align: center;}
      .row{width:100%; height: 100px; margin: 0px 0px -5px -13px;}
      .color{background-color:rgb(118, 194, 252); width: 5%; height: 90.7%;}
      .font1{font-weight: bold; font-size: 100%;}
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
      .mdiv2{width: 53%; height: 10px; float: right; margin: 0px -45px -100px 30px}
      .bdiv{
        font-weight: bold;
        width: 10px;
        color:gray;
        margin: 10px 0px -186px 430px
        !important
      }
      .btn1{margin: 180px -520px -90px 520px; height: 35px !important;}
      .search1{margin: 10px 10px 10px 10px; width: 85%;}
      .h5-1{margin: 20px 690px 20px 20px; width:20%}
      .btn2{width: 100px;}
      .ssm{margin: -45px -350px 0px 325px;}
      .person1{width: 94%; margin: 15px 480px 0px -323px !important;}
      .important1{margin: 15px 748px 0px 0px;}
      .ifect1{pointer-events:none;}
      .pro-content{margin: 0px 20px 0px 20px}
      .form1{top: 0; left: 0; right: 0; bottom: 0;}
      .rep-div{background-color: rgb(232, 232, 232); width: 100%; height: 80%;}
      .reply1{
        width: 95%; 
        height: 80px; 
        margin: 18px 15px -20px 20px;
        font-size: 15px;
      }
      .reply-insert{width: 98%; height: 20%;}
      .btn3{width: 10%; margin: 10px 10px 0px -7px;}
      .delete1, .modify1{cursor: pointer;}
      /* 모달 */
      .modal{ 
        position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
      }

      .modal_content{
        width:400px; height:200px;
        background:#fff; border-radius:10px;
        position:relative; top:50%; left:50%;
        margin-top:-100px; margin-left:-200px;
        text-align:center;
        box-sizing:border-box; padding:74px 0;
        line-height:23px; cursor:pointer;
      }
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
	              <h5 style="font-weight: 400"><b>게시물 상세조회</b></h2>
	              <hr style="margin: 15px 0px 6px 0px">
	            </div>
	            
	              <div class="card mb-grid div3" style="color:rgb(79, 79, 79);">
	                <form class="form1">
	                  <!-- 제목쪽 div -->
	                  <div>
	                    <h5 class="h5-1" style="font-weight: 400;"><b>프로젝트 게시물 제목</b></h5>
	                    <!-- 수정|삭제|목록가기 -->
	                    <div class="ssm">
	                      <span onclick="modify();" style="margin: 0px 0px 0px 0px;">수정</span>&nbsp;
	                      <span class="delete1" style="margin: 0px 0px 0px 0px;">삭제</span>&nbsp;&nbsp;
	                      <button type="button" onclick="location.href='proList.pr'" class="btn btn-sm btn-secondary btn2">목록으로</button>
	                    </div>
	                  </div>
	                  <hr width="850px">
	
	                  <!-- 수정삭제 모달 -->
	                  <div class="modal">
	                    <div class="modal_content" 
	                         title="클릭하면 창이 닫힙니다."
	                         onclick="fadeout();">
	                      여기에 모달창 내용을 적어줍니다.<br>
	                      이미지여도 좋고 글이어도 좋습니다.
	                    </div>
	                  </div>
	                  
	                  <script>
	                    function modify(){
	                        $(".modal").fadeIn();
	
	                      }
	                      
	                      function fadeout(){
	                        $(".modal").fadeOut();
	                    }
	                  </script>  
	
	                  <!-- 게시글 간략정보 -->
	                  <div class="demo-icon-display">
	                    <!-- 진행|완료|보류 -->
	                    <div style="margin: 20px 480px 0px 0px;">
	                      <i data-feather="clock"></i>
	                      <span><div class="btn btn-sm btn-primary btn2 ifect1" style="margin: 0px 5px 0px 10px;">진행</div></span>
	                      <span><div class="btn btn-sm btn-secondary btn2 ifect1" style="margin: 0px 5px 0px 0px;">완료</div></span>
	                      <span><div class="btn btn-sm btn-secondary btn2 ifect1">보류</div></span>
	                    </div>
	                    <!-- 참여인원 --> 
	                    <div class="demo-icon-display person1">
	                      <i data-feather="user"></i>
	                      <span><div class="btn btn-sm btn-secondary btn2" style="margin: 0px 0px 0px 10px;"><i data-feather="user"></i>김동동</div></span>
	                    </div>
	                    <!-- 시작/마감기한 -->
	                    <div style="margin: 15px 470px 0px -217px;">
	                      <div class="demo-icon-display">
	                        <i data-feather="calendar"></i>
	                        <span style="font-size: 15px">&nbsp;&nbsp;
	                          2022-08-01 부터
	                        </span>
	                      </div>
	                      <div class="demo-icon-display" style="margin: 11px 0px 0px 0px;">
	                        <i data-feather="calendar"></i>
	                        <span style="font-size: 15px">&nbsp;&nbsp;
	                          2022-08-01 까지
	                        </span>
	                      </div>
	                    </div>
	                    <!-- 중요도 -->
	                    <div class="important1">
	                      <div class="demo-icon-display">
	                        <i data-feather="flag"></i>
	                        &nbsp;&nbsp;<i data-feather="arrow-up" style="width: 20px; color:rgb(255, 94, 94); font-size: 15px"></i>&nbsp;높음
	                      </div>
	                      <div class="demo-icon-display" hidden>
	                        <i data-feather="flag"></i>
	                        &nbsp;&nbsp;&nbsp;<span><b>-</b></span>&nbsp;&nbsp;&nbsp;보통
	                      </div>
	                      <div class="demo-icon-display" hidden>
	                        <i data-feather="flag"></i>
	                        &nbsp;&nbsp;<i data-feather="arrow-down" style="width: 20px; color:rgb(90, 90, 255); font-size: 15px"></i>&nbsp;낮음
	                      </div>
	                    </div>
	                    <br>
	                    <hr style="margin: 0 auto; width: 96.5%;">
	                  </div>
	
	                  <br>
	                  <!-- 게시물내용 시작 -->
	                  <div class="pro-content">
	                    <!-- 이미지 -->
	                    <div>
	                      <img src="https://naver-help-phinf.pstatic.net/MjAyMjA2MjJfMTM3/MDAxNjU1ODg3NjU0MzM0.4bLu5yDKhKILZlsBrkpc0vuIIqWOMKOEBzbm7mBDfN0g.MBb1uJnq_FoyHApqjLyl__F8hXJBKe4YnjobKMpwb2Ig.PNG/%EA%B7%B8%EB%A6%BC17.png?type=w1000" alt="">
	                      <br><br>
	                    </div>
	                    <textarea name="" id="" cols="100" rows="13" style="border: none; resize: none;">
	샘송에서 우리회사 시스템을 이용하기위해 방문 상담을 요청했습니다. 담당자께서는 확인하시어 방문일정 조율 부탁드립니다.                      
	
	담당자 : 샘송 김하늘 대리
	
	전화번호 : 02-2222-8888
	
	샘송에서 우리회사 시스템을 이용하기위해 방문 상담을 요청했습니다. 담당자께서는 확인하시어 방문일정 조율 부탁드립니다.                      
	
	담당자 : 샘송 김하늘 대리
	
	전화번호 : 02-2222-8888
	
	샘송에서 우리회사 시스템을 이용하기위해 방문 상담을 요청했습니다. 담당자께서는 확인하시어 방문일정 조율 부탁드립니다.                      
	
	담당자 : 샘송 김하늘 대리
	
	전화번호 : 02-2222-8888
	
	샘송에서 우리회사 시스템을 이용하기위해 방문 상담을 요청했습니다. 담당자께서는 확인하시어 방문일정 조율 부탁드립니다.                      
	
	담당자 : 샘송 김하늘 대리
	
	전화번호 : 02-2222-8888
	                    </textarea>
	                  </div>
	
	                  <!-- 조회수/댓글 -->
	                  <div style="font-size:14px; float: right; margin: 10px 15px -0px 0px;">
	                    <span>댓글 3</span>
	                    &nbsp;
	                    <span>조회수 10</span>
	                  </div>
	                  <br><br>
	
	                  <!-- 댓글창 -->
	                  <div action="" class="rep-div">
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">
	                      <div style="margin: 0px 0px 0px 50px; text-align: left;">
	                        <span style="float: left;"><b>강길똥 대리(인사팀)&nbsp;</b></span>
	                        <span style="float: left;">2022-08-01</span>
	                        <div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">
	                          <span>수정</span>
	                          <span>삭제</span>
	                        </div>
	                        <br>
	                        <span>확인했습니다. 빠른 시일 내에 처리하도록 하겠습니다. 블라블라블라블라블라블라블라블라블라블</span>
	                      </div>
	                    </div>
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">
	                      <div style="margin: 0px 0px 0px 50px; text-align: left;">
	                        <span style="float: left;"><b>강길똥 대리(인사팀)&nbsp;</b></span>
	                        <span style="float: left;">2022-08-01</span>
	                        <div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">
	                          <span>수정</span>
	                          <span>삭제</span>
	                        </div>
	                        <br>
	                        <span>확인했습니다. 빠른 시일 내에 처리하도록 하겠습니다. 블라블라블라블라블라블라블라블라블라블</span>
	                      </div>
	                    </div>
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">
	                      <div style="margin: 0px 0px 0px 50px; text-align: left;">
	                        <span style="float: left;"><b>강길똥 대리(인사팀)&nbsp;</b></span>
	                        <span style="float: left;">2022-08-01</span>
	                        <div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">
	                          <span>수정</span>
	                          <span>삭제</span>
	                        </div>
	                        <br>
	                        <span>확인했습니다. 빠른 시일 내에 처리하도록 하겠습니다. 블라블라블라블라블라블라블라블라블라블</span>
	                      </div>
	                    </div>
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">
	                      <div style="margin: 0px 0px 0px 50px; text-align: left;">
	                        <span style="float: left;"><b>강길똥 대리(인사팀)&nbsp;</b></span>
	                        <span style="float: left;">2022-08-01</span>
	                        <div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">
	                          <span>수정</span>
	                          <span>삭제</span>
	                        </div>
	                        <br>
	                        <span>확인했습니다. 빠른 시일 내에 처리하도록 하겠습니다. 블라블라블라블라블라블라블라블라블라블</span>
	                      </div>
	                    </div>
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">
	                      <div style="margin: 0px 0px 0px 50px; text-align: left;">
	                        <span style="float: left;"><b>강길똥 대리(인사팀)&nbsp;</b></span>
	                        <span style="float: left;">2022-08-01</span>
	                        <div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">
	                          <span>수정</span>
	                          <span>삭제</span>
	                        </div>
	                        <br>
	                        <span>확인했습니다. 빠른 시일 내에 처리하도록 하겠습니다. 블라블라블라블라블라블라블라블라블라블</span>
	                      </div>
	                    </div>
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">
	                      <div style="margin: 0px 0px 0px 50px; text-align: left;">
	                        <span style="float: left;"><b>강길똥 대리(인사팀)&nbsp;</b></span>
	                        <span style="float: left;">2022-08-01</span>
	                        <div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">
	                          <span>수정</span>
	                          <span>삭제</span>
	                        </div>
	                        <br>
	                        <span>확인했습니다. 빠른 시일 내에 처리하도록 하겠습니다. 블라블라블라블라블라블라블라블라블라블</span>
	                      </div>
	                    </div>
	                    <!-- 댓글하나 -->
	                    <div class="reply1" style="display: inline-block;" >
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">
	                      <div style="margin: 0px 0px 0px 50px; text-align: left;">
	                        <span style="float: left;"><b>강길똥 대리(인사팀)&nbsp;</b></span>
	                        <span style="float: left;">2022-08-01</span>
	                        <div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">
	                          <span>수정</span>
	                          <span>삭제</span>
	                        </div>
	                        <br>
	                        <span>확인했습니다. 빠른 시일 내에 처리하도록 하겠습니다. 블라블라블라블라블라블라블라블라블라블</span>
	                      </div>
	                    </div>
	                    
	
	                    <!-- 댓글 입력창 -->
	                    <div class="reply-insert" style="display: flex; margin: 0px 0px 0px 10px;">
	                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; height: 40px; float: left; margin: 8px 0px 0px 5px;">
	                      <input class="form-control mb-2 search1" type="text" placeholder="내용을 입력해주세요" style="height:40px;">
	                      <button type="submit" class="btn btn-sm btn-primary btn3" style="height:40px;">등록</button>
	                    </div>
	                    <div style="height:10px"><span hidden>bb</span></div>
	                  </div>
	                  
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
