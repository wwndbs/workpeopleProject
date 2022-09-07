<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .adminx-content{height: 85vh;}
  .adminx-main-content{height: 85vh;}
  .div3{width: 50%; margin: 0 auto; border-radius: 5px; text-align: center;}
  .row{width:100%; height: 100px; margin: 0px 0px -5px -13px;}
  .color{
    background-color:rgb(118, 194, 252);
    width: 5%;
    height: 90.7%;
  }
  .font1{font-weight: bold; font-size: 100%;
  }
  .font2{font-size: 80%;} 
  .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14)}
  .div1{height: 750px; width: 101.15% !important}
  .insert-div{width: 50%; margin:0 auto;}
  #exampleFormControlTextarea1{height: 200px !important}
  .check1{margin: 17px 50px 0px 0px;}
  .pro1{margin: 10px 0px 0px 0px;}
  .member-div{width: 100%; margin: 10px 0px 0px 0px;}
  .mdiv1{
    width: 53%;  
    height: 10px;
    float: left; 
    margin: 0px 0px -100px 0px;
  }
  .mdiv2{
    width: 53%;
    height: 10px;
    float: right; 
    margin: 0px -45px -100px 30px
  }
  .bdiv{
    font-weight: bold;
    width: 10px;
    color:gray;
    margin: 10px 0px -186px 430px
    !important
  }
  .btn4{margin: -20px 0px 15px 0px; height: 39px !important;}
  .search1{margin: 10px 10px 10px 10px; width: 85%;}
  .h5-1{margin: 20px 690px 20px 20px;}
  .btn2{width: 100px;}
  .ssm{margin: -45px -350px 0px 325px;}
  .person1{width: 94%; margin: 15px 480px 0px -323px !important;}
  .important1{margin: 15px 748px 0px 0px;}
  .ifect1{pointer-events:none;}
  .pro-content{margin: 0px 20px 0px 20px}
  .form1{top: 0; left: 0; right: 0; bottom: 0;}
  .rep-div{
    background-color: rgb(232, 232, 232);
    width: 100%;
    height: 80%;
  }
  .reply1{
    width: 95%; 
    height: 80px; 
    margin: 18px 15px -20px 20px;
    font-size: 15px;
  }
  .reply-insert{width: 98%; height: 20%;}
  .btn3{width: 10%; margin: 10px 10px 0px -7px;}
  .form-div{margin: 15px 15px 15px 15px;}
  .pro1{float: left;}
  #datePicker{height: 35px; width: 120px;}
  #exampleFormControlTextarea1{height: 380px !important;}
  .file1{margin: 0px 20px 0px 20px;}
  .file2{height:10px}
  .date1{width:150px !important}
</style>
</head>
<body>
	<div class="adminx-container">
	      <!-- 상단 메뉴 바 -->
		  <jsp:include page="../common/header.jsp" />
		
		  <!-- 좌측 슬라이드 메뉴 바 -->
		  <jsp:include page="../common/menubar.jsp" />
		  
		  <!-- 컨텐츠 부분 wrapper -->
	      <div class="adminx-content">
	        <div class="adminx-main-content">
	          <div class="container-fluid">  
	
	            <div class="pb-3">
	              <h5 style="font-weight: 400"><b>프로젝트 게시물 등록</b></h5>
	              <hr style="margin: 15px 0px 6px 0px">
	            </div>
	            
	              <div class="card mb-grid div3" style="color:rgb(79, 79, 79);">
	                <form class="form1">
	                  <!-- 제목쪽 div -->
	                  <div class="form-div">
	                    <!-- 게시물 제목 입력 -->
	                    <input class="form-control mb-2" type="text" placeholder="게시물 제목을 입력하세요.">
	                    <hr width="850px">
	                  </div>
	
	                  <!-- 게시물 진행단계 -->
	                  <div style="margin: -10px 20px 0px 20px;">
	                    <label class="form-check-label pro1">
	                      <label for=""><b>진행단계</b></label>
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                      진행
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                      완료
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                      보류           
	                    </label>
	                  </div>
	                  <br>
	
	                  <!-- 게시물 마감기한 -->
	                  <div style="display: flex; float: left !important; margin: 0px 10px -13px 20px;">
	                    <label for="" style="width: 110px; margin: 7px 0px 0px 0px;"><b>마감기한</b></label>
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <!-- 시작시 기본 날짜 설정은 value를 이용 -->
	                    <input type="date" id="datePicker" class="form-control date1" value="" />
	                    &nbsp;~&nbsp;
	                    <input type="date" id="datePicker" class="form-control date1" value="" />
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                  </div>
	
	                  <script>
	                    $('#datePicker')
	                       .datepicker({
	                          format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	                          startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	                          endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	                          autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	                          calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	                          clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	                          datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
	                          daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
	                          daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
	                          disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
	                          immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
	                          multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
	                          multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
	                          templates: {
	                             leftArrow: '&laquo;',
	                             rightArrow: '&raquo;',
	                          }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
	                          showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
	                          title: '테스트', //캘린더 상단에 보여주는 타이틀
	                          todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
	                          toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	                          weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
	                          language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	                       })
	                       .on('changeDate', function (e) {
	                          /* 이벤트의 종류 */
	                          //show : datePicker가 보이는 순간 호출
	                          //hide : datePicker가 숨겨지는 순간 호출
	                          //clearDate: clear 버튼 누르면 호출
	                          //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
	                          //changeMonth : 월이 변경되면 호출
	                          //changeYear : 년이 변경되는 호출
	                          //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
	                  
	                          console.log(e);
	                          // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
	                       });
	                  </script>
	
	                  <!-- 중요도 -->
	                  <div style="margin: 0px 20px 0px 20px;">
	                    <label class="form-check-label pro1">
	                      <label for=""><b>중요도</b></label>
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                      높음
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                      보통
	                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                      낮음           
	                    </label>
	                  </div>
	
	                  <hr style="width:855px; margin: 105px 20px 0px 20px">
	                  
	                  <!-- 게시물 내용 입력 -->
	                  <div class="form-group" style="margin: 0px 20px 0px 20px;">
	                    <br>
	                    <textarea class="form-control" id="exampleFormControlTextarea1" style="resize: none"  placeholder="내용을 입력하세요."></textarea>
	                  </div>
	                  <br><br>
	
	                  <!-- 파일첨부 -->
	                  <div class="file1">
	                    <label for="" style="float: left"><b>파일첨부</b></label>
	                    <div class="file2">
	                      <input type="file" class="custom-file-input" id="customFile">
	                      <label class="custom-file-label" style="width: 755px; margin: 650px 0px 0px 100px;" for="customFile">파일 선택</label>
	                    </div>
	                  </div>
	                  <br><br><br>
	
	                  <!-- 버튼 -->
	                  <button type="button" onclick="location.href='proList.pr'" class="btn btn-secondary btn4" style="width: 14%;">목록으로</button>
	                  <button type="submit" class="btn btn-primary btn4" style="width: 14%;">게시물 등록</button>
	                  
	                </form>
	              </div> 
	            </div>
	          </div>
	        </div>
	      </div>
	            
	    <!-- bootstrap -->
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	    <script src="resources/bootstrap/dist/js/vendor.js"></script>
	    <script src="resources/bootstrap/dist/js/adminx.js"></script>
					  
</body>
</html>














