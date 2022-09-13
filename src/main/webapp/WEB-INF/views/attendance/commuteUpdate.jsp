<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>

    .adminx-main-content {
      padding-top:5px !important;
    }

  </style>
</head>
<body>

<!-- 장서원 / 근태관리_출퇴근기록 수정요청 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
		<!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>출퇴근기록 수정요청</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper">
              <!--DatePicker부분-->
              <div class="date-picker" style="width:100%; height:100%;">
                
                <div class="attendence-area">                 

                  <div class="commute-table-area">

                    <div style="padding-left:15px; padding-top:15px; width:100%;">
                      
                      <div style="display:inline-block; text-align:center;">
                        <strong>* 2022-08-01 ~ 2022-08-31 강보람님의 출퇴근기록</strong>
                      </div>                     
                      
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px; margin-top:15px;">
                        
                        <table class="table table-hover mb-0" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">일자</th>
                              <th scope="col">요일</th>
                              <th scope="col">출근시간</th>
                              <th scope="col">퇴근시간</th>
                              <th scope="col">근무상태</th>
                              <th scope="col">근태기록 수정요청</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:23</td>
                                <td>18:00</td>
                                <td>지각</td>
                                <td><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#commute-request-modal" data-backdrop="static">수정요청</button></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>-</td>
                                <td>-</td>
                                <td>결근</td>
                                <td><button class="btn btn-sm btn-danger" onclick="location.href=''">결근사유서 작성</button></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2022-08-01</td>
                                <td>월</td>
                                <td>09:00</td>
                                <td>18:00</td>
                                <td>정상</td>
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
    
    <!-- 출퇴근기록 수정요청 모달 -->
    <form action="" method="POST">
	    <div class="modal" id="commute-request-modal">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h6 class="modal-title">출퇴근기록 수정요청</h6>
	                    <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
	                </div>
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <table style="margin-left:50px;">
	                    	<tr>
	                    		<td>근무일</td>
	                    		<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
	                    		<td style="padding-left:15px;"><input type="text" style="width:100px;" readonly></td>
	                    	</tr>
	                    	<tr>
	                    		<td>근무시간</td>
	                    		<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
	                    		<td style="padding-left:15px;"><input type="time" name="" value="" style="width:120px;" readonly>&nbsp;~&nbsp;<input type="time" name="" value="" style="width:120px;" readonly></td>
	                    	</tr>
	                    	<tr>
	                    		<td>수정요청시간</td>
	                    		<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
	                    		<td style="padding-left:15px;"><input type="time" name="" value="" style="width:120px;">&nbsp;~&nbsp;<input type="time" name="" value="" style="width:120px;"></td>
	                    	</tr>
	                    	<tr>
	                    		<td>요청사유 작성</td>
	                    		<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
	                    		<td style="padding-left:15px;"><textarea style="resize:none; width:258px; height:60px;"></textarea></td>
	                    	</tr>
	                    </table>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer" style="justify-content:center;">
		                <button type="submit" class="btn btn-jyok" id="commute-request-modal-btn">제출</button>	                
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