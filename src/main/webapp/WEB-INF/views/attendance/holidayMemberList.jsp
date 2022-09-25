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
                                        
                      <table>
                        <tr>
                          <td><b>기간조회</b></td>
                          <td>
                        	  <input type="date" id="startDate" name="startDate">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input type="date" id="endDate" name="endDate">
                          </td>
                          <td></td>
                        </tr>
                        <tr style="height:50px;">
                          <td><b>휴가종류</b></td>
                          <td style="padding-top:10px;">
                          	<div id="hCategory" name="hCategory">
	                           <label style="margin-left:5px;"><input type="radio" class="radio-value" id="status1" name="hCategory" value="hStatus0" checked>전체</label>
	                           <label style="margin-left:5px;"><input type="radio" class="radio-value" id="status2" name="hCategory" value="hStatus1" style="margin-left:10px;">연차</label>
	                           <label style="margin-left:5px;"><input type="radio" class="radio-value" id="status3" name="hCategory" value="hStatus2" style="margin-left:10px;">병가</label>
	                           <label style="margin-left:5px;"><input type="radio" class="radio-value" id="status4" name="hCategory" value="hStatus3" style="margin-left:10px;">경조사</label>
	                           <label style="margin-left:5px;"><input type="radio" class="radio-value" id="status5" name="hCategory" value="hStatus4" style="margin-left:10px;">기타</label>
                          	</div>
                          </td>
                          <td></td>
                        </tr>
                        <tr style="height:50px;">
                          <td><b>부서명</b></td>
                          <td>
                            <select class="form-control select1" id="searchDep" name="searchDep" style="width:100px;">
                              <option value="dept0" class="op1" selected>전체</option>
                              <option class="text-secondary" value="dept1"><label class="se-la">개발</label></option>
                              <option class="text-secondary" value="dept2"><label class="se-la">영업</label></option>
                              <option class="text-secondary" value="dept3"><label class="se-la">인사</label></option>
                              <option class="text-secondary" value="dept4"><label class="se-la">총무</label></option>
                              <option class="text-secondary" value="dept5"><label class="se-la">회계</label></option>
                            </select>
                          </td>
                          <td></td>
                        </tr>
                        <tr>
                          <td style="width:70px;"><b>사원명</b></td>
                          <td><input class="form-control mb-2 search1" name="keyword" id="keyword" type="text" placeholder="사원명을 입력해주세요." style="margin-top:7px;"></td>
                          <td><button type="button" class="btn btn-sm btn-primary" style="height:40px;" onclick="selectSearchList(1);">조회</button></td>
                        </tr>
                      </table>            

                  </div>

                  <div class="commute-table-area">

                    <div style="padding-left:15px; width:100%;">
                      
                      <div style="display:inline-block; text-align:center; margin-bottom:15px;">
                        <strong>* 조회 결과</strong>
                      </div>
                                                                  
                    </div>
                    
                    <!-- Table Seamless -->
                      <div class="card mb-grid" style="margin-left:15px; margin-right:15px;">
                        
                        <table class="table table-hover mb-0" id="holidayMemberList" style="text-align:center;">
                          <thead>
                            <tr>
                              <th scope="col">휴가일</th>
                              <th scope="col">사원번호</th>
                              <th scope="col">부서</th>
                              <th scope="col">사원명</th>
                              <th scope="col">직급</th>
                              <th scope="col">휴가종류</th>
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
                    			url:"holidayMemberAllList.at",
                    			data : {
                    				cpage:cpage,
                    				hCategory:$(".radio-value:checked").val(),
                    				searchDep:$("#searchDep option:selected").val(),
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
			  			                          +    	 '<td>' + list[i].vacationDate + '</td>'
			  			                          +   	 '<td>' + list[i].userNo + '</td>'
			  			                          +   	 '<td>' + list[i].depName + '</td>'
			  			                          +   	 '<td>' + list[i].userName + '</td>'
			  			                          +   	 '<td>' + list[i].jobName + '</td>'
			  			                          +   	 '<td>' + list[i].vacationCategory + '</td>'
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
                    				
                    				$("#holidayMemberList tbody").html(value);
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