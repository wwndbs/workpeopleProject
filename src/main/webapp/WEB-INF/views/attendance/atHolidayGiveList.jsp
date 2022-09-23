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

<!-- 장서원 / 근태관리_사원휴가관리 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		
	<!-- 컨텐츠 부분 wrapper -->
      <div class="adminx-content">
        <div class="adminx-main-content">

          <span style="margin-left:20px;"><b>사원 휴가 관리</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper">
              <!--테이블부분-->
              <div class="commute" style="width:100%; height:100%;">
                
                <div class="attendence-area">                 

                  <div class="commute-table-area">

                    <div style="padding-left:15px; width:100%;">
                                                               
                      <!-- 검색폼 -->
                      <div style="display:flex; padding-top:30px; padding-bottom:30px; margin:0 auto;">

                        <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#holiday-give" data-backdrop="static" style="height:40px; margin-right:5px;">휴가 지급</button>
						<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#holiday-recall" data-backdrop="static" style="height:40px; margin-left:5px; margin-right:10px;">휴가 초기화</button>
                        <!--<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#holiday-bonus" data-backdrop="static" style="height:40px; margin-right:420px;">보너스 휴가지급</button>-->

                        <div class="form-group1">
                          <select class="form-control select1" id="searchDep" name="searchDep" style="width:100px; height:40px;">
                            <option value="dept0" class="op1" selected>부서전체</option>
                            <option class="text-secondary" value="dept1"><label class="se-la">개발</label></option>
                            <option class="text-secondary" value="dept2"><label class="se-la">영업</label></option>
                            <option class="text-secondary" value="dept3"><label class="se-la">인사</label></option>
                            <option class="text-secondary" value="dept4"><label class="se-la">총무</label></option>
                            <option class="text-secondary" value="dept5"><label class="se-la">회계</label></option>
                          </select>
                        </div>
                        <div class="form-group2">
                          <select class="form-control select2" id="rank" name="rank" style="width:100px; height:40px;">
                            <option value="rank0" class="op2" selected>직급전체</option>
                            <option class="text-secondary" value="rank1"><label class="se-la">부장</label></option>
                            <option class="text-secondary" value="rank2"><label class="se-la">팀장</label></option>
                            <option class="text-secondary" value="rank3"><label class="se-la">과장</label></option>
                            <option class="text-secondary" value="rank4"><label class="se-la">대리</label></option>
                            <option class="text-secondary" value="rank5"><label class="se-la">사원</label></option>
                          </select>
                        </div>
                        <div class="search-div" style="width:20%; display:flex; ">
                          <input class="form-control mb-2 search1" name="keyword" id="keyword" type="text" type="text" placeholder="사원명을 입력해주세요." style="height:40px;">
                          <button type="button" class="btn btn-sm btn-primary" style="width:60px; height:40px;" onclick="selectSearchList(1);">검색</button>
                        </div>
						<!--  
                        <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#service-year" data-backdrop="static" style="height:40px; margin-left:420px;">근속연수 조회</button>
                        <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#holiday-recall" data-backdrop="static" style="height:40px; margin-left:15px; margin-right:15px;">휴가 초기화</button>
						-->
                      </div>
                      
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" id="atHolidayGiveList" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col"><input type="checkbox" id="checkbox" name="checkbox"></th>
                              <th scope="col">사원번호</th>
                              <th scope="col">부서</th>
                              <th scope="col">사원명</th>
                              <th scope="col">직급</th>
                              <th scope="col">입사일</th>
                              <th scope="col">근속연수</th>
                              <th scope="col">잔여휴가일수</th>
                            </tr>
                          </thead>
                          <tbody>
							 <!-- 조회 리스트 넣을 자리 -->
                          </tbody>
                        </table>

                        <div class="card-footer d-flex justify-content-end commute-pasing" style="justify-content:center !important;">
                         	 <!-- 페이징바 넣을 자리 -->
                        </div>
                      </div>
                    <!-- // Table seamless -->
                    
                    <!-- 검색시 ajax로 결과 리스트 조회 -->                    
                    <script>
                    	
                    	$(function(){
                    		
                    		selectSearchList(1);
                    		
                    	})
                    
                    	function selectSearchList(cpage) {
                    		console.log($("#keyword").val());
                    		
                    		$.ajax({
                    			url:"atHolidayGiveList.at",
                    			data : {
                    				cpage:cpage,
                    				searchDep:$("#searchDep option:selected").val(),
                    				rank:$("#rank option:selected").val(),
                    				keyword:$("#keyword").val()
                    			},
                    			success:function(result){
                    				let list = result.list;
                    				let pi = result.pi;
                    				let value = "";
                    				let pageValue = "";
                    				
                    				console.log(pi);
                    				console.log(list);
                    				
                    				if(list.length == 0) {
                    					value += '<tr>'
                          					  +    '<td colspan="9">조회 내역이 없습니다.</td>'
                              			      +  '</tr>'
                    				}else{
                    					for(let i=0; i<list.length; i++){
                    						value += '<tr>'
			  			                          +    	 '<td><input type="checkbox" id="checkbox" name="checkbox"></td>'
			  			                          +    	 '<td>' + list[i].userNo + '</td>'
			  			                          +   	 '<td>' + list[i].depName + '</td>'
			  			                          +   	 '<td>' + list[i].userName + '</td>'
			  			                          +   	 '<td>' + list[i].jobName + '</td>'
			  			                          +   	 '<td>' + list[i].createDate + '</td>'
			  			                          +   	 '<td>' + list[i].serviceYear + '</td>'
			  			                          +    	 '<td>' + list[i].vacationCount + '</td>'
			  			                          +  '</tr>';
                    					};
                    					
                    					if(pi.currentPage = 1){
                    						pageValue += '<ul class="pagination pagination-clean pagination-sm mb-0">'
                                            		  +		'<li class="page-item disabled">'
                      	                              +   	  '<a class="page-link" href="" tabindex="-1">‹</a>'
                        	                          +  	'</li>'
                    					}else{
                    						pageValue +=  '<ul class="pagination pagination-clean pagination-sm mb-0">'
                                      				  + 	'<li class="page-item">'
            	                             		  +			'<a class="page-link" onclick="selectSearchList(' + (pi.currentPage - 1) + ')" tabindex="-1">‹</a>'
            	                             		  +     '</li>'
                    					}
                    					
                    					for(let p=pi.startPage; p<=pi.endPage; p++) { 
                    						
                    						if(p == pi.currentPage) { 
                    							pageValue += '<li class="page-item active">'
	              									  +	 	'<a class="page-link" disabled>' + p + '</a>'
	              									  +  '</li>'                    							
                    						}else {
                    							pageValue += '<li class="page-item active">'
		              									  +	 	'<a class="page-link" onclick="selectSearchList(' + p + ')">' + p + '</a>'
		              									  +  '</li>'
		                    						}                    						
                    						
                    					}
                    					
                    					 if(pi.currentPage = pi.maxPage) {
                    						 pageValue += 	'<li class="page-item disabled">'
             	                              		   +  		 '<a class="page-link" href="">›</a>'
                	                            	   +  	'</li>'
			                	                       +  '</ul>'
			                                           +'</div>'                             					
                                         }else {
                                         	 pageValue += '<li class="page-item">'
             	                             		   +   '<a class="page-link" onclick="selectSearchList(' + (pi.currentPage + 1) + ')">›</a>'
             	                             		   +  '</li>'
			                	                       +    '</ul>'
			                                           +   '</div>'
                              					
                                         }         					       		
                    					
                    					
                    				}
                    				
                    				$("#atHolidayGiveList tbody").html(value);
                                    $(".commute-pasing").html(pageValue); 
                    				
                    			}, error:function(){
                    				console.log("조회 실패");
                    			}		                  			
                    		})
                    	}
                    
                    </script>

                  </div>

                </div>

              </div>

            </div>

          </div>
        </div>
      </div>
    </div>
    
    <!-- 휴가지급 모달 -->
    <form action="" method="POST">
	    <div class="modal" id="holiday-give">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h6 class="modal-title">휴가지급</h6>
	                    <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
	                </div>
	                <!-- Modal body -->
	                <div class="modal-body" style="text-align:center;">
	                    전 사원에게 휴가 13일을 <br>
						지급하시겠습니까? <br>
						(단, 근속연수 1년 미만 사원 제외)
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer" style="justify-content:center;">
		                <button type="submit" class="btn btn-jyok" id="holiday-give-btn">지급</button>	                
		                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
    
    <!-- 보너스 휴가지급 모달 -->
    <form action="" method="POST">
	    <div class="modal" id="holiday-bonus">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h6 class="modal-title">보너스 휴가지급</h6>
	                    <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
	                </div>
	                <!-- Modal body -->
	                <div class="modal-body" style="text-align:center;">
	                    <table style="display:inline-block;">
	                    	<tr>
	                    		<td>휴가일수 : </td>
	                    		<td style="padding-left:15px;"><input type="number" style="width:100px;"></td>
	                    	</tr>
	                    </table>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer" style="justify-content:center;">
		                <button type="submit" class="btn btn-jyok" id="holiday-bonus-btn">지급</button>	                
		                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
    
    <!-- 근속연수 조회 모달 -->
    <form action="" method="POST">
	    <div class="modal" id="service-year">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h6 class="modal-title">근속연수 조회</h6>
	                    <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
	                </div>
	                <!-- Modal body -->
	                <div class="modal-body" style="text-align:center;">
	                    <table style="display:inline-block;">
	                    	<tr>
	                    		<td>근속연수 : </td>
	                    		<td style="padding-left:15px;"><input type="number" style="width:100px;"></td>
	                    	</tr>
	                    </table>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer" style="justify-content:center;">
		                <button type="submit" class="btn btn-jyok" id="service-year-btn">조회</button>	                
		                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
    
    <!-- 휴가 초기화 모달 -->
    <form action="" method="POST">
	    <div class="modal" id="holiday-recall">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h6 class="modal-title">휴가 초기화</h6>
	                    <button type="button" class="modal_close" data-dismiss="modal">&times;</button>
	                </div>
	                <!-- Modal body -->
	                <div class="modal-body" style="text-align:center;">
	                    전 사원의 휴가일수를<br>
						초기화하시겠습니까?
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer" style="justify-content:center;">
		                <button type="submit" class="btn btn-danger" id="holiday-recall-btn" style="height:37px;">초기화</button>	                
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