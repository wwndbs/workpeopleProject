<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>

</style>
</head>
<body>
	
    <!-- 메일 사이드바 시작 -->
    <div class="mail-sidebar">
		
    	<div class="sidebar1">
	        <h5>메일</h5>
	        <div class="div">
	       		<button type="button" class="mail-btn-enroll" onclick="location.href='enrollForm.ma'">메일 쓰기</button>
	        </div>
      	</div>

        <div class="sidebar2">
        	<h5>메일함</h5>
            <ul class="mailbox-list">
            	<li><a href="box.ma">받은메일함</a></li>
	            <li><span><a href="box.ma?boxType=2">보낸메일함</a></span>
	            <!-- <span><button class="mail-btn-sidebar">수신확인</button><br></span></li> -->
	            <li><a href="box.ma?boxType=3">내게쓴메일함</a></li>
	            <li><a href="outbox.ma?">임시보관함</a></li>
	            <br>
	            <li><span><a href="box.ma?boxType=4">스팸메일함</a></span>
	            <!-- <span><button class="mail-btn-sidebar">비우기</button><br></span></li>  -->
	            <li><span><a href="box.ma?boxType=5">휴지통</a></span>
	            <span><button class="mail-btn-sidebar" data-toggle="modal" data-target="#jyModal_vacate_confirm">비우기</button><br></span></li>
	            <br>
	            <li><a href="box.ma?boxType=6">중요메일함</a></li>
	            <li><a href="box.ma?boxType=7">안읽은메일함</a></li>
        	</ul>
        </div>
        
		<div class="sidebar3">
       		<h5>태그</h5>
        	<ul class="tag-list">
        		<div id="tagArea">

	           </div>	
    	       <a href="" class="add" data-toggle="modal" data-target="#jyModal_insertTag"> + &nbsp;태그 추가</a>
        	</ul>
       	</div>
       
        <script>
        	$(function(){
        		
        		// 사이드바, 페이지 내 상단 버튼 태그 리스트 조회
        		$.ajax({
          			url: "selectTag.ma",
          			success:function(list){
   	  					
       					let value = "";
       					let dropvalue = "";
       
       					for(let i=0; i<list.length; i++){
       						value += '<li>'
       							   + 	'<span>'
       							   +		'<input type="hidden" name="tagNo" value="' + list[i].tagNo + '">'
       							   +		'<i class="fas fa-tag" style="color:' + list[i].tagColor + ';"></i>'
	  							   +		'<a href="">' + list[i].tagName + '</a>'
	  							   +	'</span>'
	  							   +	'<button type="button" class="dropdown">'
	  							   +		'<ion-icon name="ellipsis-vertical-outline"></ion-icon>'
	  							   +		'<div class="dropdown-tagEtc">'
	  							   +			'<span class="tag-update" data-toggle="modal" data-target="#jyModal_updateTag">태그 수정</span><br>'
	  							   +			'<span class="tag-delete" data-toggle="modal" data-target="#jyModal_deleteTag">태그 삭제</span>'
	  							   +		'</div>'
	  							   +	'</button>'
	  							   + '</li>';
	  							   
       						dropvalue += '<tr id="tag' + list[i].tagNo +  '">'
	   								   +	'<td>'
	   								   +		'<i class="fas fa-tag" style="color:' + list[i].tagColor + ';"></i>'
	   								   +		'<span class="tagName">' + list[i].tagName + '</span>'
	   								   +	'</td>'
	   								   +	'<td class="addBtn">'
	   								   + 		'<input type="hidden" name="tagNo" value="' + list[i].tagNo + '">'
	   								   +		'<a class="mail-a-taglist tagBtn">적용</a>'
	   								   +	'</td>'
									   + '</tr>';
       					}
       					
       					$("#tagArea").html(value); // 사이드바 태그
           				$("#tagDropArea").html(dropvalue); // 상단 버튼 드롭다운 태그
           				
          			},
          			error:function(){
	  				console.log("태그리스트 조회 ajax통신 실패");
          			}
        		})        	
        		
        		// 휴지통 비우기 버튼 클릭
        		$("#realVacate").click(function(){
        			
            		$.ajax({
            			url: "vacateTrashbox.ma",
            			success:function(result){

            				if(result == "success"){
            					toast("삭제되었습니다.");
            					setTimeout(reload, 1000);
							}
							
            			},
            			error:function(){
							console.log("휴지통 비우기 ajax통신 실패");
            			}
            		})
            		
        		})
        		
        	})
        </script>
      
        <br><br><br>
       
        <div class="sidebar4">
        	<ion-icon name="settings-outline" style="vertical-align: -3px;"></ion-icon>
          	<a href="" style="margin-left: 5px;">
            	메일 환경설정
          	</a>
        </div>

    </div>
    <!-- 메일 사이드바 끝 -->
   
    <!-- 모달: 휴지통 비우기 컨펌 -->
    <div class="modal" id="jyModal_vacate_confirm">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="modal_close" data-dismiss="modal" style="margin-left: 95%;">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body" style="text-align: center;">
                    휴지통을 비우면 메일이 완전히 삭제됩니다. <br>
			        휴지통을 비우시겠습니까?
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-jyok" id="realVacate">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 모달 끝 -->
   
    <!-- 모달: 태그 추가 -->
    <div class="modal tagModal" id="jyModal_insertTag">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h6 class="modal-title">태그 추가</h6>
                <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <p>새 태그 이름을 입력하세요.</p>
                <input type="text" name="tagName">
                <br><br>
                <p>태그 색상을 선택하세요.</p>
                <div class="pallete-wrap">
                   <a class="color-1">#fa573c</a>
                   <a class="color-2">#ffad46</a>
                   <a class="color-3">#fbe983</a>
                   <a class="color-4">#7bd148</a>
                   <a class="color-5">#6691e5</a>
                   <a class="color-6">#b99aff</a>
                   <a class="color-7">#f691b2</a>
                   <a class="color-8">#905341</a>
                </div>
              </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-jyok" id="insertTagBtn" data-dismiss="modal">확인</button>
            </div>
         </div>
      </div>
    </div>
    <!-- 모달 끝 -->
    
    <!-- 모달: 태그 수정 -->
    <div class="modal tagModal" id="jyModal_updateTag">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h6 class="modal-title">태그 수정</h6>
                <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <p>태그 이름을 수정하세요.</p>
                <input type="text" name="tagName">
                <br><br>
                <p>태그 색상을 선택하세요.</p>
                <div class="pallete-wrap">
                   <a class="color-1">rgb(250, 87, 60)</a>
                   <a class="color-2">rgb(255, 173, 70)</a>
                   <a class="color-3">rgb(251, 233, 131)</a>
                   <a class="color-4">rgb(123, 209, 72)</a>
                   <a class="color-5">rgb(102, 145, 229)</a>
                   <a class="color-6">rgb(185, 154, 255)</a>
                   <a class="color-7">rgb(246, 145, 178)</a>
                   <a class="color-8">rgb(144, 83, 20)</a>
                </div>
              </div>
            <!-- Modal footer -->
            <div class="modal-footer">
            	<input type="hidden" name="tagNo" value="">
                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-jyok" id="updateTagBtn" data-dismiss="modal">확인</button>
            </div>
         </div>
      </div>
    </div>
    <!-- 모달 끝 -->
    
	<!-- 모달: 태그 삭제 -->
    <div class="modal" id="jyModal_deleteTag">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="modal_close" data-dismiss="modal" style="margin-left: 95%;">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body" style="text-align: center;">
                    <p>태그를 삭제하시겠습니까?</p>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                	<button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
                	<button type="button" class="btn btn-jyok" id="deleteTagBtn" data-dismiss="modal">확인</button>
                	<input type="hidden" name="tagNo">
                </div>
            </div>
        </div>
    </div>
    <!-- 모달 끝 -->
    
	<script>
		let tagColor = '';
		
		// 태그 추가/수정 modal 속 색상팔레트 클릭 시
		$(document).on("click", ".pallete-wrap>a", function(){
			$(this).siblings().removeClass("active");
			$(this).addClass("active");
			
			tagColor = $(this).text();
		})
	
		// 태그 추가 요청
		$(document).on("click", "#insertTagBtn", function(){
			
			$.ajax({
    			url: "insertTag.ma",
    			data: {
    				tagName:$("#jyModal_insertTag input[name=tagName]").val(),
    				tagColor:tagColor
    			},
    			success:function(result){
    				if(result == 'success'){
        				toast("태그 추가 성공하였습니다.");
        				setTimeout(reload, 1000);
    				}else{
    					toast("태그 추가 실패하였습니다.");
    				}
    			},
    			error:function(){
					console.log("태그 추가 ajax통신 실패");
    			}
    		})
    		
		})
		
		// 태그 수정 버튼 클릭 시 modal에 원래 값 넣어 주기
		$(document).on("click", ".tag-update", function(){
			
			// 태그 리스트에서 조회해온 원래 값
			let tagNo = $(this).parent().parent().prev().children().eq(0).val();
			let tagName = $(this).parent().parent().prev().children().eq(2).text();
			tagColor = $(this).parent().parent().prev().children().eq(1).css("color");
			
			// modal에 값 넣어 주기
			$("#jyModal_updateTag input[name=tagNo]").val(tagNo);
			$("#jyModal_updateTag input[name=tagName]").val(tagName);
			
			// 원래 값과 동일한 색상박스를 기초값으로 설정
			let pallete = document.querySelectorAll("#jyModal_updateTag a[class|='color']");
			
			pallete.forEach(function(color){
				if(color.text == tagColor){
					color.classList.add("active");
				}else{
					color.classList.remove("active");
				}
			});
			
		})
		
		// 태그 수정 요청
		$(document).on("click", "#updateTagBtn", function(){
		
			$.ajax({
    			url: "updateTag.ma",
    			data: {
    				tagNo:$(this).prev().prev().val(),
    				tagName:$("#jyModal_updateTag input[name=tagName]").val(),
    				tagColor:tagColor
    			},
    			success:function(result){
    				if(result == 'success'){
        				toast("태그 수정 성공하였습니다.");
        				setTimeout(reload, 1000);
    				}else{
    					toast("태그 수정 실패하였습니다.");
    				}
    			},
    			error:function(){
					console.log("태그 수정 ajax통신 실패");
    			}
    		})

		})
				
		// 태그 삭제 버튼 클릭 시 modal에 tagNo 넣어 주기
		$(document).on("click", ".tag-delete", function(){
			
			let tagNo = $(this).parent().parent().prev().children().eq(0).val();
			$("#jyModal_deleteTag input[name=tagNo]").val(tagNo);
			
		})
		
		// 태그 삭제 요청
		$(document).on("click", "#deleteTagBtn", function(){
			console.log($(this).next().val());
			$.ajax({
    			url: "deleteTag.ma",
    			data: {
    				tagNo:$(this).next().val(),
    			},
    			success:function(result){
    				if(result == 'success'){
    					console.log("성공");
        				toast("태그 삭제 성공하였습니다.");
        				setTimeout(reload, 1000);
    				}else{
    					console.log("실패");
    					toast("태그 삭제 실패하였습니다.");
    				}
    			},
    			error:function(){
					console.log("태그 삭제 ajax통신 실패");
    			}
    		})

		})
		
					            	
	    // 페이지 재요청
		function reload(){
			location.reload();
		}
		</script>    

</body>
</html>