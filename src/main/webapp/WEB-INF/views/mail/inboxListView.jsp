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
                
                <span class="mail-h">받은 메일함</span>
                <span>전체 메일 50 / 안 읽은 메일 6</span>

                <form action="">
                  <!-- 상단 버튼 박스 시작 -->
                  <div class="mail-btn-content" style="width: 580px;">
                    <input type="checkbox" name="" id="" style="margin-right: 10px;">

                    <button type="button" class="mail-btn4">
                      <ion-icon name="ban-sharp" style="margin-top:5px; font-size: 20px;"></ion-icon>
                      <span style="margin-top: 0px;">&nbsp;&nbsp;스팸신고</span>
                    </button>
                    
                    <button type="button" class="mail-btn5">
                      <ion-icon name="return-down-forward-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
                      <span style="margin-top: 0px;">&nbsp;&nbsp;답장</span>
                    </button>                    
                    
                    <button type="button" class="mail-btn5">
                      <ion-icon name="trash-outline" style="margin-top:5px; font-size: 19px;"></ion-icon>
                      <span style="margin-top: 0px;">&nbsp;&nbsp;삭제</span>
                    </button>    

                    <button type="button" class="mail-btn5 dropdown">
                      <i class="fas fa-tag" style="margin-top:8px; font-size: 16px;"></i>
                      <span style="margin-top: 0px;">&nbsp;&nbsp;태그</span>
                      <!--태그 드롭다운-->
                      <div class="dropdown-tagList">
                        <table style="width: 100%;">
                          <tr>
                            <td>
                              <i class="fas fa-tag" style="margin-top:8px; font-size: 16px; color: crimson;"></i>
                              <span class="tagName">나의부서</span>
                            </td>
                            <td>
                              <a href="" class="mail-a-taglist">적용</a>
                            </td>
                            <td>
                              <a href="" class="mail-a-taglist">X해제</a>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <i class="fas fa-tag" style="margin-top:8px; font-size: 16px; color: dodgerblue;"></i>
                              <span class="tagName">외부업체</span>
                            </td>
                            <td>
                              <a href="" class="mail-a-taglist">적용</a>
                            </td>
                            <td>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <i class="fas fa-tag" style="margin-top:8px; font-size: 16px; color: gold;"></i>
                              <span class="tagName">참고자료</span>
                            </td>
                            <td>
                            </td>
                            <td>
                              <a href="" class="mail-a-taglist">X해제</a>
                            </td>
                          </tr>
                        </table>
                      </div>
                    </button>  

                    <button type="button" class="mail-btn5">

                      <i class="material-icons-sharp" style="margin-top:3px; font-size: 25px;">
                        arrow_right_alt
                      </i>
                      <span style="margin-top: 0px;">&nbsp;&nbsp;전달</span>
                    </button>
                    
                    <button type="button" class="mail-btn5">
                      <ion-icon name="mail-open-outline" style="margin-top:5px; font-size: 20px;"></ion-icon>
                      <span style="margin-top: 0px;">&nbsp;&nbsp;읽음</span>
                    </button>
                  </div>
                  <!-- 상단 버튼 박스 끝 -->

                  <!-- 메일함 시작 -->
                  <div class="mail-list-content">

                   <table class="mail-table-list">
                    <!--최근메일 시작-->
                    <tr class="mail-list-division">
                      <td colspan="3">최근 메일</td>
                      <td colspan="3"><hr></td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail-open-outline"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>김피플</span>
                      </td>
                      <td class="d5">
                        <span>테스트 메일 제목입니다.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark-outline"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>강소똥</span>
                      </td>
                      <td class="d5">
                        <span>[결재 취소] '강소똥 사원'이(가) 작성한 '휴가신청-연차관리연동'이(가) 회수되었습니다.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark-outline"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>강소똥</span>
                      </td>
                      <td class="d5">
                        <span>[결재 도착] '강소똥 사원'이(가) 작성한 '휴가신청-연차관리연동'이(가) 도착했습니다.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark-outline"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>강소똥감사바리요</span>
                      </td>
                      <td class="d5">
                        <span>피플님. 첨부파일 확인해 주세요.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <!--최근메일 끝-->

                    <!--오래된 메일 시작-->
                    <tr class="mail-list-division">
                      <td colspan="3">오래된 메일</td>
                      <td colspan="3"><hr></td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail-open-outline"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>김피플</span>
                      </td>
                      <td class="d5">
                        <span>테스트 메일 제목입니다.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark-outline"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>강소똥</span>
                      </td>
                      <td class="d5">
                        <span>[결재 취소] '강소똥 사원'이(가) 작성한 '휴가신청-연차관리연동'이(가) 회수되었습니다.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark-outline"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>강소똥</span>
                      </td>
                      <td class="d5">
                        <span>[결재 도착] '강소똥 사원'이(가) 작성한 '휴가신청-연차관리연동'이(가) 도착했습니다.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <tr>
                      <td class="d1"><input type="checkbox" name="" id=""></td>
                      <td class="d2">
                        <ion-icon name="bookmark-outline"></ion-icon>
                      </td>
                      <td class="d3">
                        <ion-icon name="mail"></ion-icon>
                      </td>
                      <td class="d4">
                        <span>강소똥감사바리요</span>
                      </td>
                      <td class="d5">
                        <span>피플님. 첨부파일 확인해 주세요.</span>
                        <ion-icon name="copy-outline"></ion-icon>
                      </td>
                      <td class="d6">22-09-06 15:30</td>
                    </tr>
                    <!--오래된 메일 끝-->

                   </table>

                  </div>
                  <!-- 메일함 끝 -->

                </form>

              </div>
              <!-- 메일 내용 끝 -->
            </div>
            <!-- 메일 전체 div 끝 -->
          </div>
        </div>
      </div>
		
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>