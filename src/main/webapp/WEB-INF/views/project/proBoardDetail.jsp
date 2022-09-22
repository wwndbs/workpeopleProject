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
      .h5-1{margin: 20px 690px 20px 20px; width:80%; text-align:left}
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
      .reply-insert{width: 98%; height: 35%;}
      .btn3{width: 10%; margin: 10px 10px 0px -7px;}
      .delete1, .modify1, .rModify, .rDelete{cursor: pointer;}
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
	                  <div class="h5div">
				        <input type="hidden" name="no" value="${ pb.proBoardNo }">
				        <input type="hidden" name="boardWriterNo" value="${ pb.boardWriterNo }">
	                    <h5 class="h5-1" style="font-weight: 400;"><b>${ pb.proTitle }</b></h5>
	                    
	                    <!-- 수정|삭제|목록가기 -->
	                    <div class="ssm">
	                    
	                      <c:if test="${ loginUser.userNo eq pb.boardWriterNo }">                   	                    
		                    <span type="button" data-toggle="modal" data-target="#modify" data-backdrop="static" class="modify1" style="margin: 0px 0px 0px 0px;">수정</span>&nbsp;
		                    <span type="button" data-toggle="modal" data-target="#delete" data-backdrop="static" class="delete1" style="margin: 0px 0px 0px 0px;">삭제</span>&nbsp;&nbsp;
	                      </c:if>
	                                     
	                      <button type="button" onclick="location.href='proList.pr?no=8'" class="btn btn-sm btn-secondary btn2">목록으로</button>
	                    </div>
	                  </div>
	                  <hr width="850px" style="margin: 13px 10px 0px 10px">
	                  
			        <!-- 게시물 수정 모달 -->
			        <form action="" method="post">
				       <div class="modal" id="modify">
				           <div class="modal-dialog modal-dialog-centered">
				               <div class="modal-content">
				                  <!-- Modal Header -->
				                  <div class="modal-header">
				                     <h6 class="modal-title">게시물 수정</h6>
				                     <button hidden type="button" class="modal_close" data-dismiss="modal">&times;</button>
				                  </div>
				                  <!-- Modal body -->
				                  <div class="modal-body" style="text-align:center;">
				                  	게시물을 수정하시겠습니까?
				                  </div>
				                  <!-- Modal footer -->
				                  <div class="modal-footer" style="justify-content:center;">
					                <button class="btn btn-jyok" id="holiday-give-btn" onclick="location.href='modifyBoard.pr?no=${no}'">수정</button>	                
					                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
				                  </div>
				              </div>
				           </div>
				        </div>
				        <form id="postForm" action="" method="post">
				        	<input type="hidden" name="attachModify" value="${ pb.attachModify }">
				        </form>
			        </form>	   

			        <!-- 게시물 삭제 모달 -->
			        <form action="" method="POST">
				       <div class="modal" id="delete">
				           <div class="modal-dialog modal-dialog-centered">
				               <div class="modal-content">
				                  <!-- Modal Header -->
				                  <div class="modal-header">
				                     <h6 class="modal-title">게시물 삭제</h6>
				                     <button hidden type="button" class="modal_close" data-dismiss="modal">&times;</button>
				                  </div>
				                  <!-- Modal body -->
				                  <div class="modal-body" style="text-align:center;">
				                      게시물을 삭제하시겠습니까?
				                  </div>
				                  <!-- Modal footer -->
				                  <div class="modal-footer" style="justify-content:center;">
					                <button type="button" class="btn btn-jyok" id="holiday-give-btn" onclick="location.href='deleteBoard.pr?no=${no}'">삭제</button>	                
					                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
				                  </div>
				              </div>
				           </div>
				        </div>
			        </form>	   		        			        
			        <script>
			        	function postFormSubmit(url){
			        		$("#postForm").attr("action", url).submit();
			        	}
			        	
			        	// toast 스크립트
			        	let removeToast;
						
						function toast(string) {
						    const toast = document.getElementById("toast");
						
						    toast.classList.contains("reveal") ?
						        (clearTimeout(removeToast), removeToast = setTimeout(function () {
						            document.getElementById("toast").classList.remove("reveal")
						        }, 1000)) :
						        removeToast = setTimeout(function () {
						            document.getElementById("toast").classList.remove("reveal")
						        }, 1500)
						    toast.classList.add("reveal"),
						        toast.innerText = string
						}   
			        </script> 
			        <!--toast div-->
					<div id="toast">
					</div>
	                  	                  	
	                  <!-- 게시글 간략정보 -->
	                  <div class="demo-icon-display">
	                    <!-- 진행|완료|보류 -->
	                    <div style="margin: 20px 480px 0px 0px;">
	                      <i data-feather="clock"></i>
	                      <c:if test="${ pb.proBoardStatus == 1}">
		                      <span><div class="btn btn-sm btn-primary btn2 ifect1" style="margin: 0px 5px 0px 10px;">진행</div></span>
		                      <span><div class="btn btn-sm btn-secondary btn2 ifect1" style="margin: 0px 5px 0px 0px;">완료</div></span>
		                      <span><div class="btn btn-sm btn-secondary btn2 ifect1">보류</div></span>                      
	                      </c:if>
	                      <c:if test="${ pb.proBoardStatus == 2}">
		                      <span><div class="btn btn-sm btn-secondary btn2 ifect1" style="margin: 0px 5px 0px 10px;">진행</div></span>
		                      <span><div class="btn btn-sm btn-primary btn2 ifect1" style="margin: 0px 5px 0px 0px;">완료</div></span>
		                      <span><div class="btn btn-sm btn-secondary btn2 ifect1">보류</div></span>                      
	                      </c:if>	  
	                      <c:if test="${ pb.proBoardStatus == 3}">
		                      <span><div class="btn btn-sm btn-secondary btn2 ifect1" style="margin: 0px 5px 0px 10px;">진행</div></span>
		                      <span><div class="btn btn-sm btn-secondary btn2 ifect1" style="margin: 0px 5px 0px 0px;">완료</div></span>
		                      <span><div class="btn btn-sm btn-primary btn2 ifect1">보류</div></span>                      
	                      </c:if>	  	                      	                      	                      
	                    </div>
	                    <!-- 게시글 작성자 --> 
	                    <div class="demo-icon-display person1">
	                      <i data-feather="user"></i>
	                      <span><div class="btn btn-sm btn-secondary btn2" style="margin: 0px 0px 0px 10px;"><i data-feather="user"></i>${ pb.pbUserName }</div></span>
	                    </div>
	                    <!-- 시작/마감기한 -->
	                    <div style="margin: 15px 470px 0px -217px;">
	                      <div class="demo-icon-display">
	                        <i data-feather="calendar"></i>
	                        <span style="font-size: 15px">&nbsp;&nbsp;
	                          ${ pb.startDate } 부터
	                        </span>
	                      </div>
	                      <div class="demo-icon-display" style="margin: 11px 0px 0px 3px;">
	                        <i data-feather="calendar"></i>
	                        <span style="font-size: 15px">&nbsp;&nbsp;
	                          ${ pb.endDate } 까지
	                        </span>
	                      </div>
	                    </div>
	                    <!-- 중요도 -->
	                    <div class="important1">
	                      <c:if test="${ pb.proBoardLevel == 6}">
		                    <div class="demo-icon-display">
		                        <i data-feather="flag"></i>
		                        &nbsp;&nbsp;<i data-feather="arrow-down" style="width: 20px; color:rgb(90, 90, 255); font-size: 15px"></i>&nbsp;낮음
	                      	</div>
	                      </c:if>
	                      <c:if test="${ pb.proBoardLevel == 5}">
		                      <div class="demo-icon-display">
		                        <i data-feather="flag"></i>
		                        &nbsp;&nbsp;&nbsp;<span><b>-</b></span>&nbsp;&nbsp;&nbsp;보통
		                      </div>
	                      </c:if>
	                      <c:if test="${ pb.proBoardLevel == 4}">
		                      <div class="demo-icon-display">
		                        <i data-feather="flag"></i>
		                        &nbsp;&nbsp;<i data-feather="arrow-up" style="width: 20px; color:rgb(255, 94, 94); font-size: 15px"></i>&nbsp;높음
		                      </div>
	                      </c:if>
	                    </div>
	                    <br>
	                    <hr style="margin: 0 auto; width: 96.5%;">
	                  </div>
	
	                  <br>
	                  <!-- 게시물내용 시작 -->
	                  <div class="pro-content">
	                    <!-- 이미지 -->
	                    <c:if test="${ not empty pb.attachModify }">	                    
		                    <div>
		                      <img src="${ pb.attachModify }" alt="" width="70%">
		                      <br><br>
		                    </div>
		                </c:if>    
	                    <textarea name="" id="" cols="99" rows="13" style="border: none; resize: none;" readonly>${ pb.proContent }</textarea>
	                  </div>
	
	                  <!-- 조회수/댓글 -->
	                  <div style="font-size:14px; text-align:right; margin: 10px 15px -0px 0px;">
	                    <span>댓글 <span id="rcount">0</span></span>
	                    &nbsp;
	                    <span>조회수 ${ pb.count }</span>
	                  </div>
	                  <br>
	
	                  <!-- 댓글창 -->
	                  <div action="" class="rep-div" id="replyArea">                 
	                    <!-- 댓글하나 -->
	                    <div class="replyArea2">
	                    	<!-- 댓글내용은 ajaxSelectReplyList(); -->
	                    </div>	    
	                    <!-- 댓글 입력창 -->
	                    <div class="reply-insert" style="display: flex; margin: 0px 0px 0px 10px;">
	                    	<c:choose>
	                    		<c:when test="${ empty loginUser }">
	                    		  <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; height: 40px; float: left; margin: 8px 0px 0px 5px;">
			                      <input class="form-control mb-2 search1" type="text" placeholder="로그인한 사용자만 이용 가능합니다." style="height:40px;" readonly>
			                      <button type="submit" class="btn btn-sm btn-primary btn3" style="height:40px;" disabled>등록</button>
	                    		</c:when>
	                    		<c:otherwise>
			                      <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; height: 40px; float: left; margin: 8px 0px 0px 5px;">
			                      <input class="form-control mb-2 search1" type="text" id="content" placeholder="내용을 입력해주세요" style="height:40px;">
			                      <button class="btn btn-sm btn-primary btn3" style="height:40px;" onclick="addReply();">등록</button>
		                      	</c:otherwise>
	                      	</c:choose>
	                    </div>
	                    <div style="height:10px"><span hidden>bb</span></div>
	                  </div>
	                  
	                  <script>
	                  		$(function(){
	                  			ajaxSelectReplyList();
	                  		})
	                  		function ajaxSelectReplyList(){ // 댓글조회용 ajax
	                  			$.ajax({
	                  				url: "rlist.pr",
	                  				data: {no:${pb.proBoardNo}},
	                  				success:function(list){
	                  					console.log(list);
	                  					
	                  					let value = "";	
	                  					for(let i=0; i<list.length; i++){
	                  						value += '<div class="reply1" style="display: inline-block;" >'
		                  							+	 '<img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px; float: left; margin: 3px 0px 0px 0px;">'
					              	                +    '<div style="margin: 0px 0px 0px 50px; text-align: left;">'
					          	                    +      '<span style="float: left;"><b>' + list[i].pbUserName + list[i].pbJobName + '(' + list[i].pbDepName + ')&nbsp;</b></span>'
					          	                    +      '<span style="float: left;">' + list[i].rCreateDate + '</span>'
					          	                    +      '<div style="float: right; font-size: 13.5px; margin: -10px 0px 0px 0px">';
		                  					
					          	          // if(${loginUser.userNo} == ${pb.replyWriter}){   
					          	        	//value +=       '<span class="rModify">수정</span>&nbsp'
		          	                       //         +      '<span class="rDelete">삭제</span>';
					          	          // }	
					          	           
					          	            value +=       '</div>'
					          	                    +      '<br>'
					          	                    +      '<span>' + list[i].proReply + '</span>'
					          	                    +    '</div>'
					          	                    + '</div>';				
	                  					}     
					          	                    
	                  					$(".replyArea2").html(value);
	                  					$("#rcount").text(list.length);
	                  					
	                  				},error:function(){
	                  					console.log("댓글리스트조회용 ajax통신 실패");
	                  				}
	                  			})
	                  		}
	                  		
	                  		function addReply(){ // 댓글 등록용 ajax
	                  			
	                  			if( $("#content").val().trim().length != 0 ){
	                  				
	                  				$.ajax({
	                  					url: "rinsert.pr",
	                  					data: {
	                  						proBoardNo: ${pb.proBoardNo},
	                  						replyWriter: '${loginUser.userNo}',
	                  						proReply: $("#content").val()
	                  					},
	                  					success:function(result){
	                  						if(result == "success"){
	                  							$("#content").val("");
	                  							ajaxSelectReplyList();
	                  						}
	                  					},error:function(){
	                  						console.log("댓글등록용 ajax통신 실패");
	                  					}
	                  				})
	                  				
	                  			}else{
	                  				alert("댓글 작성 후 등록해주세요.");
	                  			}
	                  		
	                  		}
	                  	 </script>
	                    
	                  
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
