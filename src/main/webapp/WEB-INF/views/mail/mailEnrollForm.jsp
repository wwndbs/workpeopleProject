<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	              
	              <form action="insert.ma" method="post" enctype="multipart/form-data">
	              	<input type="text" name="sender" value="${ loginUser.email }" hidden>
	                <!-- 상단 버튼 박스 시작 -->
	                <div class="mail-btn-content">
	                  <button type="button" class="mail-btn1" data-toggle="modal" data-target="#jyModal_confirm">
	                    <ion-icon name="paper-plane-outline" style="margin-top: 8px; font-size: 17px;"></ion-icon>
	                    &nbsp;&nbsp;보내기
	                  </button>
	
	                  <button type="submit" class="mail-btn2" onclick="form.action='save.ma';">
	                    <ion-icon name="cloud-download-outline" style="margin-top:8px; font-size: 19px;"></ion-icon>
	                    <span style="margin-top: 0px;">&nbsp;&nbsp;임시저장</span>
	                  </button>
	
	                  <button ty[e="button" class="mail-btn3">
	                    <ion-icon name="eye-outline" style="margin-top:5px; font-size: 23px;"></ion-icon>
	                    <span style="margin-top: 0px;">&nbsp;&nbsp;미리보기</span>
	                  </button>
	
	                  <button type="reset" class="mail-btn4">
	                    <ion-icon name="refresh-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
	                    <span style="margin-top: 0px;">&nbsp;&nbsp;다시쓰기</span>
	                  </button>
	                </div>
	                <!-- 상단 버튼 박스 끝 -->
	
	                <table class="mail-table-write">
	                  <tr>
	                    <th class="fixedCol1">
	                      받는 사람
	                      <input type="text" name="receiver" id="receiver" value="" hidden>
	                    </th>
	                    <td class="fixedCol2">
	                      <input type="checkbox" id="toMe" style="vertical-align:-8px;">
	                      <label for="toMe" style="font-size: 14px; margin-left: 3px; cursor:pointer;">나에게</label>
	                    </td>
	
	                    <td>
	                    	<div class="mail-input-wrap">
	                        <div id="toAddrWrap" class="mail-input-div">
	                          <ul>
	                          
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
	                          <option value="">kimbabo@workpp.com</option>
	                          <option value="">jungmalddong@workpp.com</option>
	                          <option value="">gamja@workpp.com</option>
	                          <option value="">boramsarang@workpp.com</option>
	                          <option value="">hiwork@workpp.com</option>
	                        </select>
	                  	  </div>  
	                    </td>
	
	                    <td class="fixedCol3">
	                      <button class="mail-btn-addressbook">주소록</button>
	                    </td>
	                  </tr>
	
	                  <tr>
	                    <th>
	                      참조
	                      <input type="text" name="mailRef" id="mailRef" value="" hidden>
	                    </th>
	                    <td></td>
	                    <td>
	                      <div class="mail-input-wrap">
	                        <div id="refAddrWrap" class="mail-input-div">
	                          <ul>
	                          
								<!-- mail-addr-out 출력될 자리 -->
	                      
	                            <li class="mail-addr-create">
	                              <div class="addr_input">
	                                <textarea id="ref" name="ref" onkeyup="if(window.event.keyCode==13||window.event.keyCode==188){refBlock()}" style="display: inline; white-space: nowrap; width: 152px;" autocomplete="off"></textarea>
	                              </div>
	                            </li>
	                          </ul>
	                        </div>
	                        <select name="recent_address" class="select-recent-addr">
	                          <option disabled selected>최근 주소</option>
	                          <option value="">kimbabo@workpp.com</option>
	                          <option value="">jungmalddong@workpp.com</option>
	                          <option value="">gamja@workpp.com</option>
	                          <option value="">boramsarang@workpp.com</option>
	                          <option value="">hiwork@workpp.com</option>
	                        </select>
	                      </div>  
	                    </td>
	                    <td></td>
	                  </tr>
	                  
	                  <script>
	                  	// 나에게 체크박스
	                  	$("#toMe").change(function(){
	                  		
	                  		if($(this).is(':checked')){
	                  			
	                  			// 주소 li요소로 추가
	                  			let value="";
	                            value +='<li class="mail-addr-out toMe">'
	                                   + '<span class="addr-block">' 
	                                   + '${ loginUser.email }'
	                                   + '</span>'
	                                   + '<span class="btn-addr-remove">'
	                                   + '<ion-icon name="close-outline"></ion-icon>'
	                                   + '</span>'
	                                   + '</li>';
	
	                            $("#toAddrWrap .mail-addr-create").before(value);
	                  		  		
				                // input value에 입력한 주소 추가
					            let currTo = $("#receiver").val();
					            if(currTo == ''){ // 처음 주소 추가 시
					            	$("#receiver").val("${ loginUser.email }");
					            }else{
					            	$("#receiver").val(currTo + "," + "${ loginUser.email }");
					            }
					            	
	                  		}else{
	                  			
	                  			// 주소 li요소 삭제
	                  			$(".toMe").remove();
	                  			
	                  			// input value에서 주소 삭제
			                    let currToArr = $("#receiver").val().split(",");
			                    
				              	currToArr.splice(currToArr.indexOf("${ loginUser.email }"), 1);
			                    
				              	$("#receiver").val(currToArr.join());
	                  		}
	                  		
	                  	})
	                  	
		                // enter , (받는사람)
			  	        function toBlock() {
		               	   
			              	if(window.event.keyCode==13){
			              		var $addr = $("#to").val().replace("\n", "");
			              	}else if(window.event.keyCode==188){
			                	var $addr = $("#to").val().replace(/,$/, "");
		                    }
	                      
			              	// 주소 li요소로 추가
		                    let value = "";
		                    value +='<li class="mail-addr-out">'
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
			              	
		                    console.log($addr);
		                    console.log($("#receiver").val());
		                }
		                  
						// enter , (참조)
						function refBlock() {
											  	  
						    if(window.event.keyCode==13){
						      var $addr = $("#ref").val();
						    }else if(window.event.keyCode==188){
						      var $addr = $("#ref").val().replace(/,$/, '');
						    }
						      
						  	// 주소 li요소로 추가
						    let value = "";
						    value +='<li class="mail-addr-out">'
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
			              	
			              	console.log($("#receiver").val());
		                
		                })
		                
		                // 주소 개별 삭제 (참조)
		                $(document).on("click", "#refAddrWrap ion-icon", function(){
		                    
		                	$(this).parent().parent().remove();
		                 	
			              	// 현재 참조 input value값 => 배열
		                    let currRefArr = $("#mailRef").val().split(","); // ["aaa.com", "bbb.com", "ccc.com"]
		                    
		                    // 삭제할 요소의 text값에서 엔터 제거
			              	let deleteRef = $(this).parent().prev().text().replace("\n", ""); // "bbb.com"
			              	
			              	currRefArr.splice(currRefArr.indexOf(deleteRef), 1);
		                    
			              	$("#mailRef").val(currRefArr.join()); // "aaa.com, ccc.com"
			              	
		                })
		                
	                  </script>
	                    
	                  <tr>
	                    <th>제목</th>
	                    <td></td>
	                    <td>
	                      <input type="text" name="mailTitle" style="width: 100%;">
	                    </td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <th>파일첨부</th>
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
	                      <div class="mail-filebox open">
	                        <a class="file-empty" >
	                          <i class="material-icons-sharp" style="font-size: 16px; vertical-align: -3px;">
	                            attach_file
	                          </i>
	                          여기에 첨부파일을 끌어오세요. 또는 <b onclick="chooseFile();"><u>파일 선택</u></b>
	                        </a>
	                        
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
			                       + '<span class="btn-file-remove"><ion-icon name="close-outline" index="' + i + '"></ion-icon></span>'
			                       + '<span>' + obj.files[i].name + '</span>'
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
			                    alert("첨부파일은 최대 " + maxFile + "개 까지 첨부 가능합니다.");
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
		                  
		                // 파일 리스트에서 파일 개별 삭제
		                $(document).on("click", ".btn-file-remove>ion-icon", function(){
				            $(this).parent().parent().remove();
				              
				              let files = $("input[name=upfile]")[0].files;  // FileList
				              fileArr = Array.from(files); // FileList => Array
				              
				              fileArr.splice($(this).attr("index"), 1);
				              
				              settingFile();
			              	  	 
			              	// (다른 방법) 현재 이벤트가 발생한 요소의 상위요소들 중 클래스가 each-file인 요소 선택한 담에 
			              	// 그 요소 뒤에있는 요소의 후손요소들 중 .btn-file-remove>ion-icon의 attr("index", 기존의 값에 -1)
			              	
					          $(".each-file").remove();
					          if(fileArr.length == 0){
			                  	 $(".file-empty").css("display", "block");
					          }else{
				                 	selectFileList(document.querySelector("input[name=upfile]"));				            	
					          }
		                  })
		                  
		                // 파일 전체 삭제
		                function fileReset(){
		                    $("input[name=upfile]").val('');
		                    fileArr = [];
		
					        $(".each-file").remove();
		                	    $(".file-empty").css("display", "block");
		                }
		                
		                // 파일박스에 드래그 앤 드롭
		                  
		                    
		                function settingFile(){
		                	
		                	const dataTransfer = new DataTransfer();
				            fileArr.forEach(function(file){
				            	  dataTransfer.items.add(file);
				            })
			            	$("input[name=upfile]")[0].files = dataTransfer.files;
		                }
		                    
	                  </script>
	
	                  <tr>
	                    <th colspan="3" style="padding-top: 20px">
	                     <textarea name="mailContent" id="summernote" rows="10" style="resize: none;"></textarea>
	                    </th>
	                    <td></td>
	                  </tr>
	                </table>
	                <br>
	                  
		            <!-- 모달: 제목 없음 / 버튼 2개 -->
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
	                
		           /*
		           $('html').click(function(e) {   
		             if(!$(e.target).hasClass("mailarea")) {
		               alert('영역 밖입니다.');
		             }
		           });    
		           */
	              
	            </script>
	            
	          </div>
	          <!-- 메일 전체 div 끝 -->
	        </div>
	      </div>
	    </div>
		
		<jsp:include page="../common/footer.jsp" />
		
	</div>
</body>
</html>