<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
  input{
    height: 30px;
    border: 1px solid #ddd;
  }

  .note-editor{
    width: 100% !important;
  }

  .fixedCol1{
    text-align: left; 
    width: 80px; 
    min-width: 80px;
    max-width: 80px; 
  }

  .fixedCol2{
    width: 95px; 
    min-width: 95px;
    max-width: 95px; 
  }

  .fixedCol3{
    width: 120px; 
    min-width: 120px;
    max-width: 120px; 
  }
  
  .hide{
	display:none !important;
  }
	
  .open{
	display:block;
  }
  
  .mail-filebox b{
  	cursor: pointer;
  }
  
</style>
</head>
<body>
	
	<div class="adminx-container">
	
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/menubar.jsp" />
		
		<!-- 컨텐츠 부분 wrapper -->
		<div class="adminx-content" style="padding-left:65px;">
			<div class="adminx-main-content" style="padding: 0; height: 100%;">
				<div class="container-fluid" style="padding: 0; height: 100%;">
					<!-- 메일 전체 div 시작 -->
					<div class="container-mail">
				
						<jsp:include page="../mail/mailSidebar.jsp"/>
					  
						<!-- 메일 내용 시작 -->
						<div class="mail-main-form">
							<span class="mail-h">메일 쓰기</span>
							<br>
						  
							<c:choose>
								<c:when test="${ type eq 'relay' }"> <!-- 전달 발송 -->
									<form action="insertRelay.ma" id="mailForm" method="post" enctype="multipart/form-data">
								</c:when>
								<c:when test="${ type eq 'out' }"> <!-- 임시 저장 후 발송 -->
									<form action="sendSave.ma" id="mailForm" method="post" enctype="multipart/form-data">
								</c:when>
								<c:otherwise> <!-- 일반 메일 발송 -->
									<form action="insert.ma" id="mailForm" method="post" enctype="multipart/form-data">
								</c:otherwise>
							</c:choose>
						  
							<input type="hidden" name="sender" value="${ loginUser.email }"> 
						  	
							<c:choose>
								<c:when test="${ type eq 'relay' }">
									<input type="hidden" name="originMailNo" value="${ m.mailNo }">  <!-- 메일 전달시 원글의 메일번호가 담겨있음 -->
								</c:when>
								<c:when test="${ type eq 'out' }">
									<input type="hidden" name="mailNo" value="${ m.mailNo }"> <!-- 임시보관함에서 작성 페이지 요청 시 해당 메일번호 -->
								</c:when>
								<c:otherwise>
									<input type="hidden" name="mailNo"> <!-- 임시저장 성공시 해당 메일번호 담음. 임시저장 여부 구분 가능 -->
								</c:otherwise>
							</c:choose>
						   
							<input type="hidden" name="existFileNo" value="">
							<input type="hidden" name="originFile">
							<input type="hidden" name="deleteFileNo" value="">
		          	
							<!-- 상단 버튼 박스 시작 -->
							<div class="mail-btn-content" style="width: 420px;">
								<button type="button" class="mail-btn1">
									<ion-icon name="paper-plane-outline" style="margin-top: 8px; font-size: 17px;"></ion-icon>
									<span>&nbsp;&nbsp;보내기</span>
								</button>
								
								<button type="button" class="mail-btn2" onclick="saveMail();">
									<ion-icon name="cloud-download-outline" style="margin-top:8px; font-size: 19px;"></ion-icon>
									<span>&nbsp;&nbsp;임시저장</span>
								</button>
								
								<button type="button" class="mail-btn3" onclick="openPreview();">
									<ion-icon name="eye-outline" style="margin-top:5px; font-size: 23px;"></ion-icon>
									<span>&nbsp;&nbsp;미리보기</span>
								</button>
								 
								<button type="reset" class="mail-btn4">
									<ion-icon name="refresh-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
									<span>&nbsp;&nbsp;다시쓰기</span>
								</button>
							</div>
							<!-- 상단 버튼 박스 끝 -->
	
							<table class="mail-table-write">
								<tr>
									<th class="fixedCol1">
								    	받는 사람
										<c:choose>
											<c:when test="${ type eq 'reply' }"> <!-- 답장일 경우 -->
												<input type="text" name="receiver" id="receiver" value="${ m.sender }" hidden>
											</c:when>
											<c:when test="${ type eq 'out' }"> <!-- 임시보관함에서 작성 페이지 넘어온 경우 -->
												<input type="text" name="receiver" id="receiver" value="${ m.receiver }" hidden>
											</c:when>
											<c:otherwise>
												<input type="text" name="receiver" id="receiver" value="" hidden>
											</c:otherwise>
										</c:choose>
									</th>
									<td class="fixedCol2">
										<input type="checkbox" id="toMe" style="vertical-align:-8px;">
										<label for="toMe" style="font-size: 14px; margin-left: 3px; cursor:pointer;">나에게</label>
									</td>
									<td>
										<div class="mail-input-wrap">
											<div id="toAddrWrap" class="mail-input-div">
									 			<ul>
													<c:choose>
														<c:when test="${ type eq 'reply' }"> <!-- 답장일 경우 -->
															<li class="mail-addr-out to-li">
																<span class="addr-block">
													 				${ m.sender }
																</span>
																<span class="btn-addr-remove">
																	<ion-icon name="close-outline"></ion-icon>
																</span>
															</li>
														</c:when>
														<c:when test="${ type eq 'out' and not empty m.receiver}">  <!-- 임시보관함에서 작성 페이지 넘어온 경우 -->
															<c:forEach var="rec" items="${fn:split( m.receiver , ',')}">
																<li class="mail-addr-out to-li">
																	<span class="addr-block">
																 		${ rec }
																	</span>
																	<span class="btn-addr-remove">
																		<ion-icon name="close-outline"></ion-icon>
																	</span>
																</li>
															</c:forEach>
														</c:when>
													</c:choose>
									
													<!-- mail-addr-out 출력될 자리 -->
											
													<li class="mail-addr-create">
														<div class="addr_input">
															<textarea id="to" name="to" onkeyup="if(window.event.keyCode==13||window.event.keyCode==188){toBlock()}" style="display: inline; white-space: nowrap; width: 152px;" autocomplete="off"></textarea>
														</div>
													</li>
												</ul>
									    	</div>
									    	<select name="recent_address" class="select-recent-addr">
									      		<option disabled selected>최근 주소</option>
											</select>
										</div>  
									</td>
									<td class="fixedCol3">
										<button type="button" class="mail-btn-addressbook" id="addressbook">주소록</button>
									</td>
								</tr>
	
								<tr>
									<th>
										참조
										<c:choose>
											<c:when test="${ type eq 'out'}"> <!-- 임시보관함에서 작성 페이지 넘어온 경우 -->
												<input type="text" name="mailRef" id="mailRef" value="${ m.mailRef }" hidden>
											</c:when>
											<c:otherwise>
												<input type="text" name="mailRef" id="mailRef" value="" hidden>
											</c:otherwise>
										</c:choose>
									</th>
									<td></td>
									<td>
										<div class="mail-input-wrap">
											<div id="refAddrWrap" class="mail-input-div">
												<ul>
													<c:if test="${ type eq 'out' and not empty m.mailRef }">  <!-- 임시보관함에서 작성 페이지 넘어온 경우 -->
														<c:forEach var="ref" items="${fn:split( m.mailRef , ',')}">
															<li class="mail-addr-out ref-li">
																<span class="addr-block">
																	${ ref }
																</span>
																<span class="btn-addr-remove">
																	<ion-icon name="close-outline"></ion-icon>
																</span>
															</li>
														</c:forEach>
													</c:if>
													
													<!-- mail-addr-out 출력될 자리 -->
												
													<li class="mail-addr-create">
													  <div class="addr_input">
													    <textarea id="ref" name="ref" onkeyup="if(window.event.keyCode==13||window.event.keyCode==188){refBlock()}" style="display: inline; white-space: nowrap; width: 152px;" autocomplete="off"></textarea>
													  </div>
													</li>
												</ul>
											</div>
										</div>  
									</td>
									<td></td>
								</tr>
								
								<script>
									// 나에게 체크박스
									$("#toMe").change(function(){
										
										if($(this).is(':checked')){ // 체크 시
											
											// 주소 li요소로 추가
											let value="";
										      value +='<li class="mail-addr-out toMe to-li">'
										             + '<span class="addr-block">' 
										             + '${ loginUser.email }'
										             + '</span>'
										             + '<span class="btn-addr-remove">'
										             + '<ion-icon name="close-outline"></ion-icon>'
										             + '</span>'
										             + '</li>';
										
										      $("#toAddrWrap .mail-addr-create").before(value);
										  		
										      // input value에 주소값 추가
										      let currTo = $("#receiver").val();
										      if(currTo == ''){ // 처음 주소 추가 시
										      	$("#receiver").val("${ loginUser.email }");
										      }else{
										      	$("#receiver").val(currTo + "," + "${ loginUser.email }");
										      }
										      	
										}else{ // 체크 해제 시
											
											// 주소 li요소 삭제
											$(".toMe").remove();
											
											// input value에서 주소 삭제
										      let currToArr = $("#receiver").val().split(",");
										      
										    	currToArr.splice(currToArr.indexOf("${ loginUser.email }"), 1);
										      
										    	$("#receiver").val(currToArr.join());
										}
										
										toLimit();
										
									})
									
									// enter , (받는사람)
									function toBlock() {
									
									  	if(window.event.keyCode==13){
									  		var $addr = $("#to").val().replace("\n", "");
									  	}else if(window.event.keyCode==188){
									    	var $addr = $("#to").val().replace(/,$/, "");
									    }
									  	
											if(!addrCheck($addr)){ // 유효성 검사 결과 false일 경우
												$("#to").val("");
												return;
											}
									  
									  	// 주소 li요소로 추가
									    let value = "";
									    value +='<li class="mail-addr-out to-li">'
									          + '<span class="addr-block">' 
									          + $addr
									          + '</span>'
									          + '<span class="btn-addr-remove">'
									          + '<ion-icon name="close-outline"></ion-icon>'
									          + '</span>'
									          + '</li>';
									    
									    $("#to").val("");
									    $("#toAddrWrap .mail-addr-create").before(value);
									    
									  	
											if($addr == "${ loginUser.email }"){ // 내 주소를 입력시 나에게 체크박스 체크
												$("#toMe").prop("checked", true);
											}
									
											// input value에 입력한 주소 추가
									  	let currTo = $("#receiver").val();
									  	if(currTo == ''){ // 처음 주소 추가 시
									  		$("#receiver").val($addr);
									  	}else{
									  		$("#receiver").val(currTo + "," + $addr);
									  	}
									  	
									  	toLimit();
									  	
									}
									
									// enter , (참조)
									function refBlock() {
														  	  
									    if(window.event.keyCode==13){
									      var $addr = $("#ref").val().replace("\n", "");
									    }else if(window.event.keyCode==188){
									      var $addr = $("#ref").val().replace(/,$/, '');
									    }
									
										if(!addrCheck($addr)){ // 유효성 검사 결과 false일 경우
											$("#ref").val("");
											return;
										}
										
									  	// 주소 li요소로 추가
									    let value = "";
									    value +='<li class="mail-addr-out ref-li">'
									          + '<span class="addr-block">' 
									          + $addr
									          + '</span>'
									          + '<span class="btn-addr-remove">'
									          + '<ion-icon name="close-outline"></ion-icon>'
									          + '</span>'
									          + '</li>';
									    
									    $("#ref").val("");
									    $("#refAddrWrap .mail-addr-create").before(value);
									    
										// input value에 입력한 주소 추가
									  let currRef = $("#mailRef").val();
									  if(currRef == ''){ // 처음 주소 추가 시
									  	$("#mailRef").val($addr);
									  }else{
									  	$("#mailRef").val(currRef + "," + $addr);
									  }
									  
									  refLimit();
										       
									}
									
									// 주소 개별 삭제 (받는사람)
									$(document).on("click", "#toAddrWrap ion-icon", function(){
									    
										$(this).parent().parent().remove();
									  	
									  	// 현재 받는사람 input value값 => 배열
									    let currToArr = $("#receiver").val().split(","); // ["aaa.com", "bbb.com", "ccc.com"]
									    
									    // 삭제할 요소의 text값에서 엔터 제거
									  	let deleteTo = $(this).parent().prev().text().replace("\n", ""); // "bbb.com"
									  	
									  	currToArr.splice(currToArr.indexOf(deleteTo), 1);
									     
											if(deleteTo == "${loginUser.email}"){ // 내 주소를 버튼으로 삭제시 나에게 체크박스 해제
												$("#toMe").prop("checked", false);
											}
									  	
									  	$("#receiver").val(currToArr.join()); // "aaa.com, ccc.com"
									  	
									  	toLimit();
									
									})
									
									// 주소 개별 삭제 (참조)
									$(document).on("click", "#refAddrWrap ion-icon", function(){
									    
										$(this).parent().parent().remove();
									 	
									  	// 현재 참조 input value값 => 배열
									    let currRefArr = $("#mailRef").val().split(",");
									    
									    // 삭제할 요소의 text값에서 엔터 제거
									  	let deleteRef = $(this).parent().prev().text().replace("\n", "");
									  	
									  	currRefArr.splice(currRefArr.indexOf(deleteRef), 1);
									    
									  	$("#mailRef").val(currRefArr.join());
									  	
									  	refLimit();
									  	
									})
									
									// 주소 유효성 검사
									function addrCheck($addr){
										
									    let regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
									    
									    if(regExp.test($addr)){
									    	return true;
									    }else{
									    	console.log("유효성 검사 실패");
									    	toast("잘못된 주소 형식입니다.");
									    	return false;
									    }
									   
									}
									
									// 받는 사람 최대 인원 제한
									function toLimit(){
									  	if(document.querySelectorAll('.to-li').length > 4){
									  		$("#to").attr("readonly", true);
									  		toast("최대 5명까지 발송 가능합니다.");
									  	}else{
									  		$("#to").attr("readonly", false);
									  	}
									}
									
									// 참조 최대 인원 제한
									function refLimit(){
									  	if(document.querySelectorAll('.ref-li').length > 4){
									  		$("#ref").attr("readonly", true);
									  		toast("최대 5명까지 참조 가능합니다.");
									  	}else{
									  		$("#ref").attr("readonly", false);
									  	}
									}
									
								  
									// 쿠키에서 최근주소 불러오기
									$(function(){
										
										let emailArr = [];
										
										// document.cookie => "사번=이메일_이메일; key=value; key=value; key=value" (모든 쿠키)
										
										let cookieStrArr = document.cookie.split("; "); // ["사번=이메일_이메일_이메일", "사번=이메일_이메일", "key=value"];
										
										for(let i in cookieStrArr){
											let cookie = cookieStrArr[i].split("="); // ["사번", "이메일_이메일"]
											
											if(cookie[0] == "${loginUser.userNo}"){ // 키값(사번)이 로그인한 사원의 사번과 동일한 경우
												emailArr = cookie[1].split("_");
											}
										}
										
										// 배열 순서를 뒤집어서 최근 주소부터 정렬
										let recentAddr = emailArr.reverse(); // ["이메일", "이메일"]
										
										// 최대 10개까지 출력
										value = "";
										for(let i=0; i<recentAddr.length; i++){
											
											if(i < 10){
												value += '<option value="' + recentAddr[i] + '">' + recentAddr[i] + '</option>';
											}
										
										}
										$("select[name=recent_address]").append(value);
										
										// 최근 주소에서 옵션 선택 시 받는사람에 추가
										$(document).on("change", "select[name=recent_address]", function(){
											
											if( $("#receiver").val().indexOf($(this).val()) == -1 ){
												
											// 주소 li요소로 추가
												let value="";
									          value +='<li class="mail-addr-out toMe to-li">'
									                 +	'<span class="addr-block">' 
									                 + 		$(this).val()
									                 + 	'</span>'
									                 + 	'<span class="btn-addr-remove">'
									                 + 		'<ion-icon name="close-outline"></ion-icon>'
									                 + 	'</span>'
									                 +'</li>';
									                 
									          $("#toAddrWrap .mail-addr-create").before(value);
									
									          // input value에 주소값 추가
									            let currTo = $("#receiver").val();
									            if(currTo == ''){ // 처음 주소 추가 시
									            	$("#receiver").val($(this).val());
									            }else{
									            	$("#receiver").val(currTo + "," + $(this).val());
									            }
												
											}else{
												toast("이미 추가되어 있는 주소입니다.");
											}
											
											// 다시 "최근주소" 옵션이 선택 되어 있도록 변경
											$("select[name=recent_address] option:eq(0)"). prop("selected", true);
											
										})
										
									})
								</script>
	                    
								<tr>
									<th>제목</th>
									<td></td>
									<td>
										<c:choose>
											<c:when test="${ type eq 'reply' }">
												<input type="text" name="mailTitle" value="Re : ${ m.mailTitle }" style="width: 100%;">
											</c:when>
											<c:when test="${ type eq 'relay' }">
												<input type="text" name="mailTitle" value="Fwd : ${ m.mailTitle }" style="width: 100%;">
											</c:when>
											<c:when test="${ type eq 'out' }">
												<input type="text" name="mailTitle" value="${ m.mailTitle }" style="width: 100%;">
											</c:when>
											<c:otherwise>
												<input type="text" name="mailTitle" style="width: 100%;" value="">
											</c:otherwise>
										</c:choose>
									</td>
									<td></td>
								</tr>
								
								<tr>
									<th>파일첨부
									</th>
									<td style="margin-right: 5px;" id="td-filebtn">
										<ion-icon id="btn-filebox" name="caret-up-circle-outline"></ion-icon>
									</td>
									<td style="text-align: left;">
										<button type="button" class="mail-btn-file" onclick="chooseFile();">파일첨부</button>
										<button type="button" class="mail-btn-file" onclick="fileReset();">전체삭제</button>
										<input type="file" name="upfile" onchange="addFile();" maxlength="5" multiple hidden>
									</td>
									<td></td>
								</tr>
								<tr style="height: 90px;" id="tr-filebox">
									<td></td>
									<td></td>
									<td>
										<div class="mail-filebox open" id="dropZone">
											<a class="file-empty" >
												<i class="material-icons-sharp" style="font-size: 16px; vertical-align: -3px;">
													attach_file
												</i>
												여기에 첨부파일을 끌어오세요. 또는 <b onclick="chooseFile();"><u>파일 선택</u></b>
												<span class="help" onmouseover="over();" onmouseout="out();">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#888" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-help-circle"><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="17" x2="12" y2="17"></line></svg>
													<span class="tool-tip top" style="width: 210px; height: 35px;">
														첨부파일은 최대 10개 등록 가능합니다.
													</span>
													<script>
													   function over(){
													       $(".tool-tip").css("display", "inline-block");
													   }
													
													   function out(){
													       $(".tool-tip").css("display", "none");
													   }
													</script>
												</span>
											</a>
											
											<!-- 전달로 넘어온 첨부파일 있는 경우 -->
											<c:if test="${ not empty relayAtList }">
												<c:forEach var="at" items="${ relayAtList }" varStatus="i">
													<div class="old-each-file">
														<input type="hidden" name="relayFileNo" value="${ at.fileNo }">
														<span class="btn-file-remove"><ion-icon name="close-outline" index="${ i.index }" class="old"></ion-icon></span>
														<span>${ at.originName }</span>
													</div>
												</c:forEach>
												
												<script>
												  	$(function(){
												          $(".file-empty").css("display", "none");
												          
												    	// 원글의 첨부파일 리스트
												    	const arr = document.getElementsByName('relayFileNo');
												
												    	let existFileNo = "";
												    	for(var i=0; i<arr.length; i++){
												    		existFileNo += arr[i].value + ",";
												    	}
												    	existFileNo = existFileNo.substring(0,existFileNo.lastIndexOf(",")); 
												    	$("input[name=existFileNo]").val(existFileNo);
												    	
												  	})
												</script>
											</c:if>
										</div>
									</td>
									<td></td>
								</tr>
								  
								<script>
									let fileArr = [];
									
									function chooseFile(){
									    $("input[name=upfile]").click();
									}
									
									// 파일첨부 박스 접었다 폈다 기능
									$(document).on("click", "#btn-filebox", function(){
										
									    if($(".mail-filebox").hasClass("open")){
									  	  
									        $(".mail-filebox").addClass("hide").removeClass("open");
									        $("#tr-filebox").css("height", "3px");
									        
									        $("#td-filebtn").empty();
									        $("#td-filebtn").append('<ion-icon id="btn-filebox" name="caret-down-circle-outline"></ion-icon>');
									        
									    }else if($(".mail-filebox").hasClass("hide")){
									      	
									        $(".mail-filebox").addClass("open").removeClass("hide");
									     	  
									        $("#td-filebtn").empty();
									        $("#td-filebtn").append('<ion-icon id="btn-filebox" name="caret-up-circle-outline"></ion-icon>');
									        
									    }
									    
									})
									
									// mail-filebox div에 첨부한 파일 리스트 추가
									function selectFileList(obj){
									    
									    let value = "";
									    for(var i=0; i<obj.files.length; i++){
									      
									      value += '<div class="each-file">'
									             + 	'<span class="btn-file-remove"><ion-icon name="close-outline" index="' + i + '" class="new"></ion-icon></span>'
									             + 	'<span>' + obj.files[i].name + '</span>'
									             + '</div>';
									
									    }
									                        
									   	$(".file-empty").css("display", "none");
									   	$(".mail-filebox").append(value);
									   	
									}
									
									// 파일 추가
									function addFile(){
										
									  	let maxFile = 10; // 첨부파일 최대 개수
									  	let attFile = document.querySelectorAll('.each-file').length; // 기존 추가된 첨부파일 개수
									  	let remainFile = maxFile - attFile; // 추가로 첨부가능한 개수
										let files = $("input[name=upfile]")[0].files;  // FileList (현재 선택된 첨부파일)
									
									    if(files.length > remainFile){
									        toast("첨부파일은 최대 " + maxFile + "개 까지 첨부 가능합니다.");
									        settingFile();
									    }else{
									        let currFileArr = Array.from(files);
									    	
									     	// 최초로 파일첨부를 눌렀을 경우 & 다 삭제 되었을 경우
									        fileArr = (fileArr.length == 0) ? currFileArr : fileArr.concat(currFileArr);
									
									    	settingFile();
									
									        $(".each-file").remove();
									    	selectFileList(document.querySelector("input[name=upfile]"));
									    }
									    
									}
									  
									// 새로 첨부한 파일 리스트에서 파일 개별 삭제
									$(document).on("click", ".btn-file-remove>ion-icon.new", function(){
										
									    $(this).parent().parent().remove();
									      
									    let files = $("input[name=upfile]")[0].files;  // FileList
									    fileArr = Array.from(files); // FileList => Array
									    
									    fileArr.splice($(this).attr("index"), 1);
									    
									    settingFile();
									    
									    //if(fileArr.length == 0){ //=> 이렇게 하면 메일 전달 기능 시에 문제 생김
									    if($(".btn-file-remove").length == 0){
									        $(".each-file").remove();
									    	$(".file-empty").css("display", "block");
									    }else{
									        $(".each-file").remove();
									       selectFileList(document.querySelector("input[name=upfile]"));				            	
									    }
									    
									})
									
									let deleteFileNo = "";		                
									// 전달,임시보관으로 이미 첨부되어 있던 파일 리스트에서 파일 개별 삭제
									$(document).on("click", ".btn-file-remove>ion-icon.old", function(){
										
										$(this).parent().parent().remove();
										
										// 삭제되지 않고 남아 있는 첨부파일 번호 담기 (전달메일 보내기 시 사용)
										const arr = document.getElementsByName('relayFileNo');
									
										let existFileNo = "";
										for(var i=0; i<arr.length; i++){
											existFileNo += arr[i].value + ",";
										}
										existFileNo = existFileNo.substring(0,existFileNo.lastIndexOf(",")); 
										
										// 삭제된 첨부파일 번호 담기 (임시보관메일 보내기 시 사용)
										deleteFileNo += $(this).parent().prev().val() + ",";
										
										$("input[name=existFileNo]").val(existFileNo);
										$("input[name=deleteFileNo]").val(deleteFileNo);
										
										if($(".btn-file-remove").length == 0){
									    	 $(".file-empty").css("display", "block");
									    }
											
									})
									
									
									// 파일 전체 삭제
									function fileReset(){
										
									    $("input[name=upfile]").val('');
									    fileArr = [];
									    $("input[name=existFileNo]").val('');
									    
									    $(".each-file").remove();
									    $(".old-each-file").remove();
									    
										$(".file-empty").css("display", "block");
										
									}
								  
									// 파일 드래그 앤 드랍
									$(function(){
										
										$("#dropZone").on("dragenter", function(e){
										    e.preventDefault();
										    e.stopPropagation();
										}).on("dragover", function(e){
										    e.preventDefault();
										    e.stopPropagation();
										    $(this).css("background-color", "#ddd");
										}).on("dragleave", function(e){
										    e.preventDefault();
										    e.stopPropagation();
										    $(this).css("background-color", "white");
										}).on('drop', function(e){
											e.preventDefault();
											$(this).css("background-color", "white");
										
											// 드랍된 파일을 뽑아서 담아주기
											var dropFiles = e.originalEvent.dataTransfer.files;
											
											// input file value를 드랍된 파일로 변경
											$("input[name=upfile]")[0].files = dropFiles;
											
											let maxFile = 10; // 첨부파일 최대 개수
											let attFile = document.querySelectorAll('.each-file').length; // 기존 추가된 첨부파일 개수
											let remainFile = maxFile - attFile; // 추가로 첨부가능한 개수
											let files = $("input[name=upfile]")[0].files;  // FileList (현재 선택된 첨부파일)
											
											if(files.length > remainFile){
											    toast("첨부파일은 최대 " + maxFile + "개 까지 첨부 가능합니다.");
											    settingFile();
											}else{
											    let currFileArr = Array.from(files);
												
											 	// 최초로 파일첨부를 눌렀을 경우 & 다 삭제 되었을 경우
											    fileArr = (fileArr.length == 0) ? currFileArr : fileArr.concat(currFileArr);
											    
												settingFile();
											 		$(".each-file").remove();
											 		
												// 바뀐 파일을 li로 다시 뽑아주기
												selectFileList(document.querySelector("input[name=upfile]"));
											}
									      	
										})
										
									})
								      
									function settingFile(){
										
										const dataTransfer = new DataTransfer();
									    fileArr.forEach(function(file){
									    	  dataTransfer.items.add(file);
									    })
										$("input[name=upfile]")[0].files = dataTransfer.files;
									    
									}
								
								</script>
	
								<tr>
									<td colspan="3" style="padding-top: 20px; text-align: initial;">
									    <c:choose>
										    <c:when test="${ type eq 'relay' or type eq 'out' }">
										    	<textarea name="mailContent" id="summernote" rows="10" style="resize: none;">${ m.mailContent }</textarea>
										    </c:when>
										    <c:otherwise>
										    	<textarea name="mailContent" id="summernote" rows="10" style="resize: none;"></textarea>
										    </c:otherwise>
									    </c:choose>
									</td>
									<td></td>
								</tr>
							</table>
							<br>
	                  
							<!-- 모달: 발송 confirm -->
							<div class="modal" id="jyModal_confirm">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
									<!-- Modal Header -->
										<div class="modal-header">
										    <button type="button" class="modal_close" data-dismiss="modal" style="margin-left: 95%;">&times;</button>
										</div>
										<!-- Modal body -->
										<div class="modal-body" style="text-align: center;">
											메일을 발송하시겠습니까?
										</div>
										<!-- Modal footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-jyok">확인</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 모달 끝 -->
		   			
							<!-- 토스트 메시지 div -->
							<div id="toast">
							</div>
					
							<script>
							
								// 보내기 버튼 클릭
								$(".mail-btn1").click(function(){
									if(document.querySelectorAll('.to-li').length == 0){
										toast("받는 사람 메일 주소를 입력해 주세요.");
									}else if($("input[name=mailTitle]").val() == ''){
										toast("제목을 입력해 주세요.");
									}else{
										$('#jyModal_confirm').modal('show');
									} 
								})
							
								// 메일 임시저장
								function saveMail(){
									
									if($("input[name=mailTitle]").val() == ''){
										toast("제목을 입력해 주세요.");
										return;
									}
									
									let formData = new FormData(document.getElementById("mailForm"));
									
									$.ajax({
										url: "save.ma",
									 	processData: false,
									 	contentType: false,
										type: "POST",
									 	data: formData,
										success:function(data){
											if(data.result > 0){
												toast("메일을 임시보관함에 저장하였습니다.");
												$("input[name=mailNo]").val(data.mailNo);
											}else{
												toast("메일 임시보관에 실패하였습니다.");
											}
											console.log("메일 임시저장 ajax통신 성공");
										},
										error:function(){
											console.log("메일 임시저장 ajax통신 실패");
										}
									})
									
								}
								
								// 미리보기 버튼 클릭
								function openPreview(){
									 
									window.open("", "popupOpener", "width=900, height=800, top=100, left=400");
							
									$("#mailForm").attr("target", "popupOpener");
									$('#mailForm').attr('action', 'enrollPreview.ma');
									$('#mailForm').submit();
									
								}
								
								// 다시쓰기 버튼 클릭
								$(".mail-btn4").click(function(){
									$("#summernote").summernote("code", "");
									$("#receiver").val("");
									$("#ref").val("");
									
									$(".to-li").remove();
									$(".ref-li").remove();
								})
							
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
						    
							</form>
						</div>
						<!-- 메일 내용 끝 -->
	            
						<script>
						    // summernote
						    $(document).ready(function() {
						      $('#summernote').summernote({
						        minHeight: 390,  // 최소 높이
						        maxHeight: 800,  // 최대 높이
						        focus: false,    // 에디터 로딩후 포커스를 맞출지 여부
						        lang: "ko-KR",   // 한글 설정
						        tabsize: 2,
						        height: 120,
						        toolbar: [
						        ['fontsize', ['fontsize']],
						        ['style', ['style']],
						        ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
						        ['color', ['color']],
						        ['para', ['ul', 'ol', 'paragraph']],
						        ['table', ['table']],
						        ['view', ['fullscreen', 'codeview', 'help']]
						        ],
						        disableDragAndDrop: true
						    	});
						    });
						    
						</script>
	            
					</div>
					<!-- 메일 전체 div 끝 -->
				</div>
			</div>
		</div>
		
		<jsp:include page="addressbook.jsp" />
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>