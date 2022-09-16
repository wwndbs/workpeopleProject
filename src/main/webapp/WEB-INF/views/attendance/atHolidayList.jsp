<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
  <style>

    .adminx-main-content {
      padding-top:5px !important;
    }

  </style>
<script src="https://kit.fontawesome.com/8fdc8bab0d.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- 장서원 / 근태관리_휴가관리 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
		      <!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>강보람님의 2022년 휴가</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper2">
              
              <div class="holiday-main">
                
                <table class="top-table" style="width:80%;">
                  <tr>
                    <td style="text-align:right;"><i class="fa-solid fa-gift fa-3x"></i></td>
                    <td style="text-align:center;">
                      <span class="span-top">
                        총 휴가
                      </span> <br>
                      <span class="span-bottom">
                        13개
                      </span>
                    </td>
                    <td style="text-align:center;"><hr style="border:1px solid LightGray; width:0; height:100px;"></td>
                    <td style="text-align:right;"><i class="fa-solid fa-check fa-3x"></i></td>
                    <td style="text-align:center;">
                      <span class="span-top">
                        사용 휴가
                      </span> <br>
                      <span class="span-bottom">
                        3개  
                      </span>
                    </td>
                    <td style="text-align:center;"><hr style="border:1px solid LightGray; width:0; height:100px;"></td>
                    <td style="text-align:right;"><i class="fa-regular fa-calendar fa-3x"></i></td>
                    <td style="text-align:center;">
                      <span class="span-top">
                        잔여 휴가
                      </span> <br>
                      <span class="span-bottom">
                        10개  
                      </span>
                    </td>
                  </tr>
                </table>

              </div>  

              <!--검색필터 부분-->
              <div class="holiday-blank" style="width:100%; height:100%;">
                
                <div class="attendence-area">
                  
                  <div class="filter-area" style="height:7.5vh; margin-top:20px; margin-left:15px;">
                    
                    <form action="" method="get" id="search-form">
                      <table>                        
                        <tr style="height:50px;">
                          <td><b>휴가사용기간</b></td>
                          <td>
                            <select class="form-control select1" id="select-dept" name="demoStyle" style="width:250px; margin-left:15px;">
                              <option value="default" class="op1">전체</option>
                              <option class="text-secondary" value="secondary"><label class="se-la">2022-01-01~2022-12-31</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">2021-01-01~2022-12-31</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">2020-01-01~2022-12-31</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">2019-01-01~2022-12-31</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">2018-01-01~2022-12-31</label></option>
                            </select>
                          </td>
                          <td colspan="3"><button type="submit" class="btn btn-sm btn-secondary" style="width:50px; height:40px;">조회</button></td>
                          <td colspan="3"><button type="button" class="btn btn-sm btn-primary" style="margin-left:15px; height:40px;" onclick="location.href='vacation.ap'">휴가신청</button></td>
                        </tr>
                      </table>
                    </form>

                     </div>
                 </div>
                </div>

                <div class="commute-table-area holiday-manage">

                    <div style="padding-left:15px; width:100%;">
                      
                      <div style="display:inline-block; text-align:center; margin-top:15px; margin-bottom:15px;">
                        <strong>2022-01-01 ~ 2022-12-31 휴가사용내역</strong>
                      </div>
                                                                  
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">휴가신청일자</th>
                              <th scope="col">휴가종류</th>
                              <th scope="col">사유</th>
                              <th scope="col">휴가사용기간</th>
                              <th scope="col">차감일수</th>
                              <th scope="col">승인내역</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>2022-09-05</td>
                              <td>연차</td>
                              <td>휴가갑니다.</td>
                              <td>2022-09-06~2022-09-06</td>
                              <td>1</td>
                              <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>결제대기</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>연차</td>
                                <td>휴가갑니다.</td>
                                <td>2022-09-06~2022-09-06</td>
                                <td>1</td>
                                <td>승인</td>
                            </tr>
                          </tbody>
                        </table>
                        
                      </div>
                    <!-- // Table seamless -->

                  </div>

                </div>

          </div>
        </div>
      </div>
    </div>
		
		
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>