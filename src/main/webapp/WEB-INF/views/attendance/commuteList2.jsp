<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
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

          <span style="margin-left:20px;"><b>${ loginUser.userName }님의 출퇴근기록</b></span> 

          <div class="container-fluid">

            <!--메인페이지 컨텐츠-->
            <div class="top-wrapper2">
              
              <!-- 상단 div 영역 -->
              <div class="commute-main">
                
         	       <div class="commute-1">
	                  <table class="commute-table">
	                  	<tr height="20px">
	                  	  <td colspan="2"></td>
	                  	</tr>
	                    <tr height="10px">
	                      <td colspan="2" style="padding-top:30px;">
							<div id="Clockday" style="font-size:15px !important; font-weight:bold; color:  color: rgb(0, 135, 239);;">00/00/00</div>
	                      </td>
	                    </tr>
	                    <tr height="30px">
	                      <td colspan="2" style="padding-bottom:10px !important;">
	                        <div id="Clock" style="font-size:35px !important; font-weight:bold; color: color: rgb(0, 135, 239);">00:00</div>
	                      </td>
	                    </tr>
	                    <tr height="50px">
	                      <td style="padding-top:15px; padding-left:30px !important; padding-right:0px !important; font-size:15px;">
	                        <span><b>
	                          출근시간 &nbsp;&nbsp;&nbsp; : <br>
	                          퇴근시간 &nbsp;&nbsp;&nbsp; : 
	                        </b></span>
	                      </td>
	                      <td style="padding-top:15px; padding-left:0px !important; padding-right:40px !important; font-size:15px;">
	                        <span style="color: gray;"><b>
	                          ${ todayStart } <br>
	                          ${ todayEnd } 
	                        </b></span>
	                      </td>
	                    </tr>
	                  </table>
	                </div>
	
	                <div class="commute-2">
	                  <table class="commute-table commute-table2">
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
	                      <td style="text-align:right; padding-right:100px;"><span><b>근무일수</b></span></td>
	                      <td style="text-align:left; padding-right:60px;">${ thisMonthWorkDay }일</td>
	                    </tr>
	                    <tr height="40px">
	                      <td style="text-align:right; padding-right:100px;"><span><b>연장근무시간</b></span></td>
	                      <td style="text-align:left; padding-right:60px;">${ thisMonthOvertime }일</td>
	                    </tr>
	                    <tr height="40px">
	                      <td style="text-align:right; padding-right:100px;"><span><b>총 근무시간</b></span></td>
	                      <td style="text-align:left; padding-right:60px;">${ thisMonthTotaltime }일</td>
	                    </tr>
	                  </table>
	                </div>
	
	                <div class="commute-3">
	                  <table class="commute-table">
	                    <tr height="60px">
	                      <td colspan="2" style="padding-top:15px;">
	                        <i class="fa-solid fa-briefcase" style="font-size:25px; margin-right:15px;"></i>
	                        <span><b>이번달 근태현황</b></span>
	                      </td>
	                    </tr>
	                    <tr height="10px">
	                      <td colspan="2"><hr style="height:3px; color:black;"></td>
	                    </tr>
	                    <tr height="40px">
	                      <td><span><b>지각</b></span></td>
	                      <td>${ thisMonthLate }회</td>
	                    </tr>
	                    <tr height="40px">
	                      <td><span><b>결근</b></span></td>
	                      <td>${ thisMonthAbsence }회</td>
	                    </tr>
	                    <tr height="40px">
	                      <td><span><b>연차</b></span></td>
	                      <td>${ thisMonthHoliday }회</td>
	                    </tr>
	                  </table>
	                </div>
	
	                <div class="commute-3">
	                  <table class="commute-table">
	                    <tr height="60px">
	                      <td colspan="2" style="padding-top:15px;">
	                        <i class="fa-solid fa-gift " style="font-size:25px; margin-right:15px;"></i>
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
	                      <td>${ thisMonthHolidayRemain }일</td>
	                    </tr>
	                    <tr height="40px">
	                      <td colspan="2"></td>
	                    </tr>
	                  </table>
	                </div>
	
	                <div class="commute-5">
	                	<div>
	                	  <button type="button" class="btn btn-outline-primary" id="commute-btn01" onclick="location.href='documentList.ap'">휴가 신청</button><br>	
		                  <button type="button" class="btn btn-outline-primary" id="commute-btn02" onclick="location.href='documentList.ap'">연장근무 신청</button><br>
		                  <button type="button" class="btn btn-outline-danger" id="commute-btn03" onclick="location.href='documentList.ap'">결근사유서 신청</button>
	                	</div>
	                </div>
	
	              </div>  
	
	              <!--검색필터 부분-->
	              <div class="commute-blank" style="width:100%; height:100%;">
	                
	                <div class="attendence-area">
	                  
	                  <div class="filter-area" style="height:7.5vh; margin-top:20px; margin-left:15px;">
	                    
	                    <form action="" method="get" id="search-form">
	                      <table>    	                                         
	                        <tr style="height:50px;">
	                          <!-- 
	                          <td><b>기간조회</b></td>
	                          <td style="padding-left:15px;">
	                            <input type="date" id="start-date" style="height:40px;">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input type="date" id="end-date" style="height:40px;">
	                          </td>
	                           --> 
	                          <td style="padding-left:15px;"><b>근무상태</b></td>
	                          <td style="padding-top:10px; padding-left:15px;">
	                            <input type="radio" class="radio-value" id="status1" name="cStatus" value="전체" checked><label name="status0" style="margin-left:5px;">전체</label>
	                            <input type="radio" class="radio-value" id="status2" name="cStatus" value="정상" style="margin-left:10px;"><label name="status1" style="margin-left:5px;">정상</label>
	                            <input type="radio" class="radio-value" id="status3" name="cStatus" value="지각" style="margin-left:10px;"><label name="status2" style="margin-left:5px;">지각</label>
	                            <input type="radio" class="radio-value" id="status4" name="cStatus" value="연차" style="margin-left:10px;"><label name="status3" style="margin-left:5px;">연차</label>
	                            <input type="radio" class="radio-value" id="status5" name="cStatus" value="결근" style="margin-left:10px;"><label name="status4" style="margin-left:5px;">결근</label>
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
	                        <strong>2022 ${ loginUser.userName }님의 출퇴근 기록</strong>
	                      </div>
	                                                                  
	                    </div>
	                    
	                    <!-- Table Seamless -->
	                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
	                        
	                        <table class="table table-hover mb-0" id="commuteList" style="text-align:center;">
	                          <thead>
	                            <tr>
	                              <th scope="col">근무일자</th>
	                              <th scope="col">요일</th>
	                              <th scope="col">출근시간</th>
	                              <th scope="col">퇴근시간</th>
	                              <th scope="col">근무상태</th>
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
                    		
                    		$.ajax({
                    			url:"commuteList.at?userNo=${loginUser.userNo}",
                    			data : {
                    				cpage:cpage,
                    				cStatus:$(".radio-value:checked").val(),
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
			  			                          +    	 '<td>' + list[i].atDate + '</td>'
			  			                          +   	 '<td>' + list[i].atDay + '</td>'
			  			                          +   	 '<td>' + list[i].atStart + '</td>'
			  			                          +   	 '<td>' + list[i].atEnd + '</td>'
			  			                          +   	 '<td>' + list[i].atStatus + '</td>'
			  			                          +  '</tr>';
                    					};
                    					
                    					if(pi.currentPage = 1){
                    						pageValue += '<ul class="pagination pagination-clean pagination-sm mb-0">'
                                            		  +		'<li class="page-item disabled">'
                      	                              +   	  '<a class="page-link" href="" tabindex="-1">' + '‹' + '</a>'
                        	                          +  	'</li>'
                    					}else{
                    						pageValue +=  '<ul class="pagination pagination-clean pagination-sm mb-0">'
                                      				  + 	'<li class="page-item">'
            	                             		  +			'<a class="page-link" onclick="selectSearchList(' + (pi.currentPage - 1) + ')" tabindex="-1">' + '‹' + '</a>'
            	                             		  +     '</li>'
                    					}
                    					
                    					for(let p=pi.startPage; p<=pi.endPage; p++) { 
                    						
                    						if(p == pi.currentPage) { 
                    							pageValue += '<li class="page-item active">'
	              									  +	 	'<a class="page-link" disabled>' + p + '</a>'
	              									  +  '</li>'                    							
                    						}else {
                    							pageValue += '<li class="page-item active">'
		              									  +	 	'<a class="page-link" onclick="selectSearchList(' + p + ')"' + '>' + p + '</a>'
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
                    				
                    				$("#commuteList tbody").html(value);
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
	    
   	<script>
	// 장서원 / 근태 부분 시계 구현
		function Clock() {
		    var date = new Date();
		    var YYYY = String(date.getFullYear());
		    var MM = String(date.getMonth() + 1);
		    var DD = Zero(date.getDate());
		    var hh = Zero(date.getHours());
		    var mm = Zero(date.getMinutes());
		    var ss = Zero(date.getSeconds());
		    var Week = Weekday();
		
		    Write(YYYY, MM, DD, hh, mm, ss, Week);
		   //시계 1의자리수가 나올때 0을 넣어주는 함수 (ex : 1초 -> 01초)
		
		    function Zero(num) {
		        return (num < 10 ? '0' + num : '' + num);
		    }
		
		   //요일을 추가해주는 함수
		    function Weekday() {
		        var Week = ['일', '월', '화', '수', '목', '금', '토'];
		        var Weekday = date.getDay();
		        return Week[Weekday];
		    }
		
		   //시계부분을 써주는 함수
		    function Write(YYYY, MM, DD, hh, mm, ss, Week) {
		        var Clockday = document.getElementById("Clockday");
		        var Clock = document.getElementById("Clock");
		        Clockday.innerText = YYYY + '/' + MM + '/' + DD + '(' + Week + ')';
		        Clock.innerText = hh + ':' + mm;
		    }
		}
		
		setInterval(Clock, 1000); //1초(1000)마다 Clock함수 재실행
		
	</script>
	
 
		
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>