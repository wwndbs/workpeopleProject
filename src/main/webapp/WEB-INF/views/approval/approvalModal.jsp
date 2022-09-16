<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="modal-background" style="display : none;">
		<div class="modal-wrapper">
			<div class="content-area">
				<div class="content-01">
					<button id="department" type="button">부서 ▼</button>
					<ul id="department-list" style="display : none">
						<li onclick="memberList(1);"><a>인사팀</a></li>
						<li onclick="memberList(2);"><a>개발팀</a></li>
						<li onclick="memberList(3);"><a>총무팀</a></li>
						<li onclick="memberList(4);"><a>회계팀</a></li>
						<li onclick="memberList(5);"><a>영업팀</a></li>
					</ul>
				</div>
				<div class="content-02">
					<div class="member-list">
						<ul>
							<!-- ajax 조회 -->
						</ul>
					</div>
				</div>
				<div class="content-03">
					<div>
						<i class="fas fa-caret-square-right"></i>
						<br>
						<i class="fas fa-caret-square-left"></i>
					</div>
					<div>
						<i class="fas fa-caret-square-right"></i>
						<br>
						<i class="fas fa-caret-square-left"></i>
					</div>
				</div>
				<div class="content-04">
					<div class="approval-line">
						<h5>
							<strong>결재선</strong>
						</h5>
						<ul>
							<li>
								<div>
									<img src="resources/images/defaultProfile.jpg" alt="프로필이미지">&nbsp;&nbsp;<strong>개발팀</strong>&nbsp;&nbsp; 홍길동 대리
								</div>
								<button>
									<i class="fas fa-times"></i>
								</button>
							</li>
						</ul>
					</div>
					<div class="reference">
						<h5>
							<strong>참조</strong>
						</h5>
						<ul>
							<li>
								<div>
									<img src="resources/images/defaultProfile.jpg" alt="프로필이미지">&nbsp;&nbsp;<strong>개발팀</strong>&nbsp;&nbsp; 홍길동 대리
								</div>
								<button>
									<i class="fas fa-times"></i>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="modal-btn">
				<button class="btn btn-secondary btn-sm" id="modal-close" type="button">닫기</button>
				<button class="btn btn-primary btn-sm">등록</button>
			</div>
		</div>
	</form>
	
	<script>
		// 부서별 멤버 조회
		function memberList(dept){
			$.ajax({
				url : "memberList.ap",
				data : {
					dept : dept
				},
				success : function(result){
					value = "";
					for(let i = 0; i < result.length; i++){
						value += '<li>'
						      +  	'<input type="checkbox">'
						      +     '<div>'
						      +         '<input type="hidden" value="' + result[i].userNo + '"'
						      +     	'<img src="' + result[i].profImg + '">'
						      +			'&nbsp;&nbsp;<strong>' + result[i].userName + '</strong>&nbsp;&nbsp;' + result[i].depName + '&nbsp;' + result[i].jobName
						      +     '</div>'
						      +  '</li>';
					}
					$(".member-list>ul").html(value);
				},
				error : function(){
					console.log("부서별 멤버 조회 부분 ajax 연결 실패");
				}
			})
		}
	</script>
	
	<script>
		// 체크된 요소 결재선, 참조 이동
	</script>

	<!--summernote-->
	<script>
	    $(document).ready(function() {
	        $('#summernote').summernote({
	          minHeight: 390,  // 최소 높이
	          maxHeight: 800,  // 최대 높이
	          focus: false,    // 에디터 로딩후 포커스를 맞출지 여부
	          lang: "ko-KR",   // 한글 설정
	          tabsize: 2,
	          height: 120,
	          toolbar: [
	          ['fontsize', ['fontsize']],    // 글자 크기 설정
	          ['style', ['style']],
	          ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	          ]
	         });
	      });
	</script>

	<script>
		$(function() {
			$('#department-list').hide();
		})
	
		$('#department').click(function() {
			$('#department-list').toggle();
		});
		
		
		$(function(){
			$('#approval-line').click(function(){
				if($('.modal-background').css("display") == "none"){
					$('.modal-background').css("display", "");
				}else{
					$('.modal-background').css("display", "none");
				}
			})
		})
	</script>
</body>
</html>