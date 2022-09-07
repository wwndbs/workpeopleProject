<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<title>워크피플</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--bootstrap css-->
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/dist/css/adminx.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"/>

	<style>
	  .row{
	    width:100%;
	    height: 320px;
	    margin: 0px 0px -5px -13px;
	  }
	  .color{
	    background-color:rgb(118, 194, 252);
	    width: 5%;
	    height: 90.7%;
	  }
	  .font1{
	    font-weight: bold;
	    font-size: 90%;
	  }
	  .font2{font-size: 75%;}
	  .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14)}
	  .box1{cursor : pointer}
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
              <h5 style="font-weight: 400"><b>My Team</b></h2>
            </div>

            <!--프로젝트 박스-->
            <div class="row">
              <!-- 박스 한개 -->
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color2"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <hr>

            <div class="pb-3" style="margin: 30px 0px 0px 0px">
              <h5 style="font-weight: 350"><b>참여중인 프로젝트</b></h2>
            </div>

            <div class="row">
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="color"></div>
                <div class="card mb-grid w-100 box1">
                  <div class="card-body d-flex flex-column">                                            
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        <div style="float:right; font-size: 80%; margin: 0px -270px 0px 0px;">
                          <label for="">수정</label>
                          <label for="">삭제</label>
                        </div>
                        <br>
                        <label class="font1">&nbsp;&nbsp;프로젝트명</label><br>                        
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font2">&nbsp;&nbsp;참여팀1</label><br>
                        <label class="font3" style="margin: 10px 0px 0px 0px;">&nbsp;&nbsp;기획중</label>
                      </h5>
                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right;"></i>
                      <label for="" style="margin: 230px 0px -20px 0px;">23</label>
                    </div>
                  </div>
                </div>
              </div>          
            </div>

            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- If you prefer jQuery these are the required scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap//dist/js/vendor.js"></script>
    <script src="resources/bootstrap//dist/js/adminx.js"></script>

    <!-- bootstrap -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap//dist/js/vendor.js"></script>
    <script src="resources/bootstrap//dist/js/adminx.js"></script>
</body>
</html>













