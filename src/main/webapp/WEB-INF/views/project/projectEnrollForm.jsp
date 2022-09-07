<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .row{width:100%; height: 100px; margin: 0px 0px -5px -13px;}
  .color{background-color:rgb(118, 194, 252); width: 5%; height: 90.7%;}
  .font1{font-weight: bold; font-size: 100%;}
  .font2{font-size: 80%;} 
  .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14)}
  .div1{height: 750px; width: 101.15% !important}
  .div3{
    height: 104%;
    border-radius: 5px;
    margin: -12px 0px 0px 0px;
    text-align: center;
    width: 204.15%
    !important
  }
  .div4{height: 450px;}
  .insert-div{width: 50%; margin:0 auto;}
  #exampleFormControlTextarea1{height: 200px !important}
  .check1{margin: 17px 50px 0px 0px;}
  .pro1{margin: 10px 0px 0px 0px;}
  .member-div{width: 100%; margin: 10px 0px 0px 0px;}
  .mdiv1{width: 53%; height: 10px; float: left; margin: 0px 0px -100px 0px;}
  .mdiv2{width: 53%; height: 10px; float: right; margin: 0px -45px -100px 30px}
  .div3-1{height: 90%; margin: 10px 0px 0px 0px;}
  .bdiv{font-weight: bold; width: 10px; color:gray; margin: 10px 0px -186px 420px !important}
  .btn1{margin: 180px -520px -400px 520px;}
  .search1{margin: 10px 10px 10px 10px; width:86% !important}
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
	              <h5 style="font-weight: 400"><b>프로젝트 생성</b></h2>
	              <hr>
	            </div>
	            
	            <div class="row div1">
	              <div class="col-lg-6 div2">
	                <div class="card mb-grid div3">
	                  <div class="card-body collapse show div4" id="card1">
	                    <form>
	                      <div class="insert-div">
	                        <!-- 프로젝트 제목 입력 -->
	                        <input class="form-control mb-2" type="text" placeholder="프로젝트명을 입력하세요.">
	                        <!-- 프로젝트 설명 입력 -->
	                        <div class="form-group">
	                          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="resize: none"  placeholder="프로젝트에 대한 설명을 입력하세요."></textarea>
	                        </div>
	                        <!-- 프로젝트 전체공개/승인후참여 -->
	                        <label class="form-check-label">
	                          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                          전체공개                        
	                        </label>
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        <label class="form-check-label">
	                          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                          담당자 승인 후 참여가능                          
	                        </label>
	                        <!-- 프로젝트 부서선택 -->                        
	                        <div class="form-check check1">
	                          <label class="form-check-label">
	                            <label for=""><b>부서선택</b></label>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	                        <!-- 프로젝트 진행단계 -->
	                        <label class="form-check-label pro1">
	                          <label for=""><b>프로젝트 진행단계</b></label>
	                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                          기획중
	                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                          기획완료  
	                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                          프로젝트 진행중     
	                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                          피드백     
	                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
	                          프로젝트 완료                         
	                        </label><br>
	                        <!-- 참여인원 선택 -->
	                        <div class="member-div">
	                          <!-- 왼쪽박스 -->
	                          <div class="mdiv1">
	                            <label for="" style="float: left;"><b>참여인원</b></label>
	                            <div class="row">
	                              <div class="col-lg-6">
	                                <div class="card mb-grid div3 div3-1">
	                                  <div style="float: left;">
	                                    <input class="form-control mb-2 search1" type="text" placeholder="이름 검색">
	                                    <i data-feather="search" style="margin: -80px -160px 0px 200px;"></i>
	                                  </div>
	                                  <!-- 스크롤박스 -->
	                                  <div class="scroll"style="overflow:auto; width:380px; height:213px; margin: -10px 20px 20px 20px">
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  </div>
	                                </div>
	                              </div>
	                            </div>        
	                          </div>  
	                          <!-- 이동버튼 -->
	                          <br><br><br><br><br><br>
	                          <div class="bdiv">
	                            <label>></label>
	                            <label><</button>                              
	                          </div>
	                          <!-- 오른쪽박스 -->
	                          <div class="mdiv2">
	                            <div class="row">
	                              <div class="col-lg-6">
	                                <div class="card mb-grid div3 div3-1">
	                                  <div style="float: left;">
	                                    <input class="form-control mb-2 search1" type="text" placeholder="이름 검색">
	                                    <i data-feather="search" style="margin: -80px -160px 0px 200px;"></i>
	                                  </div>
	                                  <!-- 스크롤박스 -->
	                                  <div class="scroll"style="overflow:auto; width:380px; height:213px; margin: -10px 20px 20px 20px">
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  <br>
	                                  <!-- 한명에 대한 정보 -->
	                                  <div class="profile-area" style="margin: 0px 350px 0px 0px;">
	                                    <img src="resources/images/defaultProfile.jpg" alt="프로필이미지" style="border-radius: 50%; width:40px">
	                                    <div style="margin: -42px -200px 0px 50px; float: left;">
	                                      <span id="profile-name" style="float: left"><b>홍길동</b></span><br>
	                                      <span id="department-name" style="font-size: 14px;">인사부서/대리</span>
	                                      <div class="form-check check1">
	                                        <label class="form-check-label">
	                                          <input class="form-check-input" type="checkbox" style="margin: -70px -100px 70px 251px;">
	                                        </label>
	                                      </div>
	                                    </div>
	                                  </div>
	                                  </div>
	                                </div>
	                              </div>
	                            </div>        
	                          </div>
	                          <!-- 제출버튼 -->
	                          <button type="submit" class="btn btn-primary btn1" style="width: 14%; height: 40px;">프로젝트 생성</button>
	                        </div>       
	                    </form>
	                  </div>
	                </div>
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
