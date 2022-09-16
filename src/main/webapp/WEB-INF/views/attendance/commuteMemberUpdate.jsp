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
</head>
<body>

<!-- 장서원 / 근태관리_출퇴근 기록 수정요청 현황 조회 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
		      <!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>출퇴근 기록 수정요청 현황</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper">
              <!--테이블부분-->
              <div class="commute" style="width:100%; height:100%;">
                
                <div class="attendence-area">                 

                  <div class="commute-table-area">

                    <div style="padding-left:15px; width:100%;">
                                                               
                      <!-- 검색폼 -->
                      <div style="display:flex; padding-top:15px; margin:0 auto;">

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

                      </div>
                      
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">근무날짜</th>
                              <th scope="col">사원번호</th>
                              <th scope="col">부서</th>
                              <th scope="col">사원명</th>
                              <th scope="col">직급</th>
                              <th scope="col">출퇴근시간</th>
                              <th scope="col">수정요청시간</th>
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
                              <td>09:30~18:00</td>
                              <td>09:00~18:00</td>
                              <td><button class="btn btn-pill btn-sm btn-primary" data-toggle="modal" data-target="#commute-modify-modal" data-backdrop="static">승인대기</button></td>
                            </tr>
                            <tr>
                                <td>2022-09-05</td>
                                <td>00000000</td>
                                <td>개발</td>
                                <td>홍길녀</td>
                                <td>대리</td>
                                <td>09:20~18:00</td>
                                <td>09:00~18:00</td>
                                <td><button class="btn btn-pill btn-sm btn-primary" data-toggle="modal" data-target="#commute-modify-modal" data-backdrop="static">승인대기</button></td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
                                <td>승인완료</td>
                            </tr>
                            <tr>
                                <td>2022-09-02</td>
                                <td>00000000</td>
                                <td>영업</td>
                                <td>홍길순</td>
                                <td>대리</td>
                                <td>09:15~18:00</td>
                                <td>09:00~18:00</td>
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
    
    <!-- 출퇴근기록 수정요청현황 모달 -->
    <form action="" method="POST">
	    <div class="modal" id="commute-modify-modal">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h6 class="modal-title">사원 출퇴근기록 수정</h6>
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
	                    		<td style="padding-left:15px;"><input type="time" name="" value="" style="width:120px;">&nbsp;~&nbsp;<input type="time" name="" value="" style="width:120px;"></td>
	                    	</tr>
	                    	<tr>
	                    		<td>수정요청시간</td>
	                    		<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
	                    		<td style="padding-left:15px;"><input type="time" name="" value="" style="width:120px;" readonly>&nbsp;~&nbsp;<input type="time" name="" value="" style="width:120px;" readonly></td>
	                    	</tr>
	                    	<tr>
	                    		<td>요청사유 작성</td>
	                    		<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
	                    		<td style="padding-left:15px;"><textarea style="resize:none; width:258px; height:60px;" readonly></textarea></td>
	                    	</tr>
	                    </table>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer" style="justify-content:center;">
		                <button type="submit" class="btn btn-jyok" id="commute-modify-modal-btn">수정</button>	                
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