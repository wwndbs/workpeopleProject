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
                        <img src="<c:out value='${ loginUser.profImg }' default='resources/profile_images/defaultProfile.jpg' />"><br> <span id="profile-name">${ loginUser.userName }</span><br> <span id="department-name">${ loginUser.depName } / ${ loginUser.jobName }</span>
                     </div>
   
                     <!--알림 부분-->
                     <div class="alert-area">
                        <div class="alert-item">
                           <i class="fas fa-envelope"></i>&nbsp;
                           <span>메일</span>&nbsp;&nbsp;
                           <span><a href="box.ma">0</a></span>
                        </div>
                     </div>
                  </div>
   
                  <!--게시판 부분-->
                  <div class="notice-area">
                     <div class="notice-menu">
                        <ul>
                           <li>게시판</li>
                           <li onclick="boardStatus(1);" style="cursor : pointer;"><a>공지사항</a></li>
                           <li onclick="boardStatus(2);" style="cursor : pointer;"><a>부서게시판</a></li>
                           <li onclick="boardStatus(3);" style="cursor : pointer;"><a>익명게시판</a></li>
                        </ul>
                        <span>
                           <a href="list.bo?no=1"><i class="fas fa-ellipsis-h"></i></a>
                        </span>
                     </div>
                     
                     <hr>
                     
                     <ul class="notice-list">
						<!-- ajax조회 -->
                     </ul>
                  </div>
   
                  <!--결재 부분-->
                  <div class="approval-area">
                     <div class="approval-menu">
                        <ul>
                           <li>결재</li>
                        </ul>
                        <span>
                           <a href="approvalList.ap"><i class="fas fa-ellipsis-h"></i></a>
                        </span>
                     </div>
                     <table id="main-approval" class="table table-hover" style="text-align: center;">
                        <thead>
                           <tr>
                              <th style="text-align: left;">제목</th>
                              <th width="150">작성일</th>
                              <th width="70">결재상태</th>
                           </tr>
                        </thead>
                        <tbody>
							<!-- ajax조회 -->
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
                        <button class="btn btn-primary" data-toggle="modal" data-target="#commute-start-modal" data-backdrop="static">출근</button>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#commute-end-modal" data-backdrop="static">퇴근</button>
                     </div>
                  </div>
   
                  <!--프로젝트 부분-->
                  <div class="project-area">
                     <ul>
                        <li>프로젝트</li>
                        <input type="hidden" name="userNo" value="${ loginUser.userNo }">
                        <li>
                           <a href="myProject.pr"><i class="fas fa-ellipsis-h"></i></a>
                        </li>
                     </ul>
                     <div class="project-container">		                        
                        <!-- ajax 조회부분 -->                                            
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
                           <li onclick="todoStatus(1);"><a style="cursor : pointer;">할 일</a></li>
                           <li onclick="todoStatus(2);"><a style="cursor : pointer;">진행중</a></li>
                           <li onclick="todoStatus(3);"><a style="cursor : pointer;">완료</a></li>
                        </ul>
                        <span>
                           <a href="todoList.td"><i class="fas fa-ellipsis-h"></i></a>
                        </span>
                     </div>
                     <ul class="todo-list" style="height:300px;overflow:auto;">
						<!-- ajax 조회 -->
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
	<script>
		$(function(){
   			// 할 일 조회
   			$.ajax({
   				url : "todoListView.td",
   				success : function(todolist){
					value="";
					if(todolist.length == 0){
						value += '<li style="text-align : center;">조회된 할 일이 없습니다.</li>';
					}else{
	   					for(let i = 0; i < todolist.length; i++){
		   						if(todolist[i].status == 1){
		   							value += '<li>' + todolist[i].todoContent + '</li>';		
		   						}	   							
	   					}   												
					}
					$(".todo-list").html(value);
   				},
   				error : function(){
   					console.log("메인페이지 할 일 조회 부분 ajax연결 실패");
   				}
   			})
   			
   			// 결재 조회
    		$.ajax({
   				url : "mainApprovalList.main",
   				success : function(list){
   					
   					value="";
					if(list.length == 0){
						value += '<tr><td colspan="3">조회된 결재 문서가 없습니다.</td></tr>';
					}else{
	   					for(let i = 0; i < list.length; i++){
	   						if(i < 5){
		   						value += '<tr>'
		   							  +  	'<td style="text-align : left;">' + list[i].documentTitle + '</td>'
		   						      +  	'<td>' + list[i].createDate + '</td>';
		   						      
						        if(list[i].progress == 0){
									value += '<td><div class="tag-gray" style="font-size : 14px;">대기</div></td>'
									      +  '<input type="hidden" value="' + list[i].documentNo + '">'
									      +  '<input type="hidden" value="' + list[i].documentForm + '">';
						        }else if(list[i].progress == 1){
						        	value += '<td><div class="tag-orange" style="font-size : 14px;">진행중</div></td>'
									      +  '<input type="hidden" value="' + list[i].documentNo + '">'
									      +  '<input type="hidden" value="' + list[i].documentForm + '">';
						        }else if(list[i].progress == 2){
						        	value += '<td><div class="tag-green" style="font-size : 14px;">완료</div></td>'
									      +  '<input type="hidden" value="' + list[i].documentNo + '">'
									      +  '<input type="hidden" value="' + list[i].documentForm + '">';
						        }else{
						        	value += '<td><div class="tag-red" style="font-size : 14px;">반려</div></td>'
									      +  '<input type="hidden" value="' + list[i].documentNo + '">'
									      +  '<input type="hidden" value="' + list[i].documentForm + '">';
						        }
						        value += '</tr>';
	   						}
	   					}	
					}
   					
   					$("#main-approval tbody").html(value);
   				},
   				error : function(){
   					console.log("메인페이지 결재 조회 부분 ajax연결 실패");
   				}
   			})
   			   			
   			// 결재내역 상세조회
   			$(document).on("click", "#main-approval tbody tr", function(){
   				location.href="approvalDetail.ap?no=" + $(this).children().eq(3).val() + "&form=" + $(this).children().eq(4).val();
   			})
   			
   			// 게시판 게시글 조회
    		$.ajax({
   				url : "mainBoardList.main",
   				success : function(board){
   					value="";
   					if(board.length == 0){
   						value += '<li style="cursor : pointer;">조회된 게시물이 없습니다.</li>';
   					}else{
	   					for(let i = 0; i < board.length; i++){
	   						if(i < 8){
		   						value += '<li style="cursor : pointer;">'
		   						      +  	'<span>'
		   						      +     	'<a>' + board[i].boardTitle + '</a>'
		   						      +     '</span>'
		   						      +      '<span>' + board[i].createDate + '</span>'
		   						      +  '</li>';	   							
	   						}
	   					}   						
   					}
   					$(".notice-list").html(value);
   				},
   				error : function(){
   					console.log("메인페이지 게시판 게시글 조회 부분 ajax연결 실패");
   				}
   			})
   			
   			// 게시글 상세조회
   			$(document).on("click", ".notice-list li", function(){
   				// TODO : 게시글 상세조회 기능 미구현상태임
   			})
   			
   			
   			// 읽지않은 메일 갯수 조회
    		$.ajax({
   				url : "mailCount.main",
   				success : function(mailCount){
   					$(".alert-item span a").text(mailCount);
   				},
   				error : function(){
   					console.log("메인페이지 메일 갯수 조회 부분 ajax연결 실패");
   				}
   			})
   			
   			// 프로젝트 조회
   			$.ajax({
   				url : "homeList.pr",  
   				success : function(plist){
   					
   					value="";
   					for(let i = 0; i < 3; i++){
   						if(i < 4	){
   							value += '<div class="project" style="text-align: right">'
   								   +    '<input type="hidden" value="' + plist[i].projectNo + '">'
   								   + 	'<span style="text-align:left">' + plist[i].projectTitle + '</span> <span><i class="fas fa-user-alt"></i>&nbsp;'+ plist[i].countMember +'</span>'
   								   + '</div>';
   						}
   					}
   					   										
   					$(".project-container").html(value);
   				},error : function(){
   					console.log("프로젝트 조회 ajax연결 실패");
   				}
   			})
   			
   			// 프로젝트 상세조회
   			$(document).on('click', "project-container div", function(){
   				location.href="proList.pr?no=8";
   			})
   		})
	</script>

   
   
   <script>
		function todoStatus(status){
				// 상태별 할 일 조회
				$.ajax({
					url : "todoListView.td",
					success : function(todolist){
					value="";
					if(todolist.length == 0){
						value += '<li style="text-align : center;">조회된 할 일이 없습니다.</li>';
					}else{
						for(let i = 0; i < todolist.length; i++){
		   					switch(status){
			   					case 1 :
		   	   						if(todolist[i].status == 1){
		   	   							value += '<li>' + todolist[i].todoContent + '</li>';
			   						}
			   	   					break;
			   					case 2 :
		   	   						if(todolist[i].status == 2){
		   	   							value += '<li>' + todolist[i].todoContent + '</li>';
			   						}
			   	   					break;
			   					case 3 :
		   	   						if(todolist[i].status == 3){
		   	   							value += '<li>' + todolist[i].todoContent + '</li>';
			   						}
			   	   					break;
		   					}
						}
					}
		   			$(".todo-list").html(value);
					},
					error : function(){
						console.log("메인페이지 상태별 할 일 조회 부분 ajax연결 실패");
					}
				})
			}
		
		function boardStatus(status){
   			// 게시판 게시글 조회
    		$.ajax({
   				url : "mainBoardList.main",
   				data : {
   					type : status
   				},
   				success : function(board){
   					value="";
   					if(board.length == 0){
   						value += '<li style="cursor : pointer;">조회된 게시물이 없습니다.</li>';
   					}else{
	   					for(let i = 0; i < board.length; i++){
	   						if(i < 8){
		   						value += '<li style="cursor : pointer;">'
		   						      +  	'<span>'
		   						      +     	'<a>' + board[i].boardTitle + '</a>'
		   						      +     '</span>'
		   						      +      '<span>' + board[i].createDate + '</span>'
		   						      +  '</li>';	   							
	   						}
	   					}	
   					}
   					$(".notice-list").html(value);
   				},
   				error : function(){
   					console.log("메인페이지 게시판 게시글 조회 부분 ajax연결 실패");
   				}
   			})
		}
   </script>
   
   <script>
      // 프로젝트 슬라이드
      $(function() {
         let position = 0;
         $(".slide-btn>#right-btn").click(function() {
            position += 250;
            $(".project-container").css('transform', 'translateX(-' + position + 'px)');
            
            if (position > 210) {
               position = -245;
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
	// 장서원 / 근태 부분 시계 구현
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
		        Clock.innerText = hh + ':' + mm;
		    }
		}
		
		setInterval(Clock, 1000); //1초(1000)마다 Clock함수 재실행
		
	</script>
	
	<!-- 장서원 / 출근 등록 모달 -->
	<form action="commuteIn.at" method="POST">
		<div class="modal" id="commute-start-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<button type="button" class="modal_close" data-dismiss="modal" style="margin-left: 95%;">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body" style="text-align:center;">
					    출근등록 하시겠습니까?
					</div>
					<!-- Modal footer -->
					<div class="modal-footer" style="justify-content:center;">
						<button type="submit" class="btn btn-jyok" id="commute-start-btn">등록</button>
						<button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>					
					</div>
				</div>
			</div>
		</div>
    </form>
    
    <!-- 장서원 / 퇴근 등록 모달 -->
	<form action="commuteOut.at" method="POST">
		<div class="modal" id="commute-end-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<button type="button" class="modal_close" data-dismiss="modal" style="margin-left: 95%;">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body" style="text-align:center;">
					    퇴근등록 하시겠습니까?
					</div>
					<!-- Modal footer -->
					<div class="modal-footer" style="justify-content:center;">
						<button type="submit" class="btn btn-jyok" id="commute-end-btn">등록</button>
						<button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
    </form>
   <jsp:include page="common/footer.jsp"/>
</body>
</html>