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
  .color{background-color:rgb(118, 194, 252); width: 5%; height: 90.7%;}
  .font1{font-weight: bold; font-size: 100%;}
  .font2{font-size: 80%;} 
  .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14)}
  .div1{height: 750px; width: 101.15% !important}
  .insert-div{width: 50%; margin:0 auto;}
  #exampleFormControlTextarea1{height: 200px !important}
  .check1{margin: 65px 400px 0px -25px;}
  .pro1{margin: 10px 0px 0px 0px;}
  .member-div{width: 100%; margin: 10px 0px 0px 0px;}
  .mdiv1{width: 53%; height: 10px; float: left; margin: 0px 0px -100px 0px;}
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
  .rep-div{background-color: rgb(232, 232, 232); width: 100%; height: 80%;}
  .reply1{width: 95%; height: 80px; margin: 18px 15px -20px 20px; font-size: 15px;}
  .reply-insert{width: 98%; height: 20%;}
  .btn3{width: 10%; margin: 10px 10px 0px -7px;}
  .form-div{margin: 15px 15px 15px 15px;}
  .pro1{float: left;}
  #datePicker{height: 35px; width: 120px;}
  #exampleFormControlTextarea1{height: 200px !important;}
  .file1{margin: 0px 20px 0px 20px;}
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
		              <h5 style="font-weight: 400"><b>설문 등록</b></h2>
		              <hr style="margin: 15px 0px 6px 0px">
		            </div>
		            
		              <div class="card mb-grid div3" style="color:rgb(79, 79, 79);">
		                <form class="form1">
		                  <!-- 제목쪽 div -->
		                  <div class="form-div">
		                    <!-- 설문 제목 입력 -->
		                    <input class="form-control mb-2" type="text" placeholder="설문 제목을 입력하세요.">
		                  </div>
		
		                  <!-- 게시물 마감기한 -->
		                  <div style="display: flex; float: left !important; margin: 0px 10px -13px 20px;">
		                    <label for="" style="width: 110px; margin: 7px 0px 0px -3px;"><b>마감기한</b></label>
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    <!-- 시작시 기본 날짜 설정은 value를 이용 -->
		                    <input type="date" id="datePicker" class="form-control date1" value="" />
		                    &nbsp;~&nbsp;
		                    <input type="date" id="datePicker" class="form-control date1" value="" />
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                  </div>
				
		                  <!-- 프로젝트 부서선택 -->                        
		                  <div class="form-check check1">
		                    <label class="form-check-label">
		                      &nbsp;&nbsp;&nbsp;
		                      <label for=""><b>설문대상</b></label>
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      &nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="checkbox"> 인사팀
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="checkbox"> 개발팀
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="checkbox"> 총무팀
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="checkbox"> 회계팀
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="checkbox"> 영업팀
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    </label>
		                  </div>
		                  
		                  <!-- 게시물 내용 입력 -->
		                  <div class="form-group" style="margin: -15px 20px 5px 20px;">
		                    <br>
		                    <textarea class="form-control" id="exampleFormControlTextarea1" style="resize: none"  placeholder="설문에 대한 설명을 입력하세요."></textarea>
		                  </div>
		
		                  <!-- 설문 문항추가버튼 -->
		                  <div style="margin: 40px 0px 0px 0px;">
		                    <button type="submit" class="btn btn-secondary btn4" style="width: 95.5%;">문항 추가</button>
		                  </div>
		
		                  <!-- 질문 한개 항목 -->
		                  <br>
		                  <div>
		                    <div style="display:flex;">
		                      <label for="" style="width: 93px; margin: 7px 0px 0px -10px;"><b>질문</b></label>
		                      <input class="form-control mb-2" type="text" style="width: 88.3%;" placeholder="질문 내용을 입력해주세요.">
		                    </div>
		                    <!-- 만족도형/통계형 -->
		                    <label class="form-check-label pro1" style="margin: 8px 0px 0px 21px;">
		                      <label for=""><b>설문타입</b></label>
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                      만족도형
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                      통계형                  
		                    </label><br>
		                  </div>
		
		                  <!-- 만족도형일 경우 -->
		                  <div width="100%" style="display: flex;">
		                    <label for="" style="margin: 28px 25px 0px -232px;"><b>보기</b></label>
		                    <label class="form-check-label pro1" style="margin: 21px 0px 0px 0px;">
		                      <div>
		                        <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                        <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px; background-color: white;" placeholder="매우만족" disabled>
		                      </div>
		                      <div>
		                        <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                        <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px; background-color: white;" placeholder="만족" disabled>
		                      </div>
		                      <div>
		                        <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                        <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px; background-color: white;" placeholder="보통" disabled>
		                      </div>
		                      <div>
		                        <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                        <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px; background-color: white;" placeholder="불만족" disabled>
		                      </div>
		                      <div>
		                        <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                        <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px; background-color: white;" placeholder="매우불만족" disabled>
		                      </div>                  
		                    </label><br>
		                  </div>
		
		                  <!-- 설문 문항추가버튼 -->
		                  <div style="margin: 40px 0px 0px 0px;">
		                    <button type="submit" class="btn btn-secondary btn4" style="width: 95.5%;">문항 추가</button>
		                  </div>                    
		
		                  <!-- 질문 한개 항목 -->
		                  <br>
		                  <div>
		                    <div style="display:flex;">
		                      <label for="" style="width: 93px; margin: 7px 0px 0px -10px;"><b>질문</b></label>
		                      <input class="form-control mb-2" type="text" style="width: 88.3%;" placeholder="질문 내용을 입력해주세요.">
		                    </div>
		                    <!-- 만족도형/통계형 -->
		                    <label class="form-check-label pro1" style="margin: 8px 0px 0px 21px;">
		                      <label for=""><b>설문타입</b></label>
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                      만족도형
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                      통계형                  
		                    </label><br>
		                  </div>
		
		                  <!-- 통계형일 경우 -->
		                  <div style="margin: 0% 25% 0% 28.5%;">
		                    <div width="100%" style="display: flex;">
		                      <label for="" style="margin: 28px 25px 0px -232px;"><b>보기</b></label>
		                      <label class="form-check-label pro1" style="margin: 21px 0px 0px 0px;">
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <button type="submit" class="btn btn-secondary btn4" style="width: 326.5%; margin: 0px 0px 7px 20px;">보기 추가</button>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <button type="submit" class="btn btn-secondary btn4" style="width: 326.5%; margin: 0px 0px 7px 20px;">보기 추가</button>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>   
		                        <button type="submit" class="btn btn-secondary btn4" style="width: 326.5%; margin: 0px 0px 7px 20px;">보기 추가</button>               
		                      </label><br>
		                    </div>
		                  </div>
		
		                  <!-- 설문 문항추가버튼 -->
		                  <div style="margin: 40px 0px 0px 0px;">
		                    <button type="submit" class="btn btn-secondary btn4" style="width: 95.5%;">문항 추가</button>
		                  </div>
		                  
		                  <!-- 질문 한개 항목 -->
		                  <br>
		                  <div>
		                    <div style="display:flex;">
		                      <label for="" style="width: 93px; margin: 7px 0px 0px -10px;"><b>질문</b></label>
		                      <input class="form-control mb-2" type="text" style="width: 88.3%;" placeholder="질문 내용을 입력해주세요.">
		                    </div>
		                    <!-- 만족도형/통계형 -->
		                    <label class="form-check-label pro1" style="margin: 8px 0px 0px 21px;">
		                      <label for=""><b>설문타입</b></label>
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                      만족도형
		                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                      통계형                  
		                    </label><br>
		                  </div>                  
		
		                  <!-- 통계형 작성완료 -->
		                  <div style="margin: 0% 25% 0% 28.5%;">
		                    <div width="100%" style="display: flex;">
		                      <label for="" style="margin: 28px 25px 0px -232px;"><b>보기</b></label>
		                      <label class="form-check-label pro1" style="margin: 21px 0px 0px 0px;">
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>
		                        <div>
		                          <input class="form-check-input" style="margin: 12px 120px 0px -120px;" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
		                          <input class="form-control mb-2" type="text" style="width: 326.8%; margin: 0px 0px 0px 20px;" placeholder="보기를 입력해주세요">
		                        </div>   
		                      </label><br>
		                    </div>
		                  </div>
		
		                  <!-- 설문 문항추가버튼 -->
		                  <div style="margin: 40px 0px 0px 0px;">
		                    <button type="submit" class="btn btn-secondary btn4" style="width: 95.5%;">문항 추가</button>
		                  </div>
		
		                  <!-- 버튼 -->
		                  <br><br>
		                  <div>
		                    <button type="submit" class="btn btn-secondary btn4" style="width: 14%;">취소</button>
		                    <button type="submit" class="btn btn-primary btn4" style="width: 14%;">설문 등록</button>
		                  </div>
		                  
		                </form>
		              </div> 
		              <br>
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