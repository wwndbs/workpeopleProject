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
						<i class="fas fa-caret-square-right" id="insert-receiver"></i>
						<br>
						<i class="fas fa-caret-square-left" id="delete-receiver"></i>
					</div>
					<div>
						<i class="fas fa-caret-square-right" id="insert-reference"></i>
						<br>
						<i class="fas fa-caret-square-left" id="delete-reference"></i>
					</div>
				</div>
				<div class="content-04">
					<div class="adr-receiver">
						<h5>
							<strong>받는 사람</strong>
						</h5>
						<div>
							<!-- ajax조회 -->						
						</div>
					</div>
					<div class="adr-reference">
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
				data : {dept : $(this).text()},
				success : function(result){
					value = "";
					if(result.length == 0){
						value += '<li>조회된 부서원이 없습니다.</li>';
					}else{
						for(let i = 0; i < result.length; i++){
							value += '<li>'
							      +  	'<input type="checkbox" id="member-check" value="' + result[i].userNo + '">'
							      +  	'<div>';
							      
							if(result[i].profImg){
								value += 	'<img src="' + result[i].profImg + '">';
							}else{
								value += 	'<img src="resources/profile_images/defaultProfile.jpg">';
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
		// 체크된 요소 받는사람, 참조 이동
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
			$('#addressbook').click(function(){
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
		// 체크된 멤버 받는사람으로 이동
		$(document).on("click", "#insert-receiver", function(){
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
							      +  		'<input type="checkbox" id="select-receiver-line" value="' + list[i].userNo + '">'
							      +  		'<input type="hidden" name="select-receiver-email" value="' + list[i].email + '">'
							      +  		'<div>';
							      
							if(list[i].profImg){
								value += 		'<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value += 		'<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}     
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".adr-receiver>div").append(value);
					},
					error : function(){
						console.log("받는사람 이동 부분 ajax연결실패");
					}
				})
			}
		})
	</script>
	
		<script>	
		// 체크된 멤버 참조로 이동
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
							      +  		'<input type="hidden" name="select-reference-email" value="' + list[i].email + '">'
							      +  		'<div>';
							      
							if(list[i].profImg){
								value += 		'<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value += 		'<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}    
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".adr-reference>div").append(value);
					},
					error : function(){
						console.log("참조 이동 부분 ajax연결실패");
					}
				})
			}
		})
	</script>
	
	<script>
		// 체크된 멤버 받는사람에서 제외하기
		$(document).on("click", "#delete-receiver", function(){
			let check =  $("#select-receiver-line:checked").length; // 체크된 체크박스 수
			let unCheckList = $("#select-receiver-line:not(:checked)"); // 체크가 안된 체크박스 리스트
			
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
							      +  		'<input type="checkbox" id="select-receiver-line" value="' + list[i].userNo + '">'
							      +  		'<input type="hidden" name="select-receiver-email" value="' + list[i].email + '">'
							      +  		'<div>';
							      
							      
							if(list[i].profImg){
								value += 		'<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value +=		'<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".adr-receiver>div").html(value);
					},
					error : function(){
						console.log("받는사람 멤버 제외 부분 ajax연결실패");
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
							      +  		'<input type="hidden" name="select-reference-email" value="' + list[i].email + '">'
							      +  		'<div>';
							      
							if(list[i].profImg){
								value += 		'<img src="' + list[i].profImg + '">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}else{
								value += 		'<img src="resources/profile_images/defaultProfile.jpg">  <strong>' + list[i].userName + '</strong>  ' + list[i].jobName + ' ' + list[i].depName;
							}    
							      
							value +=  		'</div>'
							      +  	'</li>'
							      +  '</ul>';
						}
						$(".adr-reference>div").html(value);
					},
					error : function(){
						console.log("받는사람, 참조 멤버 제외 부분 ajax연결실패");
					}
				})
			}
		})
	</script>
	
	<script>
	    // 받는사람, 참조 부분에 있는 멤버 등록
		$(document).on("click", "#insert-member", function(){

            $('.modal-background').css("display", "none");
			
			let receiverArr = $(".adr-receiver>div input[name=select-receiver-email]") // 받는사람 멤버 리스트
			let refArr = $(".adr-reference>div input[name=select-reference-email]") // 참조 멤버 리스트
			
			// 받는사람 주소 li요소로 추가
			let value = "";
			let receiverMail = "";
			for(let i = 0; i < receiverArr.length; i++){
				value +='<li class="mail-addr-out to-li">'
                  	  + 	'<span class="addr-block">' 
                  	  + 		receiverArr[i].value
                   	  + 	'</span>'
                      + 	'<span class="btn-addr-remove">'
                  	  + 		'<ion-icon name="close-outline"></ion-icon>'
                 	  + 	'</span>'
                	  + '</li>';
                    
                receiverMail += receiverArr[i].value + ",";
				
				if(receiverArr[i].value == "${ loginUser.email }"){ // 내 주소를 입력시 나에게 체크박스 체크
					$("#toMe").prop("checked", true);
				}
			}
			
			receiverMail = receiverMail.substring(0,receiverMail.lastIndexOf(",")); // 맨 뒤 콤마 삭제
			
			$("#to").val("");
            $("#toAddrWrap .mail-addr-create").before(value);
            
            
         	// input value에 입력한 주소 추가
          	let currTo = $("#receiver").val();
          	if(currTo == ''){ // 처음 주소 추가 시
          		$("#receiver").val(receiverMail);
          	}else{
          		$("#receiver").val(currTo + "," + receiverMail);
          	}
          	
          	toLimit();
          	
        	// 참조인 주소 li요소로 추가
        	let refVal = "";
        	let refMail = ""
		    for(let i = 0; i < refArr.length; i++){
		    	refVal +='<li class="mail-addr-out ref-li">'
			           + 	'<span class="addr-block">' 
			           + 		refArr[i].value
			           + 	'</span>'
			           + 	'<span class="btn-addr-remove">'
			           + 		'<ion-icon name="close-outline"></ion-icon>'
			           + 	'</span>'
			           + '</li>';
			    
		    	refMail += refArr[i].value + ",";      
			          
		    }
        	
        	refMail = refMail.substring(0,refMail.lastIndexOf(",")); // 맨 뒤 콤마 삭제
			
		    $("#ref").val("");
		    $("#refAddrWrap .mail-addr-create").before(refVal);
        	
			// input value에 입력한 주소 추가
            let currRef = $("#mailRef").val();
            if(currRef == ''){ // 처음 주소 추가 시
            	$("#mailRef").val(refMail);
            }else{
            	$("#mailRef").val(currRef + "," + refMail);
            }
            
            refLimit();
            
		})
	</script>
	
	<script>
		function reload(){
			location.reload();
		}
	</script>
</body>
</html>