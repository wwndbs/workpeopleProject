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
</head>
<style>
	.board-content .content-title{
    border-bottom: 2px solid lightgray;
    padding-bottom: 7px;
}

.board-content .enrollForm{
    padding: 0 12px;
}

.board-content .enrollForm table{
    font-size: 13px;
    margin: 8px 0;
    width: 100%;
    border-collapse: collapse;
}

.board-content .enrollForm table tbody tr th{
    padding: 4px 5px;
    height: 26px;
    width: 140px;
    text-align: left;
    vertical-align: top;
    font-weight: normal;
}

.board-content .form-type th .title, .board-content .form-type th .txt{
    display: inline-block;
    margin: 0;
    font-weight: normal;
    padding-top: 3px;
    margin-left: 20px;
}

.enrollForm .form-type tbody td{
    padding: 4px 24px 4px 0;
}

.enrollForm .txt{
    padding: 0 8px;
    height: 26px;
}

.enrollForm .txt, .enrollForm textarea{
    border: 1px solid #ddd;
    border-radius: 2px;
    box-sizing: border-box;
    width: 99%;
}

.enrollForm .help{
    display: inline-block;
    position: relative;
    width: 16px;
    height: 16px;
    margin-left: 1px;
    cursor: pointer;
    vertical-align: middle;
    line-height: 1;
    z-index: 1;
}

.enrollForm .help svg{
    width: 100%;
    height: 100%;
}

.enrollForm .help>span{
    z-index: 3;
    display: none;
    font-size: 12px;
    background-color: rgb(24, 23, 23);
    color: white;
    border-radius: 3px;
    padding: 13px;
}

.enrollForm .attach{
    position: relative;
    overflow-y: auto;
    padding: 8px 0;
    border: 2px dashed #ddd;
    box-sizing: border-box;
    max-height: 300px;
    font-size: 13px;
    width: 99%;
}

.enrollForm .attach .area-txt{
    padding: 8px 0;
    text-align: center;
}

.enrollForm .area-txt .ic-attach{
    width: 18px;
    height: 18px;
    background-position: -50px 0;
    margin: 0 5px 0 0;
    vertical-align: middle;
    display: inline-block;
}

.enrollForm .ic-attach svg{
    width: 100%;
    height: 100%;
}

.enrollForm .area-txt .msg{
    display: inline-block;
    color: #999;
    letter-spacing: -1px;
    font-size: 13px;
}

.enrollForm .msg .btn-file{
    position: relative;
    display: inline-block;
    width: 48px;
    cursor: pointer;
    text-align: left;
    overflow: hidden;
    vertical-align: middle;
    margin: -4px 0 0 2px;
}

.enrollForm .msg .file-txt{
    display: inline-block;
    color: #666;
    cursor: pointer;
    text-decoration: underline;
    line-height: 1.5;
    padding: 3px 0;
}

.enrollForm .btn-file input[type="file"]{
    display: inline-block;
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    cursor: pointer;
}

.enrollForm .btn-file .size{
    margin: 0;
    color: #999;
}

.board-content .enrollForm .file-wrap, .board-content .enrollForm .img-wrap{
    list-style-type: none !important;
}

.board-content .enrollForm .img-wrap{
    margin: 0 16px;
}

.board-content .enrollForm .line hr{
    margin: 0;
    border: none;
    border-bottom: 1px solid #ebebeb;
    height: 1px;
}

.board-content .enrollForm .editor{
    position: relative;
    margin: 20px 0;
    width: 100%;
}

.board-content .enrollForm .editor .btn{
    position: absolute;
    right: 0;
    top: -20px;
}

.board-content .enrollForm .go-editor{
    width: 100%;
    height: 450px;
    padding-bottom: 10px;
    overflow: visible;
    line-height: 0;
}

.sub-btn{
	text-align: center;
	margin-top: 30px;
	padding-botton: 20px;
}

