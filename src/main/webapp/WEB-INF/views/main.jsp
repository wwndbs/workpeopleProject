<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- 
   author : 최영헌
   
   경로는 servlet-context.xml파일에 <resources mapping="/resources/**" location="/resources/" /> 로 명시되어있어
   resources로 경로를 시작하면됨
   
   header.jsp에 link 넣음 
 -->

</head>
<body>
   <div class="adminx-container">
      <!-- 상단 메뉴 바 -->
      <jsp:include page="common/header.jsp" />
      
      <!-- 좌측 슬라이드 메뉴 바 -->
      <jsp:include page="common/menubar.jsp" />
      
      <!-- 컨텐츠 부분-->
      <div class="adminx-content">
         <div class="adminx-main-content">
            <div class="container-fluid">
   
               <!--메인페이지 컨텐츠-->
               <div class="top-wrapper">
                  <!--프로필 부분-->
                  <div class="profile-alert-wrapper">
                     <div class="profile-area">
                        <img src="resources/images/defaultProfile.jpg" alt="프로필이미지"><br> <span id="profile-name">홍길동</span><br> <span id="department-name">인사부서/대리</span>
                     </div>
   
                     <!--알림 부분-->
                     <div class="alert-area">
                        <div class="alert-item">
                           <span>메일</span><br> <span><a href="">0</a></span>
                        </div>
                        <div class="alert-item">
                           <span>쪽지</span><br> <span><a href="">12</a></span>
                        </div>
                        <div class="alert-item">
                           <span>채팅</span><br> <span><a href="">23</a></span>
                        </div>
                     </div>
                  </div>
   
                  <!--게시판 부분-->
                  <div class="notice-area">
                     <div class="notice-menu">
                        <ul>
                           <li>게시판</li>
                           <li><a href="">공지사항</a></li>
                           <li><a href="">부서게시판</a></li>
                           <li><a href="">익명게시판</a></li>
                        </ul>
                        <span>
                           <a href=""><i class="fas fa-ellipsis-h"></i></a>
                        </span>
                     </div>
                     
                     <hr>
                     
                     <ul class="notice-list">
                        <li><span><a href="">2022년도 서울특별시 외국인 명예시민(Honorary Citizenship of Seoul)</a></span><span>2022-22-22</span></li>
                        <li><span><a href="">안심소득 시범사업 참여가구 모집 1차 선정결과 공고</a></span><span>2022-22-22</span></li>
                        <li><span><a href=""> 문화비축기지 장소지원 프로젝트 (아트랩-Art Lab) 모집공고</a></span><span>2022-22-22</span></li>
                        <li><span><a href=""> 서울특별시 남부여성발전센터, 북부여성발전센터 운영 수탁기관 선정 결과공고</a></span><span>2022-22-22</span></li>
                        <li><span><a href="">2022년도 서울특별시 외국인 명예시민(Honorary Citizenship of Seoul)</a></span><span>2022-22-22</span></li>
                        <li><span><a href="">안심소득 시범사업 참여가구 모집 1차 선정결과 공고</a></span><span>2022-22-22</span></li>
                        <li><span><a href=""> 문화비축기지 장소지원 프로젝트 (아트랩-Art Lab) 모집공고</a></span><span>2022-22-22</span></li>
                        <li><span><a href=""> 서울특별시 남부여성발전센터, 북부여성발전센터 운영 수탁기관 선정 결과공고</a></span><span>2022-22-22</span></li>
                     </ul>
                  </div>
   
                  <!--결재 부분-->
                  <div class="approval-area">
                     <div class="approval-menu">
                        <ul>
                           <li>결재</li>
                           <li><a href="">진행</a></li>
                           <li><a href="">완료</a></li>
                           <li><a href="">반려</a></li>
                           <li><a href="">대기</a></li>
                        </ul>
                        <span>
                           <a href="approvalList.ap"><i class="fas fa-ellipsis-h"></i></a>
                        </span>
                     </div>
                     <table class="table table-hover" style="text-align: center;">
                        <thead>
                           <tr>
                              <th style="text-align: left;">제목</th>
                              <th width="150">작성일</th>
                              <th width="70">첨부</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td style="text-align: left;">휴가신청서(휴가)</td>
                              <td>2022-22-22</td>
                              <td>
                                 <i class="fas fa-file-download"></i>
                              </td>
                           </tr>
                           <tr>
                              <td style="text-align: left;">휴가신청서(휴가)</td>
                              <td>2022-22-22</td>
                              <td>
                                 <i class="fas fa-file-download"></i>
                              </td>
                           </tr>
                           <tr>
                              <td style="text-align: left;">휴가신청서(휴가)</td>
                              <td>2022-22-22</td>
                              <td>
                                 <i class="fas fa-file-download"></i>
                              </td>
                           </tr>
                           <tr>
                              <td style="text-align: left;">휴가신청서(휴가)</td>
                              <td>2022-22-22</td>
                              <td>
                                 <i class="fas fa-file-download"></i>
                              </td>
                           </tr>
                           <tr>
                              <td style="text-align: left;">휴가신청서(휴가)</td>
                              <td>2022-22-22</td>
                              <td>
                                 <i class="fas fa-file-download"></i>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
   
               <div class="bottom-wrapper">
                  <!--근태 부분-->
                  <div class="time-area">
                     <ul>
                        <li>근태</li>
                        <li>
                           <a href="commute.at"><i class="fas fa-ellipsis-h"></i></a>
                        </li>
                     </ul>
                     <div id="time">
	                     <div id="clock-div">
	                        <div id="Clockday">00/00/00</div>
	        				<div id="Clock">00:00</div>
	                     </div>
                        <span><strong>출근시간</strong></span>
                        &nbsp;&nbsp;
                        <span><strong style="color: gray;">09:16</strong></span>
                        <br>
                        <span><strong>퇴근시간</strong></span>
                        &nbsp;&nbsp;
                        <span><strong style="color: gray;">미확인</strong></span>
                     </div>
                     <div id="btn">
                        <button class="btn btn-primary">출근</button>
                        <button class="btn btn-secondary">퇴근</button>
                     </div>
                  </div>
   
                  <!--프로젝트 부분-->
                  <div class="project-area">
                     <ul>
                        <li>프로젝트</li>
                        <li>
                           <a href=""><i class="fas fa-ellipsis-h"></i></a>
                        </li>
                     </ul>
                     <div class="project-container">
                        <div class="project">
                           <span>프로젝트명</span> <span><i class="fas fa-user-alt"></i>&nbsp;13</span>
                        </div>
                        <div class="project">
                           <span>프로젝트명</span> <span><i class="fas fa-user-alt"></i>&nbsp;13</span>
                        </div>
                        <div class="project">
                           <span>프로젝트명</span> <span><i class="fas fa-user-alt"></i>&nbsp;13</span>
                        </div>
                        <div class="project">
                           <span>프로젝트명</span> <span><i class="fas fa-user-alt"></i>&nbsp;13</span>
                        </div>
                        <div class="project">
                           <span>프로젝트명</span> <span><i class="fas fa-user-alt"></i>&nbsp;13</span>
                        </div>
                     </div>
                     <div class="slide-btn">
                        <i class="fas fa-chevron-left" id="left-btn"></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fas fa-chevron-right" id="right-btn"></i>
                     </div>
                  </div>
   
                  <!--할 일 부분-->
                  <div class="todo-area">
                     <div class="todo-menu">
                        <ul>
                           <li>To-Do</li>
                           <li><a href="">할 일</a></li>
                           <li><a href="">진행중</a></li>
                           <li><a href="">완료</a></li>
                        </ul>
                        <span>
                           <a href="todoList.td"><i class="fas fa-ellipsis-h"></i></a>
                        </span>
                     </div>
                     <ul class="todo-list">
                        <li>오늘의 할 일은 뭐지?</li>
                        <li>오늘의 할 일은 뭐지?</li>
                        <li>오늘의 할 일은 뭐지?</li>
                        <li>오늘의 할 일은 뭐지?</li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <script>
      // 프로젝트 슬라이드
      $(function() {
         let position = 0;
         $(".slide-btn>#right-btn").click(function() {
            position += 235;
            $(".project-container").css('transform', 'translateX(-' + position + 'px)');
            
            if (position > 235) {
               position = -235;
            }
         })

         $(".slide-btn>#left-btn").click(function() {
            position -= 235;
            $(".project-container").css('transform', 'translateX(-' + position + 'px)');
            
            if (position < 0) {
               position = 705;
            }
         })
      })
   </script>
   
	<script>
	// 근태 부분 시계 구현
		function Clock() {
		    var date = new Date();
		    var YYYY = String(date.getFullYear());
		    var MM = String(date.getMonth() + 1);
		    var DD = Zero(date.getDate());
		    var hh = Zero(date.getHours());
		    var mm = Zero(date.getMinutes());
		    var ss = Zero(date.getSeconds());
		    var Week = Weekday();
		
		    Write(YYYY, MM, DD, hh, mm, ss, Week);
		   //시계 1의자리수가 나올때 0을 넣어주는 함수 (ex : 1초 -> 01초)
		
		    function Zero(num) {
		        return (num < 10 ? '0' + num : '' + num);
		    }
		
		   //요일을 추가해주는 함수
		    function Weekday() {
		        var Week = ['일', '월', '화', '수', '목', '금', '토'];
		        var Weekday = date.getDay();
		        return Week[Weekday];
		    }
		
		   //시계부분을 써주는 함수
		    function Write(YYYY, MM, DD, hh, mm, ss, Week) {
		        var Clockday = document.getElementById("Clockday");
		        var Clock = document.getElementById("Clock");
		        Clockday.innerText = YYYY + '/' + MM + '/' + DD + '(' + Week + ')';
		        Clock.innerText = hh + ':' + mm + ':' + ss;
		    }
		}
		
		setInterval(Clock, 1000); //1초(1000)마다 Clock함수 재실행
		
	</script>
   
   
   <jsp:include page="common/footer.jsp"/>
</body>
</html>