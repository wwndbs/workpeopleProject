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
                
                <form action="">
                  <!-- 상단 버튼 박스 시작 -->
                  <div class="mail-btn-content">
                    <button type="submit" class="mail-btn1">
                      <ion-icon name="paper-plane-outline" style="margin-top: 8px; font-size: 17px;"></ion-icon>
                      &nbsp;&nbsp;보내기
                    </button>

                    <button type="button" class="mail-btn2">
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
                      </th>
                      <td class="fixedCol2">
                        <input type="checkbox" id="toMe" style="vertical-align:-8px;">
                        <label for="toMe" style="font-size: 14px; margin-left: 3px;">나에게</label>
                      </td>

                      <td>
                      	<div class="mail-input-wrap">
                          <div id="toAddrWrap" class="mail-input-div">
                            <ul>
                              <li class="mail-addr-out">
                                <span class="addr-block">asd@gnaver.com</span>
                                <span class="btn-addr-remove"><ion-icon name="close-outline"></ion-icon></span>
                              </li>
                              <li class="mail-addr-out">
                                <span class="addr-block">asasdfadd@gnaver.com</span>
                                <span class="btn-addr-remove"><ion-icon name="close-outline"></ion-icon></span>
                              </li>                              
                              <li class="mail-addr-out">
                                <span class="addr-block">asasdfadd@gnaver.com</span>
                                <span class="btn-addr-remove"><ion-icon name="close-outline"></ion-icon></span>
                              </li>

                              <li class="mail-addr-create">
                                <div class="addr_input">
                                  <textarea id="to" name="to" type="text" style="display: inline; white-space: nowrap; width: 152px;" autocomplete="off"></textarea>
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

                    <script>
	                  	// enter나 , 누르면 주소 블럭 li요소로 추가하기
		  	              function addrBlock() {
		      	              alert("Enter Key 입력 감지");
		      	          	
		      	              let value="";
		      	              value ='<li class="out"><span>가나다라마바사</span></li>';
		      	              
		      	              $("#toAddWrap>ul").prepend(value);
		          	      }

                    </script>
                    

                    <tr>
                      <th>참조</th>
                      <td></td>
                      <td>
                        <div class="mail-input-wrap">
                          <div id="ccAddrWrap" class="mail-input-div">
                            <ul>
                              <li class="mail-addr-out">
                                <span class="addr-block">asd@gnaver.com</span>
                                <span class="btn-addr-remove"><ion-icon name="close-outline"></ion-icon></span>
                              </li>
                              <li class="mail-addr-out">
                                <span class="addr-block">asasdfadd@gnaver.com</span>
                                <span class="btn-addr-remove"><ion-icon name="close-outline"></ion-icon></span>
                              </li>                              
                              <li class="mail-addr-out">
                                <span class="addr-block">asasdfadd@gnaver.com</span>
                                <span class="btn-addr-remove"><ion-icon name="close-outline"></ion-icon></span>
                              </li>

                              <li class="mail-addr-create">
                                <div class="addr_input">
                                  <textarea id="to" name="to" type="text" style="display: inline; white-space: nowrap; width: 152px;" autocomplete="off"></textarea>
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
                    <tr>
                      <th>제목</th>
                      <td></td>
                      <td>
                        <input type="text" style="width: 100%;">
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <th>파일첨부</th>
                      <td style="margin-right: 5px;"><ion-icon name="caret-down-circle-outline"></ion-icon></td>
                      <td style="text-align: left;">
                        <button class="mail-btn-file">파일첨부</button>
                        <button class="mail-btn-file">전체삭제</button>
                        <input type="file" name="" id="" hidden>
                      </td>
                      <td></td>
                    </tr>
                    <tr style="height: 90px;">
                      <td></td>
                      <td></td>
                      <td>
                        <div class="mail-filebox">
                          <i class="material-icons-sharp" style="font-size: 16px; vertical-align: -3px;">
                            attach_file
                          </i>
                          <span>여기에 첨부파일을 끌어오세요. 또는</span>
                          <span><b><u>파일 선택</u></b></span>
                        </div>
                      </td>
                      <td></td>
                    </tr>

                    <tr>
                      <th colspan="3" style="padding-top: 20px">
                       <textarea name="mailContent" id="summernote" rows="10" style="resize: none;"></textarea>
                      </th>
                      <td></td>
                    </tr>
                  </table>
                  <br>
                  
              </form>
              </div>
              <!-- 메일 내용 끝 -->
              
              <script>
	              // summernote
	              $(document).ready(function() {
	                $('#summernote').summernote({
	                  minHeight: 390,  // 최소 높이
	                  maxHeight: 800,  // 최대 높이
	                  focus: false,       // 에디터 로딩후 포커스를 맞출지 여부
	                  lang: "ko-KR",      // 한글 설정
	                  tabsize: 2,
	                  height: 120,
	                  toolbar: [
	                  ['style', ['style']],
	                  ['font', ['bold', 'underline', 'clear']],
	                  ['color', ['color']],
	                  ['para', ['ul', 'ol', 'paragraph']],
	                  ['table', ['table']],
	                  ['insert', ['link', 'picture', 'video']],
	                  ['view', ['fullscreen', 'codeview', 'help']]
	                  ]
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