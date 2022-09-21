<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                    <h5>공지 게시판</h5>
                </div>

                <br>

                <div class="board-content">

                    <div class="write-button">
                      <button type="button" class="btn btn-sm btn-primary">새글쓰기</button>
                      <button type="button" class="btn btn-sm btn-light">쪽지</button>
                      <button type="button" class="btn btn-sm btn-light">수정</button>
                      <button type="button" class="btn btn-sm btn-danger">삭제</button>
                    </div>

                    <div class="page-button">
                      <button type="button" class="btn btn-sm btn-light">이전</button>
                      <button type="button" class="btn btn-sm btn-light">다음</button>
                      <button type="button" class="btn btn-sm btn-light">목록</button>
                    </div>

                    <div class="content-header">
                      <h5>퇴근하고싶다..</h5>
                      <h5 class="re">[3]</h5>
                      <div class="profile">
                        <img src="workpeople-resources/images/defaultProfile.jpg" alt="">
                        <div>김은주 대리</div>
                        <div id="date">2022-08-22(월) 09:26</div>
                      </div>
                    </div>

                    <div class="content-body">
                      이제 출근한 지 30분도 안 된 거 실화인가요..? <br><br>

                      믿기지 않아요...
                    </div>

                    <div class="content-icon">
                      <i data-feather="message-circle"></i>
                      <span>댓글 3개</span> | 
                      <span>조회 13</span> | 
                      <i data-feather="heart" class="heart" id="heart" onclick="heart();"></i>
                      <span>좋아요 2개</span>
                    </div>
                    
                    <script>
                      function heart(){
                          if($("#heart").attr("fill") != "red"){
                            $("#heart").attr("fill", "red");
                            $("#heart").attr("stroke", "red");
                          }else{
                            $("#heart").attr("fill", "none");
                            $("#heart").attr("stroke", "black");
                          }
                      }
                    </script>

                    <div class="content-reply">
                      <ul class="reply">
                        <li>
                          <div>
                            <span class="photo"><img src="workpeople-resources/images/defaultProfile.jpg" alt=""></span>
                            <div class="msg-wrap">
                              <div class="info">
                                <span class="name">김재현 부장</span>
                                <span class="btn-wrap" id="reply">
                                  <span><i data-feather="corner-down-right" stroke="grey"></i></span>
                                  <span class="txt">댓글</span> <!-- 클릭 시 "취소"로 변경되도록 -->
                                </span>
                                <span class="date">6시간 전</span>
                                <span class="message">쪽지</span>
                              </div>
                              <p>
                                <span class="commentContent">저두요..</span>
                              </p>
                            </div>
                          </div>
                        </li>
                        <li class="depth-in"> <!-- 안으로 들여쓰는 법 알아야 함 (sql구문으로 가능한지) -->
                          <div>
                            <span class="photo"><img src="workpeople-resources/images/defaultProfile.jpg" alt=""></span>
                            <div class="msg-wrap">
                              <div class="info">
                                <span class="name">김은지 대리</span>
                                <span class="date">6시간 전</span>
                                <span class="message">쪽지</span>
                              </div>
                              <p>
                                <span class="commentContent">어떻게 버티실 건가요..</span>
                              </p>
                            </div>
                          </div>
                        </li>
                      </ul>

                      <!-- 댓글 간 간격 조정하기 (프로필 사진 위치도 조정) -->
                      <div class="reply-create">
                        <span class="photo"><img src="workpeople-resources/images/defaultProfile.jpg" alt=""></span>
                        <div class="msg-wrap">
                          <p class="form-wrap">
                            <span class="textarea-edit">
                              <textarea name="reply" id=""></textarea>
                            </span>
                            <button type="button" class="btn btn-sm btn-light">댓글 작성</button>
                          </p>
                        </div>
                      </div>
                    </div>
                    
                </div>
              
              
              
              
              
              
              
              </div>
              <!-- 게시판 내용 끝 -->
		
			  </div>
			</div>
		</div>
	</div>

</body>
</html>