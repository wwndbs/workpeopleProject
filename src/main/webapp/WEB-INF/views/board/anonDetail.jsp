<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.adminx-container {
		height: 100% !important;
	}
</style>
</head>
<body>

	<div class="adminx-container">
		<!-- header -->
		<jsp:include page="../common/header.jsp"/>
		
		<!-- menubar -->
		<jsp:include page="../common/menubar.jsp"/>
		
		<div class="adminx-content" style="padding-left : 65px;">
	        <div class="adminx-main-content" style="padding : 0; height: 100%;">
	          <div class="container-fluid" style="padding: 0; height: 100%;">
		
				<!-- 게시판 sidebar -->
				<jsp:include page="boardSidebar.jsp"/>
		
				<!-- 게시판 내용 시작 -->
              <div class="board-main">
              
                <br>

                <div class="board-title">
                    <h5>익명 게시판</h5>
                </div>

                <br>

                <div class="board-content">

                    <div class="write-button">
                    	<input type="hidden" id="rpType">
                      <button type="button" class="btn btn-sm btn-primary" onclick="location.href='enrollForm.bo?no=3'">새글쓰기</button>
                      <!-- <button type="button" class="btn btn-sm btn-light">쪽지</button> -->
                      <c:choose>
	                      <c:when test="${ loginUser.userNo eq b.userNo }">
		                      <button type="button" class="btn btn-sm btn-light">수정</button>
		                      <button type="button" class="btn btn-sm btn-danger" >삭제</button>
	                      </c:when>
	                      <c:otherwise>
	                          <button type="button" class="btn btn-sm btn-danger" onclick="rpType(1);" data-toggle="modal" data-target="#jyModal_confirm">신고</button>
	                      </c:otherwise>
                      </c:choose>
                      
                    </div>

                    <div class="page-button">
                      <button type="button" class="btn btn-sm btn-light" onclick="location.href='anonDetail.bo?boardNo=${b.boardNo - 1}&cpage=${ cpage }'">이전</button>
                      <button type="button" class="btn btn-sm btn-light" onclick="location.href='anonDetail.bo?boardNo=${b.boardNo + 1}&cpage=${ cpage }'">다음</button>
                      <button type="button" class="btn btn-sm btn-light" onclick="location.href='list.bo?cpage=${cpage}&no=3'">목록</button>
                    </div>

                    <div class="content-header">
                      <h5>${ b.boardTitle }</h5>
                      <h5 class="re">[<span id="replyCount">${ b.reply }</span>]</h5>
                      <div class="profile">
                        <img src="resources/images/defaultProfile.jpg" alt="">
                        <div id="date">${ b.createDate }</div>
                      </div>
                    </div>

                    <div class="content-body">
                      ${ b.boardContent }
                    </div>

                    <div class="content-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
                      <span>댓글 <span id="rCount">${ b.reply }</span>개</span> | 
                      <span>조회 ${ b.count }</span> | 
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart heart" id="heart" onclick="heart();"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                      <span>좋아요 <span id="bLike">${ b.like }</span>개</span>
                    </div>
                    
                    <script>
                    	  // 내가 좋아요 눌렀으면 색 채워져있게
                    
                      function heart(){
                          if($("#heart").attr("fill") != "red"){
                            
                            $.ajax({
                            	url: "like.bo",
                            	data: {
                            		boardNo: ${b.boardNo},
                            		userNo: "${loginUser.userNo}"
                            	},
                            	success: function(r){
                            		if(r.result == 1){
                            			
	                            		$("#heart").attr("fill", "red");
	                                    $("#heart").attr("stroke", "red");
	                                    
	                                    $("#bLike").text(r.count);
                            			
                            		}
                            	},error: function(){
                            		console.log("게시글 좋아요 ajax 실패");
                            	}
                            });
                            
                          }else{
                            
                            $.ajax({
                            	url: "unlike.bo",
                            	data: {
                            		boardNo: ${b.boardNo},
                            		userNo: "${loginUser.userNo}"
                            	},
                            	success: function(r){
                            		if(r.result == 1){
                            			
	                            		$("#heart").attr("fill", "none");
	                                    $("#heart").attr("stroke", "black");
	                                    
	                                    $("#bLike").text(r.count);
	                                    
                            		}
                            	},error: function(){
                            		console.log("좋아요 해제 ajax 실패");
                            	}
                            });
                            
                          }
                      }
                    	  
                      
                      function rpType(type){
                    	  if(type == 1){
                    		  $("#rpType").val(1);
                    	  }else{
                    		  $("#rpType").val(2);
                    	  }
                      }
                    </script>

                    <div class="content-reply">
                      
	                      <ul class="reply">
	                        
	                        
	                        
	                      </ul>

                      <!-- 댓글 -->
                      <div class="reply-create">
                        <span class="photo"><img src="resources/images/defaultProfile.jpg" alt=""></span>
                        <div class="msg-wrap">
                          <p class="form-wrap">
                            <span class="textarea-edit">
                              <textarea name="reply" id="newReply"></textarea>
                            </span>
                            <button type="button" class="btn btn-sm btn-light" onclick="reply();">댓글 작성</button>
                          </p>
                        </div>
                      </div>
                    </div>
                    
                    <!-- 신고하기 모달창 -->
                    <div class="modal" id="jyModal_confirm">
				        <div class="modal-dialog modal-dialog-centered">
				            <div class="modal-content">
				                <!-- Modal Header -->
				                <div class="modal-header">
				                    <h6 class="modal-title">신고하기</h6>
				                    <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
				                </div>
				                <!-- Modal body -->
				                <div class="modal-body" style="text-align: left; padding-left: 30px;">
				                    <p><b>신고사유를 선택해주세요</b></p>
				                    <input type="hidden" id="real">
				                    <p><input type="radio" class="rpRadio" value="악의적 욕설이 포함된 글">&nbsp;&nbsp;악의적 욕설이 포함된 글</p>
				                    <p><input type="radio" class="rpRadio" value="성적인 글 및 성희롱 발언">&nbsp;&nbsp;성적인 글 및 성희롱 발언</p>
				                    <p><input type="radio" class="rpRadio" value="홍보 및 상업적인 내용이 들어간 글">&nbsp;&nbsp;홍보 및 상업적인 내용이 들어간 글</p>
				                    <p><input type="radio" id="etcBtn" class="rpRadio" value="기타">&nbsp;&nbsp;기타</p>
				                    <textarea id="rpEtc" cols="50" rows="4" style="resize: none;" disabled></textarea>
				                </div>
				                <!-- Modal footer -->
				                <div class="modal-footer">
				                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
				                <button type="button" class="btn btn-jyok" id="realSpam" onclick="report();">신고</button>
				                </div>
				            </div>
				        </div>
				    </div>
				    
				    <!-- 토스트 메시지 -->
		   		    <div id="toast" class="">
					    
				    </div>
				    
				    <script>
				    	
				    	$(document).on("click", ".rpRadio", function(){
				    		
				    		$(this).parent().siblings().children("input").prop("checked", false);
				    		
				    		if($(this).val() != "기타"){
					    		$("#real").val($(this).val());
				    		}else{
				    			$("#rpEtc").attr("disabled", false);
				    			$("#real").val($(this).parent().next().val());
				    		}
				    		
				    		if($("#etcBtn").is(":checked")){
				    			$("#rpEtc").attr("disabled", false);
				    		}else{
				    			$("#rpEtc").attr("disabled", true);
				    		}
				    		
				    	})

	                	// 신고
	                	function report(){
	                		
				    		// 유저가 동일한 게시글을 신고한 이력이 있는지 조회
				    		$.ajax({
				    			url: "rpCheck.bo",
				    			data: {
				    				reportRefNo: ${b.boardNo},
				    				userNo: "${loginUser.userNo}"
				    			},
				    			success: function(rep){

				    				if(rep == null){ // 이력 없음
				    					
				    					// 신고 접수
				    					let type = $("#rpType").val();
				    					
							    		if($("#etcBtn").is(":checked")){
							    			$("#real").val($("#rpEtc").val());
							    		}
							    		
				                		let value = $("#real").val();
				                		
				                		$.ajax({
				                			url: "report.bo",
				                			data: {
				                				reportType: type,
				                				reportRefNo: ${b.boardNo},
				                				userNo: "${loginUser.userNo}",
				                				reportContent: value
				                			},
				                			success: function(r){
				                				if(r.result > 0){
				                					
				                					toast("신고가 접수되었습니다.");
				                					
				                					$(".btn-jycancle").click();
				                					
				                				}else{
				                					console.log("신고 실패");
				                				}
				                			},error: function(){
				                				console.log("신고 ajax 실패");
				                			}
				                		});
				    					
				    				}else{ // 이력 있음

				    					toast("이미 신고가 접수되었습니다.");
				    				
				    					$(".btn-jycancle").click();
				    					
				    				}

				    				
				    			},error: function(){
				    				console.log("신고 여부 ajax 실패");
				    			}
				    		});
				    		
				    		
	                		 
	                	}
				    	
				    	// 토스트
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
                    
                    <script>
                    
                    	// 댓글 조회도 ajax로 해야할 듯..^^
                    	$(function(){
                    		
                    		selectReplyList();
                    		
                    		if(${bLike == 1}){
                    			
                    			$("#heart").attr("fill", "red");
                                $("#heart").attr("stroke", "red");
                    			
                    		}
                    		
                    		$("#rpReply").click(function(){
                    			console.log("클릭됨");
                    			$("#rpType").val(2);
                    		})
                    		
                    	})
                    	
                    
                    	// 댓글 추가 ajax
                    	function reply(){
                    		
	                    	$.ajax({
	                    		url: "reply.bo",
	                    		data: {
	                    			userNo: "${loginUser.userNo}",
	                    			refBoardNo: ${b.boardNo},
	                    			replyContent: $("#newReply").val()
	                    		},
	                    		success: function(result){
	                    			if(result.result > 0){
	                    				
	                    				selectReplyList();
	                    				
	                    				$("#newReply").val("");
	                    				$("#rCount").text(Number($("#rCount").text()) + 1);
                    					$("#replyCount").text(Number($("#replyCount").text()) + 1);
	                    				
	                    			}else{
	                    				console.log("댓글 작성 실패");
	                    			}
	                    		},error: function(){
	                    			console.log("댓글 추가 ajax 실패");
	                    		}
	                    	});
	                    	
                    	}
                    
                    	// 대댓글 작성폼
                    	function addReply(tt){
                    		
                    		let dd = $(tt).text();
                    		
                    		if(dd == "취소"){
                    			$(tt).text("댓글");
                    			
                    			$(tt).parent().parent().parent().parent().parent().next().remove();
                    		}else{
                    			$(tt).text("취소");
                    			
                    			let value = '<li class="depth-in">'
                    						+	'<div class="newReply-create">'
                    						+		'<span class="photo"><img src="resources/images/defaultProfile.jpg" alt=""></span>'
                    						+		'<div class="msg-wrap">'
                    						+			'<p class="form-wrap">'
                    						+				'<span class="textarea-edit">'
                    						+					'<textarea name="reply" id="newreReply"></textarea>'
                    						+				'</span>'
                    						+				'<button type="button" class="btn btn-sm btn-light" onclick="reReply(this);">댓글 작성</button>'
                    						+			'</p>'
                    						+		'</div>'
                    						+	'</div>'
                    						+'</li>';
                    			
                    			$(tt).parent().parent().parent().parent().parent().after(value);
                    		}
                    	}
                    	
                    	// 대댓글 추가 ajax
                    	function reReply(btn){
                    		
                    		let bb = $(btn).parent().parent().parent().parent().prev().children().eq(0).val();
                    		
                    		$.ajax({
                    			url: "reReply.bo",
                    			data: {
                    				userNo: "${loginUser.userNo}",
	                    			refBoardNo: ${b.boardNo},
	                    			refReplyNo: bb,
	                    			replyContent: $(btn).prev().children().eq(0).val()
                    			},
                    			success: function(result){
                    				
                    				if(result.result > 0){
                    					
                    					selectReplyList();
                    					
                    					$("#rCount").text(Number($("#rCount").text()) + 1);
                    					$("#replyCount").text(Number($("#replyCount").text()) + 1);
                    					
                    				}else{
                    					console.log("대댓글 작성 실패");
                    				}
                    				
                    			},error: function(){
                    				console.log("대댓글 추가 ajax 실패");
                    			}
                    		});
                    		
                    	}
                    	
                    	// 댓글 조회
                    	function selectReplyList(){
                    		
                    		$.ajax({
                    			url: "rlist.bo",
                    			data: {boardNo: ${b.boardNo}},
                    			success: function(list){
                    				
                    				let userNo = '${loginUser.userNo}';
                    				
                    				let value = "";
                    				
                    				if(list != null){
                    					
                    					for(let i=0; i<list.length; i++){
                    						if(list[i].level == 1){
                    							value += '<li>'
                    									+	'<input type="hidden" id="replyNo" value="' + list[i].replyNo + '">'
                    									+	'<input type="hidden" id="level" value="' + list[i].level + '">';
                    						}else{
                    							value += '<li class="depth-in">'
                    									+	'<input type="hidden" id="replyNo" value="' + list[i].replyNo + '">'
                    									+	'<input type="hidden" id="level" value="' + list[i].level + '">';
                    						}
                    						
                    						value += '<div>'
                    								+	'<span class="photo"><img src="resources/images/defaultProfile.jpg" alt=""></span>'
                    								+	'<div class="msg-wrap">'
                    								+		'<div class="info">';
                    						
                    						if(list[i].level == 1){
                    							value += '<span class="btn-wrap" id="reply" style="margin-left: 0;">'
                    									+	'<span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="grey" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right"><polyline points="15 10 20 15 15 20"></polyline><path d="M4 4v7a4 4 0 0 0 4 4h12"></path></svg></span>'
                    									+	'<span class="txt" onclick="addReply(this);">댓글</span>'
                    									+'</span>';
                    						}
                    						
                    						value += 			'<span class="date">' + list[i].createDate + '</span>';
                    						
                    						if(userNo != list[i].userNo){
                    							value += '<span class="report" onclick="rpType(2);" data-toggle="modal" data-target="#jyModal_confirm">신고</span>';
                    						}else{
                    							value += '<span class="editRe" onclick="editForm(this);">수정</span>'
                    									+'<span class="deleteRe" onclick="deleteRe(this);">삭제</span>';
                    						}
                    						
                    						value +=		'</div>'
                    								+		'<p>'
                    								+			'<span class="commentContent">' + list[i].replyContent + '</span>'
                    								+		'</p>'
                    								+	'</div>'
                    								+'</div>'
                    								+'</li>';
                    					}
                    					
                    				}
                    				
                    				
                    				$('.reply').html(value);
                    				
                    				
                    			},error: function(){
                    				console.log("댓글 조회 ajax 실패");
                    			}
                    		});
                    		
                    	}
                    	
                    	// 댓글 수정폼
                    	function editForm(btn){
                    		
                    		let $p = $(btn).parent().next();
                    		
                    		
                    		
                    		let value = '<p class="form-wrap newReply-create" style="margin-right: 100px;">'
                    				  +		'<span class="textarea-edit">'
        							  +			'<textarea name="reply" id="editReplyForm">' + $p.children().eq(0).text() + '</textarea>'
        							  +		'</span>'
        							  +		'<button type="button" class="btn btn-sm btn-light editRe" style="top: 37px;">댓글 작성</button>'
        							  + '</p>';
        							  
        					$p.html(value);
                    		
                    	}
                    	
                    	// 댓글 수정 등록
                    	$(document).on("click", ".editRe", function(){
                    		
                    		let rNo = $(this).parent().parent().parent().parent().prev().prev().val();
                    		
                    		let rContent = $(this).prev().children().val();
                    		
                    		$.ajax({
                    			url: "editReply.bo",
                    			data: {
                    				replyNo: rNo,
                    				replyContent: rContent
                    			},
                    			success: function(r){
                    				
                    				if(r.result > 0){
                    					
                    					selectReplyList();
                    					
                    				}else{
                    					console.log("댓글 수정 실패");
                    				}
                    				
                    			},error: function(){
                    				console.log("댓글 수정 ajax 실패");
                    			}
                    		});
                    		
                    	})
                    	
                    	// 댓글 삭제
                    	function deleteRe(btn){
                    		
                    		let level = $(btn).parent().parent().parent().prev().val();
                    		let rNo = $(btn).parent().parent().parent().prev().prev().val();
                    		
                    		if(level == 1){ // 댓글 삭제
                    			
                    			value = '<li>'
                    					+	'<p>'
                    					+		'<span class="commentContent delComment" style="color: #888; font-size: 14px;">삭제된 댓글입니다.</span>'
                    					+	'</p>'
                    					+'</li>';
                    			
                    			$(btn).parent().parent().parent().parent().html(value);
                    			
                    		}
                    		
                    		$.ajax({
                    			url: "deleteReply.bo",
                    			data: {replyNo: rNo},
                    			success: function(){
                    				console.log("댓글 삭제 ajax 성공");
                    			},error: function(){
                    				console.log("댓글 삭제 ajax 실패");
                    			}
                    		});
                    		
                    	}
                    	
                    		
                    
                    </script>
                    
                </div>
              
              
              
              
              
              
              
              </div>
              <!-- 게시판 내용 끝 -->
		
			  </div>
			</div>
		</div>
	</div>

</body>
</html>