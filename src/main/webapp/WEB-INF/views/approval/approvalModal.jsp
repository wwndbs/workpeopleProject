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
	<div class="modal-background" style="display : none;">
		<div class="modal-wrapper">
			<div class="content-area">
				<div class="content-01">
					<button id="department" type="button">부서 ▼</button>
					<ul id="department-list" style="display : none">
<!-- 						<li onclick="memberList('인사팀');" style="cursor : pointer;"><a>인사팀</a></li>
						<li onclick="memberList('개발팀');" style="cursor : pointer;"><a>개발팀</a></li>
						<li onclick="memberList('총무팀');" style="cursor : pointer;"><a>총무팀</a></li>
						<li onclick="memberList('회계팀');" style="cursor : pointer;"><a>회계팀</a></li>
						<li onclick="memberList('영업팀');" style="cursor : pointer;"><a>영업팀</a></li> -->
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
						<i class="fas fa-caret-square-right" id="insert-approval"></i>
						<br>
						<i class="fas fa-caret-square-left" id="delete-approval"></i>
					</div>
					<div>
						<i class="fas fa-caret-square-right" id="insert-reference"></i>
						<br>
						<i class="fas fa-caret-square-left" id="delete-reference"></i>
					</div>
				</div>
				<div class="content-04">
					<div class="approval-line">
						<h5>
							<strong>결재선</strong>
						</h5>
						<div>
							<!-- ajax조회 -->						
						</div>
					</div>
					<div class="reference">
						<h5>
							<strong>참조</strong>
						</h5>
						<div>
							<!-- ajax조회 -->						
						</div>
					</div>
				</div>
			</div>
			<div class="modal-btn">
				<button class="btn btn-secondary btn-sm" id="modal-close" type="button">닫기</button>
				<button class="btn btn-primary btn-sm" id="insert-member" type="button">등록</button>
			</div>
		</div>
	</div>
	
	<script>
		// 부서별 멤버 조회
		$(document).on("click", "#department-list li", function(){
			$.ajax({
				url : "memberList.ap",
				data : {
					dept : $(this).text()
				},
				success : function(result){
					value = "";
					if(result.length == 0){
						value += '<li>조회된 부서원이 없습니다.</li>';
					}else{
						for(let i = 0; i < result.length; i++){
							value += '<li>'
							      +  	'<input type="checkbox" id="member-check" value="' + result[i].userNo + '">'
							      +     '<div>';
							      
							if(result[i].profImg){
								value += '<img src="' + result[i].profImg + '">';
							}else{
								value += '<img src="resources/profile_images/defaultProfile.jpg">';
							}   
							      
							value +=		'&nbsp;&nbsp;<strong>' + result[i].userName + '</strong>&nbsp;&nbsp;' + result[i].jobName + '&nbsp;' + result[i].depName
							      +     '</div>'
							      +  '</li>';
						}						
					}
					$(".member-list>ul").html(value);
				},
				error : function(){
					console.log("부서별 멤버 조회 부분 ajax 연결 실패");
				}
			})
		})	
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
		// 부서 조회
		$(function(){
			$.ajax({
				url : "departmentList.ap",
				success : function(dep){
					value = "";
					for(let i = 0; i < dep.length; i++){
						value += '<li style="cursor : pointer;">' + dep[i].depName + '</li>';
					}
					$("#department-list").html(value);
				},
				error : function(){
					console.log("부서조회 부분 ajax연결 실패");
				}
			})
		})
	</script>

	<script>
	    // 부서 드롭 다운 메뉴
		$(function() {
			$('#department-list').hide();
		})
	
		$('#department').click(function() {
			$('#department-list').toggle();
		});
		
		// 모달창
		$(function(){
			$('#approval-line').click(function(){
				if($('.modal-background').css("display") == "none"){
					$('.modal-background').css("display", "");
				}else{
					$('.modal-background').css("display", "none");
				}
			})
		})
		
		// 모달창 닫기
		$("#modal-close").click(function(){
			$('.modal-background').css("display", "none");
		})
	</script>
	
	<script>	
		// 체크된 멤버 결재선 부분으로 이동
		$(document).on("click", "#insert-approval", function(){
			let check =  $("#member-check:checked").length; // 체크된 체크박스 수
			let checkList = $("#member-check:checked:checked"); // 체크된 체크박스 리스트
			
			$(".member-list input").prop("checked", false);
			
			if(check > 3){
				toast("최대 3명 선택 가능합니다.");
			}else if(check <= 0){
				toast("선택된 멤버가 없습니다.");
			}else{
				let checkMember = "";
				for(let i = 0; i < checkList.length; i++){
					if(i == (checkList.length - 1)){
						checkMember += checkList[i].value;
					}else{
						checkMember += checkList[i].value + ",";
					}
				}

 				$.ajax({
					url : "insertCheck.ap",
					data : {
						checkUserNo : checkMember
					},
					success : function(list){
						let value="";
						
						for(let i = 0; i < list.length; i++){
							value += '<ul>'
							      +  	'<li>'
							      +  		'<input type="checkbox" id="select-approval-line" value="' + list[i].userNo + '">'
							      +  		'<div>';
							      
							if(list[i].profImg){
								value += '<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value += '<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}     
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".approval-line>div").html(value);
					},
					error : function(){
						console.log("결재선 이동 부분 ajax연결실패");
					}
				})
			}
		})
	</script>
	
		<script>	
		// 체크된 멤버 참조 부분으로 이동
		$(document).on("click", "#insert-reference", function(){
			let check =  $("#member-check:checked").length; // 체크된 체크박스 수
			let checkList = $("#member-check:checked:checked"); // 체크된 체크박스 리스트
			
			$(".member-list input").prop("checked", false);
			
			if(check <= 0){
				toast("선택된 멤버가 없습니다.");
			}else{
				let checkMember = "";
				for(let i = 0; i < checkList.length; i++){
					if(i == (checkList.length - 1)){
						checkMember += checkList[i].value;
					}else{
						checkMember += checkList[i].value + ",";
					}
				}

 				$.ajax({
					url : "insertCheck.ap",
					data : {
						checkUserNo : checkMember
					},
					success : function(list){
						let value="";
						
						for(let i = 0; i < list.length; i++){
							value += '<ul>'
							      +  	'<li>'
							      +  		'<input type="checkbox" id="select-reference-line" value="' + list[i].userNo + '">'
							      +  		'<div>';
							      
							if(list[i].profImg){
								value += '<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value += '<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}    
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".reference>div").html(value);
					},
					error : function(){
						console.log("참조 이동 부분 ajax연결실패");
					}
				})
			}
		})
	</script>
	
	<script>
		// 체크된 멤버 결재선 영역에서 제외하기
		$(document).on("click", "#delete-approval", function(){
			let check =  $("#select-approval-line:checked").length; // 체크된 체크박스 수
			let unCheckList = $("#select-approval-line:not(:checked)"); // 체크가 안된 체크박스 리스트
			
			if(check <= 0){
				toast("선택된 멤버가 없습니다.");
			}else{
				let unCheckMember = "";
				
				for(let i = 0; i < unCheckList.length; i++){
					if(i == (unCheckList.length - 1)){
						unCheckMember += unCheckList[i].value;
					}else{
						unCheckMember += unCheckList[i].value + ",";
					}
				}
				
 				$.ajax({
					url : "excludeCheckMember.ap",
					data : {
						unCheckMember : unCheckMember
					},
					success : function(list){
						let value="";
						
						for(let i = 0; i < list.length; i++){
							value += '<ul>'
							      +  	'<li>'
							      +  		'<input type="checkbox" id="select-approval-line" value="' + list[i].userNo + '">'
							      +  		'<div>';
							      
							      
							if(list[i].profImg){
								value += '<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value += '<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".approval-line>div").html(value);
					},
					error : function(){
						console.log("결재선 멤버 제외 부분 ajax연결실패");
					}
				})
			}
		})
	</script>
	
	<script>
		// 체크된 멤버 참조 영역에서 제외하기
		$(document).on("click", "#delete-reference", function(){
			let check =  $("#select-reference-line:checked").length; // 체크된 체크박스 수
			let unCheckList = $("#select-reference-line:not(:checked)"); // 체크가 안된 체크박스 리스트
			
			if(check <= 0){
				toast("선택된 멤버가 없습니다.");
			}else{
				let unCheckMember = "";
				
				for(let i = 0; i < unCheckList.length; i++){
					if(i == (unCheckList.length - 1)){
						unCheckMember += unCheckList[i].value;
					}else{
						unCheckMember += unCheckList[i].value + ",";
					}
				}
				
 				$.ajax({
					url : "excludeCheckMember.ap",
					data : {
						unCheckMember : unCheckMember
					},
					success : function(list){
						let value="";
						
						for(let i = 0; i < list.length; i++){
							value += '<ul>'
							      +  	'<li>'
							      +  		'<input type="checkbox" id="select-reference-line" value="' + list[i].userNo + '">'
							      +  		'<div>';
							      
							if(list[i].profImg){
								value += '<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value += '<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}    
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".reference>div").html(value);
					},
					error : function(){
						console.log("결재선, 참조 멤버 제외 부분 ajax연결실패");
					}
				})
			}
		})
	</script>
	
	<script>
	    // 결재선, 참조 부분에 있는 멤버 등록
		$(document).on("click", "#insert-member", function(){
			let approvalMember = $(".approval-line>div input[type=checkbox]") // 결재선 부분 멤버 리스트
			let referenceMember = $(".reference>div input[type=checkbox]") // 참조 부분 멤버 리스트
			let documentNo = ${document.documentNo}
			
			let approval = "";
			let reference = "";
			
			for(let i = 0; i < approvalMember.length; i++){
				if(i == (approvalMember.length - 1)){
					approval += approvalMember[i].value;
				}else{
					approval += approvalMember[i].value + ",";
				}
			}
			
			for(let i = 0; i < referenceMember.length; i++){
				if(i == (referenceMember.length - 1)){
					reference += referenceMember[i].value;
				}else{
					reference += referenceMember[i].value + ",";
				}
			}
			
			if(approvalMember.length <= 0){
				toast("결재자를 선택해 주세요.");
			}else{
				$.ajax({
					url : "insertApprovalAndReference.ap",
					data : {
						approvalMember : approval,
						referenceMember : reference,
						documentNo : documentNo
					},
					success : function(){
						toast("등록완료");
						$('.modal-background').css("display", "none");
						setTimeout(reload, 1000);
					},
					error : function(){
						console.log("결재선, 참조 멤버 등록 부분 ajax연결실패");
					}
				})					
			}
		})
	</script>
	
	<script>
		function reload(){
			location.reload();
		}
	</script>
</body>
</html>