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

<!-- 장서원 / 근태관리_사원 휴가내역 조회 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
		      <!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>사원 휴가내역 조회</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper">
              <!--검색필터 부분-->
              <div class="date-picker" style="width:100%; height:100%;">
                
                <div class="attendence-area">
                  
                  <div class="filter-area" style="height:22vh; margin-top:30px; margin-left:40%;">
                    
                    <form action="" method="get" id="search-form">
                      <table>
                        <tr>
                          <td><b>기간조회</b></td>
                          <td><input type="date" id="start-date">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input type="date" id="end-date"></td>
                          <td></td>
                        </tr>
                        <tr style="height:50px;">
                          <td><b>휴가종류</b></td>
                          <td style="padding-top:10px;">
                            <input type="radio" id="status1" name="h-status" value="전체"><label name="status1" style="margin-left:5px;">전체</label>
                            <input type="radio" id="status2" name="h-status" value="정상" style="margin-left:10px;"><label name="status2" style="margin-left:5px;">연차</label>
                            <input type="radio" id="status3" name="h-status" value="지각" style="margin-left:10px;"><label name="status3" style="margin-left:5px;">병가</label>
                            <input type="radio" id="status4" name="h-status" value="연차" style="margin-left:10px;"><label name="status4" style="margin-left:5px;">경조사</label>
                            <input type="radio" id="status5" name="h-status" value="결근" style="margin-left:10px;"><label name="status5" style="margin-left:5px;">기타</label>
                          </td>
                          <td></td>
                        </tr>
                        <tr style="height:50px;">
                          <td><b>부서명</b></td>
                          <td>
                            <select class="form-control select1" id="select-dept" name="demoStyle" style="width:100px;">
                              <option value="default" class="op1">전체</option>
                              <option class="text-secondary" value="secondary"><label class="se-la">개발</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">영업</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">인사</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">총무</label></option>
                              <option class="text-secondary" value="secondary"><label class="se-la">회계</label></option>
                            </select>
                          </td>
                          <td></td>
                        </tr>
                        <tr>
                          <td style="width:70px;"><b>사원명</b></td>
                          <td><input class="form-control mb-2 search1" type="text" placeholder="사원명을 입력해주세요." style="margin-top:7px;"></td>
                          <td><button type="submit" class="btn btn-sm btn-primary" style="height:40px;">조회</button></td>
                        </tr>
                      </table>
                    </form>

                  </div>

                  <div class="commute-table-area">

                    <div style="padding-left:15px; width:100%;">
                      
                      <div style="display:inline-block; text-align:center; margin-bottom:15px;">
                        <strong>* 조회 결과 XX건</strong>
                      </div>
                                                                  
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">휴가일</th>
                              <th scope="col">사원번호</th>
                              <th scope="col">부서</th>
                              <th scope="col">사원명</th>
                              <th scope="col">직급</th>
                              <th scope="col">휴가종류</th>
                              <th scope="col">승인내역</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길동</td>
                                <td>대리</td>
                                <td>연차</td>
                                <td>승인완료</td>
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