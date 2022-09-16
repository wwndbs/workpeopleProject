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

<!-- 장서원 / 근태관리_연장근무내역 조회 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
	  <!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>강보람님의 7월 연장근무</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper2">
              
              <div class="holiday-main">
                
                <table class="top-table" style="width:80%;">
                  <tr>
                    <td style="text-align:right;"><i class="fa-regular fa-clock fa-3x"></i></td>
                    <td style="text-align:center; ">
                      <span class="span-top">
                        총 연장근무 시간
                      </span> <br>
                      <span class="span-bottom">
                        7시간
                      </span>
                    </td>
                    <td style="text-align:center;"><hr style="border:1px solid LightGray; width:0; height:100px;"></td>
                    <td style="text-align:right;"><i class="fa-solid fa-check fa-3x"></i></td>
                    <td style="text-align:center;">
                      <span class="span-top">
                        연장근무 가능시간
                      </span> <br>
                      <span class="span-bottom">
                        13시간  
                      </span>
                    </td>
                    <td style="text-align:center;"><hr style="border:1px solid LightGray; width:0; height:100px;"></td>
                    <td style="text-align:right;"><i class="fa-solid fa-briefcase fa-3x"></i></td>
                    <td style="text-align:center;">
                      <span class="span-top">
                        연장근무 일수
                      </span> <br>
                      <span class="span-bottom">
                        4일  
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
                          <td><b>연장근무조회</b></td>
                          <td style="padding-left:15px;">
                            <input type="date" id="start-date" style="height:40px;">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input type="date" id="end-date" style="height:40px;">
                          </td>
                          <td colspan="3"><button type="submit" class="btn btn-sm btn-secondary" style="width:50px; height:40px;">조회</button></td>
                          <td colspan="3"><button type="button" class="btn btn-sm btn-primary" style="margin-left:15px; height:40px;" onclick="location.href='overtime.ap'">연장근무신청</button></td>
                        </tr>
                      </table>
                    </form>

                     </div>
                 </div>
                </div>

                <div class="commute-table-area holiday-manage">

                    <div style="padding-left:15px; width:100%;">
                      
                      <div style="display:inline-block; text-align:center; margin-top:15px; margin-bottom:15px;">
                        <strong>2022-07-01 ~ 2022-07-31 연장근무내역</strong>
                      </div>
                                                                  
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">연장근무일자</th>
                              <th scope="col">요일</th>
                              <th scope="col">연장근무시간</th>
                              <th scope="col">사유</th>
                              <th scope="col">소요시간</th>
                              <th scope="col">승인내역</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>2022-07-05</td>
                              <td>화</td>
                              <td>19:00~22:00</td>
                              <td>사유사유사유</td>
                              <td>3</td>
                              <td>결제대기</td>
                            </tr>
                            <tr>
                              <td>2022-07-05</td>
                              <td>화</td>
                              <td>19:00~22:00</td>
                              <td>사유사유사유</td>
                              <td>3</td>
                              <td>결제대기</td>
                            </tr>
                            <tr>
                              <td>2022-07-05</td>
                              <td>화</td>
                              <td>19:00~22:00</td>
                              <td>사유사유사유</td>
                              <td>3</td>
                              <td>결제대기</td>
                            </tr>
                            <tr>
                              <td>2022-07-05</td>
                              <td>화</td>
                              <td>19:00~22:00</td>
                              <td>사유사유사유</td>
                              <td>3</td>
                              <td>결제대기</td>
                            </tr>
                            <tr>
                              <td>2022-07-05</td>
                              <td>화</td>
                              <td>19:00~22:00</td>
                              <td>사유사유사유</td>
                              <td>3</td>
                              <td>결제대기</td>
                            </tr>
                          </tbody>
                        </table>
                        
                        <div class="card-footer d-flex justify-content-end" style="justify-content:center !important;">
                          <ul class="pagination pagination-clean pagination-sm mb-0">
                            <li class="page-item disabled">
                              <a class="page-link" href="#" tabindex="-1">‹</a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item">
                              <a class="page-link" href="#">›</a>
                            </li>
                          </ul>
                        </div>

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