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
    
    .ui-datepicker {
		width: 13em !important;
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
                  
                  <!-- datePicker CDN -->
                  <link rel="stylesheet" href="http://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
                  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">
				  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
				  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
				  
				  <!-- datePicker 관련 script -->	
                  <script>
                 	 $.datepicker.setDefaults({
                 		 dateFormat: "yy-mm-dd",
                 		 prevText: "이전 달",
                 		 nextText: "다음 달",
                 		 monthNames: ["1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월"],
                 		 dayNames: ["일", "월", "화", "수", "목", "금", "토"],
                 		 dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                 		 showMonthAfterYear: true,
                 		 yearSuffix: "년",
                 		 maxDate: "2022-09-26",
                 		 monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월"]
                 		/*날짜가 선택되면 호출될 함수
                 		  onSelect: function (dateText) {
                 		    console.log(dateText)
                 		  },*/                 		  
                 	 });
                  
					 $(function() {
					  $('#datepicker').datepicker({
					    onSelect: function(dateText) {
					  $('#datepicker2').datepicker("setDate", $(this).datepicker("getDate"));
					    }
					  });
					});
					
					$(function() {
					  $("#datepicker2").datepicker();
					});
	                	

				  </script>
                  
                  <div class="date-picker-area" style="margin-top:15px; height:25vh; text-align:center;">
                                      
                    Date: <input type="text" id="datepicker2" disabled> <br>
					<div id="datepicker" style="height:100%; margin-top:5px; margin-left:44.65%;"></div>
                                        
                  </div>
                  

                  <div class="commute-table-area">

                    <div style="padding-left:15px; padding-bottom:2px; width:100%;">
                      <!--  
                      <div style="display:inline-block; text-align:center;">
                        <strong>* 2022-09-05 출퇴근 현황</strong>
                      </div>
                      -->
                      
                      <!-- 검색폼 -->

	                      <div style="display:flex; padding-top:15px;">
	
	                        <div class="form-group">
	                          <select class="form-control select1" id="searchDep" name="searchDep" style="height:40px;">
	                            <option value="dept0" class="op1" selected>전체</option>
	                            <option class="text-secondary" value="dept1"><label class="se-la">개발</label></option>
	                            <option class="text-secondary" value="dept2"><label class="se-la">영업</label></option>
	                            <option class="text-secondary" value="dept3"><label class="se-la">인사</label></option>
	                            <option class="text-secondary" value="dept4"><label class="se-la">총무</label></option>
	                            <option class="text-secondary" value="dept5"><label class="se-la">회계</label></option>
	                          </select>
	                        </div>
	                        <div class="search-div" style="width:20%; display:flex; ">
	                          <input class="form-control mb-2 search1" name="keyword" id="keyword" type="text" placeholder="사원명을 입력해주세요." style="height:40px;">
	                          <button type="button" class="btn btn-sm btn-primary" style="height:40px;" onclick="selectSearchList(1);">검색</button>
	                        </div>  
	                        	                        
                          </div>                      
                    
                      
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px; ">
                        
                        <table class="table table-hover mb-0" id="commuteMemberTable" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">근무날짜</th>
                              <th scope="col">요일</th>
                              <th scope="col">사원번호</th>
                              <th scope="col">부서</th>
                              <th scope="col">사원명</th>
                              <th scope="col">직급</th>
                              <th scope="col">출근시간</th>
                              <th scope="col">퇴근시간</th>
                              <th scope="col">근무상태</th>
                            </tr>
                          </thead>
                          <tbody>
                          
                          	  <!-- 리스트 조회 내용 올 곳 -->
                   
                          </tbody>
                        </table>
						
						<!-- 페이징바 -->
                        <div class="card-footer d-flex justify-content-end commute-pasing" style="justify-content:center !important;">
              				
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
                    		console.log($("#datepicker").val());
                    		$.ajax({
                    			url:"commuteMemberList.at",
                    			data : {
                    				cpage:cpage,
                    				searchDep:$("#searchDep option:selected").val(),
                    				keyword:$("#keyword").val(),
                    				datepicker:$("#datepicker2").val()                  	
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
			  			                          +    	 '<td>' + list[i].atDate + '</td>'
			  			                          +    	 '<td>' + list[i].atDay + '</td>'
			  			                          +   	 '<td>' + list[i].userNo + '</td>'
			  			                          +   	 '<td>' + list[i].depName + '</td>'
			  			                          +   	 '<td>' + list[i].userName + '</td>'
			  			                          +   	 '<td>' + list[i].jobName + '</td>'
			  			                          +   	 '<td>' + list[i].atStart + '</td>'
			  			                          +    	 '<td>' + list[i].atEnd + '</td>'
			  			                          +    	 '<td>' + list[i].atStatus + '</td>'
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
                    				
                    				$("#commuteMemberTable tbody").html(value);
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
		
		
		
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>