.board-content .enrollForm .chkNotice{
	display: inline-block;
	float: right;
	line-height: 30px;
}

.board-content .chkNotice span{
	display: inline-block;
	font-size: 8px;
}
</style>
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
              	
              	
              		<div class="board-content" style="width:80%; height:120%">
                      
                      <br>
      
                      <div class="content-title">
                          <h5>${ boardType } 게시판 글쓰기</h5>
                      </div>
      
                      <br>

                      <form action="insert.bo" method="post" id="enrollForm" class="enrollForm" enctype="multipart/form-data">
                        <fieldset>
                            <table class="form-type">
                                <colgroup>
                                    <col width="130px">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                	<input type="hidden" name="boardNo">
                                	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
                                	<input type="hidden" name="boardType" value="${ typeNo }">
                                	<input type="hidden" name="depName" value="${ loginUser.depName }">
                                    <tr>
                                        <th>
                                            <span class="title">제목</span>
                                            <c:if test="${ typeNo eq 2 and (loginUser.jobName eq '부장' or loginUser.jobName eq '팀장') }">
	                                            <span class="chkNotice">
	                                            	<input type="checkbox" id="chkButton" name="topExp" value="Y">
	                                            	<span>공지로 등록</span>
	                                            </span>
                                            </c:if>
                                        </th>
                                        <td>
                                            <input type="text" class="txt" name="boardTitle" required>
                                        </td>
                                    </tr>
                                    <tr id="attachPart">
                                        <th>
                                            <span class="title">파일 첨부</span>
                                            <span class="help" onmouseover="over();" onmouseout="out();">
                                                <!-- <i data-feather="help-circle" stroke="#888"></i>  -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#888" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-help-circle"><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="17" x2="12" y2="17"></line></svg>
                                                <span class="tool-tip top" style="width:210px;">
                                                    첨부파일 1개만 등록 가능합니다
                                                </span>

                                                <script>
                                                    function over(){
                                                        $(".enrollForm .tool-tip").css("display", "inline-block");
                                                    }

                                                    function out(){
                                                        $(".enrollForm .tool-tip").css("display", "none");
                                                    }
                                                </script>
                                            </span>
                                        </th>
                                        <td>
                                            <div id="dropZone" class="attach">
                                                <div class="area-txt">
                                                    <span class="ic-attach">
                                                        <!-- <i data-feather="paperclip" stroke="#888"></i> -->
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#888" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip"><path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path></svg>
                                                    </span>
                                                    <span class="msg">
                                                        이 곳에 파일을 드래그 하세요. 또는 
                                                        <span class="btn-file">
                                                            <span class="file-txt">파일선택</span>
                                                            <input type="file" name="file" class="input-file" title="파일선택" multiple accept="undefined" style="display: inline-block; position: absolute; top: 0; left: 0; opacity: 0; cursor: pointer;">
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="wrap-attach">
                                                  <!-- 파일 첨부 스타일 -->
                                                  <ul class="file-wrap"></ul>
                                                  <!-- 이미지 첨부 스타일 -->
                                                  <ul class="img-wrap"></ul>
                                                  <!-- 파일 첨부 시 변형되는 건 다우오피스 참고 -->
                                                </div>
                                                
                                                <script>
                                                	$(function(){
                                                		$(".input-file").change(function(){
                                                			
                                                			fileChange();
                                                			
                                                		})
                                                	})
                                                	
                                                	function fileChange(){
                                                		// 파일이름 li로 뽑아주는 함수
                                                		
                                                		let fileInput = $(".input-file")[0]; // input타입 객체 담기
                                            			
                                            			let file = fileInput.files; // file 리스트에 각각 담기 (한 개여도 리스트로 취급)
                                            			
                                            			let value = '<li>'
                                            						+	'<span class="item-file">'
                                            						+		'<span class="btn-wrap" title="삭제">'
                                            						+			'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="deleteBtn" onclick="deleteLi();" viewBox="0 0 24 24" fill="none" stroke="#888" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>'
                                            						+		'</span>'
                                            						+		'<span class="ic-file">'
                                            						+			'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgb(0, 135, 239)" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-slack"><path d="M22.08 9C19.81 1.41 16.54-.35 9 1.92S-.35 7.46 1.92 15 7.46 24.35 15 22.08 24.35 16.54 22.08 9z"></path><line x1="12.57" y1="5.99" x2="16.15" y2="16.39"></line><line x1="7.85" y1="7.61" x2="11.43" y2="18.01"></line><line x1="16.39" y1="7.85" x2="5.99" y2="11.43"></line><line x1="18.01" y1="12.57" x2="7.61" y2="16.15"></line></svg>'
                                            						+		'</span>'
                                            						+		'<span class="name">'
                                            						+			file[0].name
                                            						+		'</span>'
                                            						+	'</span>'
                                            						+ '</li>';
                                            			
                                            			$(".file-wrap").html(value);
                                            			
                                                	}
                                                	
                                                	$(function(){
                                                		// 드래그 앤 드랍 함수
                                                		
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
                                                			var files = e.originalEvent.dataTransfer.files;
                                                			
                                                			// input타입 객체의 파일을 드랍된 파일로 바꿔치기
                                                			$(".input-file")[0].files = files;
                                                			
                                                			// 바뀐 파일을 li로 다시 뽑아주기
                                                			fileChange();
                                                		})
                                                		
                                                	})
                                                	
                                                	function deleteLi(){
                                                		
                                                		// input타입 file 객체 비워주기
                                                		$(".input-file").val('');
                                                		
                                                		// li요소 지워주기
                                                		$(".item-file").parent().remove();
                                                		
                                                	}
                                                </script>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="line">
                                      <td colspan="2">
                                        <hr>
                                      </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="editor" style="border:0px">
                              <button type="button" class="btn btn-sm btn-light" style="position:absolute; right:0; top:-20px">임시 저장된 글(0)</button>
                              <div class="go-editor" style="width:100%; padding-bottom:10px; padding-top:20px">
                                <textarea id="summernote" name="boardContent" rows="10" style="resize: none;"></textarea>

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
				                      ['fontsize', ['fontsize']],    // 글자 크기 설정
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
                            </div>
                        </fieldset>
                        
                        <div class="sub-btn">
                        	<button type="submit" class="btn btn-sm btn-primary">등록</button>
	                        <button type="button" class="btn btn-sm btn-light" onclick="save();">임시저장</button>
	                        <button type="button" class="btn btn-sm btn-light">취소</button> <!-- 바로 전 목록으로 돌아가기 -->
                        </div>
                      </form>
                      
                      <!-- 토스트 메시지 -->
			   		  <div id="toast" class="">
						    
					  </div>
                      
                      <script>
                      
                      	function save(){
                      		
                      		// form 요소를 FormData로 만들기 (input 타입에 있는 값들 담김, 하지만 첨부파일은 담기지 않음)
                      		let formData = new FormData(document.getElementById("enrollForm"));
                      		
                      		// 첨부파일 뽑아서 변수에 담기
                      		let files = $("input[name=file]")[0].files;
                      		
                      		// FormData에 첨부파일도 더하기
                      		formData.append("file", files[0]);
                      		
                      		$.ajax({
                      			url: "save.bo",
                      			data: formData,
                      			type: "POST",
                      			processData: false,
                      			contentType: false,
                      			success: function(data){
                      				if(data.result > 0){
                      					toast("게시글이 임시저장되었습니다.");
                      					$("input[name=boardNo]").val(data.boardNo);
                      				}else{
                      					toast("게시글 임시저장에 실패하였습니다");
                      				}
                      				console.log('성공');
                      			},error: function(){
                      				console.log('실패');
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
                    
                    
                </div>
              	
              	
              	</div>
              <!-- 게시판 내용 끝 -->
		
			  </div>
			</div>
		</div>
	</div>

</body>
</html>