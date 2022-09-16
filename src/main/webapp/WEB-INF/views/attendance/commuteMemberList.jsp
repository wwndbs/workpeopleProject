<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
  <style>

    .adminx-main-content {
		padding-top:5px !important;
    }

  </style>
</head>
<body>

<!-- 장서원 / 근태관리_사원별 출퇴근 현황 조회 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
		      <!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>사원별 출퇴근 현황 조회</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper">
              <!--DatePicker부분-->
              <div class="date-picker" style="width:100%; height:100%;">
                
                <div class="attendence-area">
                  
                  <div class="date-picker-area" style="height:25vh; margin-top:15px; text-align:center;">
                    달력 넣을 부분
                  </div>

                  <div class="commute-table-area">

                    <div style="padding-left:15px; width:100%;">
                      
                      <div style="display:inline-block; text-align:center;">
                        <strong>* 2022-09-05 출퇴근 현황</strong>
                      </div>
                      
                      <!-- 검색폼 -->
                      <form action="" method="get" id="search-form">
	                      <div style="display:flex; padding-top:10px;">
	
	                        <div class="form-group">
	                          <select class="form-control select1" id="select-dept" name="demoStyle" style="height:40px;">
	                            <option value="default" class="op1">전체</option>
	                            <option class="text-secondary" value="secondary"><label class="se-la">개발</label></option>
	                            <option class="text-secondary" value="secondary"><label class="se-la">영업</label></option>
	                            <option class="text-secondary" value="secondary"><label class="se-la">인사</label></option>
	                            <option class="text-secondary" value="secondary"><label class="se-la">총무</label></option>
	                            <option class="text-secondary" value="secondary"><label class="se-la">회계</label></option>
	                          </select>
	                        </div>
	                        <div class="search-div" style="width:20%; display:flex; ">
	                          <input class="form-control mb-2 search1" type="text" placeholder="사원명을 입력해주세요." style="height:40px;">
	                          <button type="submit" class="btn btn-sm btn-primary" style="height:40px;">검색</button>
	                        </div>  
	                        
	                        <button type="button" class="btn btn-sm btn-danger" id="commute-modify-btn01" onclick="location.href='commuteMemUpdate.at'">출퇴근기록 수정요청 현황</button>
	                        
                          </div>                      
                       </form>                         
                      
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">사원번호</th>
                              <th scope="col">부서</th>
                              <th scope="col">사원명</th>
                              <th scope="col">직급</th>
                              <th scope="col">출근시간</th>
                              <th scope="col">퇴근시간</th>
                              <th scope="col">근무시간</th>
                              <th scope="col">비고</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>00000000</td>
                              <td>개발</td>
                              <td>홍길동</td>
                              <td>대리</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>개발</td>
                              <td>강개똥</td>
                              <td>사원</td>
                              <td>-</td>
                              <td>-</td>
                              <td>-</td>
                              <td>연차</td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>영업</td>
                              <td>홍길순</td>
                              <td>부장</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>회계</td>
                              <td>홍길녀</td>
                              <td>과장</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>인사</td>
                              <td>강개순</td>
                              <td>팀장</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>개발</td>
                              <td>홍길동</td>
                              <td>대리</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>개발</td>
                              <td>강개똥</td>
                              <td>사원</td>
                              <td>-</td>
                              <td>-</td>
                              <td>-</td>
                              <td>연차</td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>영업</td>
                              <td>홍길순</td>
                              <td>부장</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>회계</td>
                              <td>홍길녀</td>
                              <td>과장</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
                            </tr>
                            <tr>
                              <td>00000000</td>
                              <td>인사</td>
                              <td>강개순</td>
                              <td>팀장</td>
                              <td>09:00</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td></td>
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
      </div>
    </div>
		
		
		
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>