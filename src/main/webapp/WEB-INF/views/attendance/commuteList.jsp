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
<!-- 아이콘_폰트어썸 -->
<script src="https://kit.fontawesome.com/8fdc8bab0d.js" crossorigin="anonymous"></script>

</head>
<body>

<!-- 장서원 / 근태관리_출퇴근기록 페이지 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
		<!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>강보람님의 출퇴근기록</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper2">
              
              <!-- 상단 div 영역 -->
              <div class="commute-main">
                
                <div class="commute-1">
                  <table class="commute-table">
                    <tr height="10px">
                      <td colspan="2" style="padding-top:30px; font-size:15px;">
                        <span><b>
                          2022-09-08(목)
                        </b></span>
                      </td>
                    </tr>
                    <tr height="30px">
                      <td colspan="2" style="font-size:30px; padding-bottom:0px !important;">
                        <span><b>
                          09:11:30
                        </b></span>
                      </td>
                    </tr>
                    <tr height="40px">
                      <td style="padding-top:10px; padding-left:30px !important; padding-right:0px !important; font-size:15px;">
                        <span><b>
                          출근시간 &nbsp;&nbsp;&nbsp; : <br>
                          퇴근시간 &nbsp;&nbsp;&nbsp; : 
                        </b></span>
                      </td>
                      <td style="padding-top:10px; padding-left:0px !important; padding-right:40px !important; font-size:15px;">
                        <span><b>
                          08:50 <br>
                          미등록 
                        </b></span>
                      </td>
                    </tr>
                    <tr height="3px">
                      <td colspan="2"><hr style="height:3px; color:black;"></td>
                    </tr>
                    <tr height="60px">
                      <td colspan="2" style="padding-bottom:20px;">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#commute-start-modal" data-backdrop="static" style="width:35%; margin-right:10px;">출근</button>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#commute-end-modal" data-backdrop="static" style="width:35%; margin-left:10px;">퇴근</button>
                      </td>
                    </tr>
                  </table>
                </div>

                <div class="commute-2">
                  <table class="commute-table">
                    <tr height="60px">
                      <td colspan="2" style="padding-top:15px;">
                        <i class="fa-regular fa-clock" style="font-size:25px; margin-right:15px;"></i>
                        <span><b>이번달 근무현황</b></span>
                      </td>
                    </tr>
                    <tr height="10px">
                      <td colspan="2"><hr style="height:3px; color:black;"></td>
                    </tr>
                    <tr height="40px">
                      <td><span><b>근무일수</b></span></td>
                      <td>9일</td>
                    </tr>
                    <tr height="40px">
                      <td><span><b>연장근무시간</b></span></td>
                      <td>9일</td>
                    </tr>
                    <tr height="40px">
                      <td><span><b>총 근무시간</b></span></td>
                      <td>9일</td>
                    </tr>
                  </table>
                </div>

                <div class="commute-3">
                  <table class="commute-table">
                    <tr height="60px">
                      <td colspan="2" style="padding-top:15px;">
                        <i class="fa-regular fa-clock" style="font-size:25px; margin-right:15px;"></i>
                        <span><b>이번달 근태현황</b></span>
                      </td>
                    </tr>
                    <tr height="10px">
                      <td colspan="2"><hr style="height:3px; color:black;"></td>
                    </tr>
                    <tr height="40px">
                      <td><span><b>지각</b></span></td>
                      <td>1회</td>
                    </tr>
                    <tr height="40px">
                      <td><span><b>결근</b></span></td>
                      <td>0회</td>
                    </tr>
                    <tr height="40px">
                      <td><span><b>연차</b></span></td>
                      <td>1회</td>
                    </tr>
                  </table>
                </div>

                <div class="commute-3">
                  <table class="commute-table">
                    <tr height="60px">
                      <td colspan="2" style="padding-top:15px;">
                        <i class="fa-regular fa-clock" style="font-size:25px; margin-right:15px;"></i>
                        <span><b>휴가현황</b></span>
                      </td>
                    </tr>
                    <tr height="10px">
                      <td colspan="2"><hr style="height:3px; color:black;"></td>
                    </tr>
                    <tr height="40px">
                      <td colspan="2"></td>
                    </tr>
                    <tr height="40px">
                      <td><span><b>잔여휴가</b></span></td>
                      <td>12일</td>
                    </tr>
                    <tr height="40px">
                      <td colspan="2"></td>
                    </tr>
                  </table>
                </div>

                <div class="commute-5">
                  <button type="button" class="btn btn-outline-danger" id="commute-btn01" onclick="location.href='commuteUpdate.at'">출퇴근기록 수정요청</button><br>
                  <button type="button" class="btn btn-outline-primary" id="commute-btn02" onclick="location.href='vacation.ap'">휴가 신청</button><br>
                  <button type="button" class="btn btn-outline-primary" id="commute-btn03" onclick="location.href='overtime.ap'">연장근무 신청</button>
                </div>

              </div>  

              <!--검색필터 부분-->
              <div class="commute-blank" style="width:100%; height:100%;">
                
                <div class="attendence-area">
                  
                  <div class="filter-area" style="height:7.5vh; margin-top:20px; margin-left:15px;">
                    
                    <form action="" method="get" id="search-form">
                      <table>                        
                        <tr style="height:50px;">
                          <td><b>기간조회</b></td>
                          <td style="padding-left:15px;">
                            <input type="date" id="start-date" style="height:40px;">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input type="date" id="end-date" style="height:40px;">
                          </td>
                          <td style="padding-left:15px;"><b>근무상태</b></td>
                          <td style="padding-top:10px; padding-left:15px;">
                            <input type="radio" id="status1" name="a-status" value="전체"><label name="status1" style="margin-left:5px;">전체</label>
                            <input type="radio" id="status2" name="a-status" value="정상" style="margin-left:10px;"><label name="status2" style="margin-left:5px;">정상</label>
                            <input type="radio" id="status3" name="a-status" value="지각" style="margin-left:10px;"><label name="status3" style="margin-left:5px;">지각</label>
                            <input type="radio" id="status4" name="a-status" value="연차" style="margin-left:10px;"><label name="status4" style="margin-left:5px;">연차</label>
                            <input type="radio" id="status5" name="a-status" value="결근" style="margin-left:10px;"><label name="status5" style="margin-left:5px;">결근</label>
                          </td>
                          <td colspan="3"><button type="submit" class="btn btn-sm btn-secondary" style="margin-left:15px; width:50px; height:40px;">조회</button></td>
                        </tr>
                      </table>
                    </form>

                     </div>
                 </div>
                </div>

                <div class="commute-table-area holiday-manage">

                    <div style="padding-left:15px; width:100%;">
                      
                      <div style="display:inline-block; text-align:center; margin-top:15px; margin-bottom:15px;">
                        <strong>2022-08-01 ~ 2022-08-31 출퇴근 기록</strong>
                      </div>
                                                                  
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">근무일자</th>
                              <th scope="col">요일</th>
                              <th scope="col">출근시간</th>
                              <th scope="col">퇴근시간</th>
                              <th scope="col">총 근무시간</th>
                              <th scope="col">근무상태</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>2022-09-05</td>
                              <td>월</td>
                              <td>08:50</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td>정상</td>
                            </tr>
                            <tr>
                              <td>2022-09-05</td>
                              <td>월</td>
                              <td>08:50</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td>정상</td>
                            </tr>
                            <tr>
                              <td>2022-09-05</td>
                              <td>월</td>
                              <td>08:50</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td>정상</td>
                            </tr>
                            <tr>
                              <td>2022-09-05</td>
                              <td>월</td>
                              <td>08:50</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td>정상</td>
                            </tr>
                            <tr>
                              <td>2022-09-05</td>
                              <td>월</td>
                              <td>08:50</td>
                              <td>18:00</td>
                              <td>08:00</td>
                              <td>정상</td>
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
    
	<!-- 출근 등록 모달 -->
	<form action="" method="POST">
		<div class="modal" id="commute-start-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<button type="button" class="modal_close" data-dismiss="modal" style="margin-left: 95%;">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body" style="text-align:center;">
					    출근등록 하시겠습니까?
					</div>
					<!-- Modal footer -->
					<div class="modal-footer" style="justify-content:center;">
						<button type="submit" class="btn btn-jyok" id="commute-start-btn">등록</button>
						<button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>					
					</div>
				</div>
			</div>
		</div>
    </form>
    
    <!-- 퇴근 등록 모달 -->
	<form action="" method="POST">
		<div class="modal" id="commute-end-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<button type="button" class="modal_close" data-dismiss="modal" style="margin-left: 95%;">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body" style="text-align:center;">
					    퇴근등록 하시겠습니까?
					</div>
					<!-- Modal footer -->
					<div class="modal-footer" style="justify-content:center;">
						<button type="submit" class="btn btn-jyok" id="commute-end-btn">등록</button>
						<button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
    </form>
    
    
    
    
    
		
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>