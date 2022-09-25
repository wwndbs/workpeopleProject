<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.adminx-container {
		height: 100% !important;
	}
	
	.board-contentt{
	    /*padding: 5% 3%;*/
	    height: 100%;
	    width: 95%;
	    margin: auto;
	    border-radius: 5px;
		background-color: none !important;
		boarder: none !important;
	}
	
	.board-contentt tr>th{
		padding: 1% 0 1% 0;
	}
	
	.standby{
        color:rgb(250, 60, 60);
    }
    .complete{
        color:rgb(66, 66, 253);
    }
</style>
</head>
<body>

	<div class="adminx-container">
		<!-- header -->
		<jsp:include page="../common/header.jsp"/>
		
		<!-- menubar -->
		<jsp:include page="../common/menubar.jsp"/>
		
		<div class="adminx-content" style="padding-left : 65px;">
	        <div class="adminx-main-content" style="padding : 0; height: 100%;">
	          <div class="container-fluid" style="padding: 0; height: 100%;">
		
				<!-- 게시판 sidebar -->
				<jsp:include page="boardSidebar.jsp"/>
		
				<!-- 게시판 내용 시작 -->
              <div class="board-main">
              
                <br>

                <div class="board-title">
                    <h5>신고 관리</h5>
                </div>

                <br>

                <div class="board-contentt">
                	<table class="search-table" width="95%" align="center">
                	
                		<tr>
                			<th width="13%">검색</th>
                			<td width="85%">
                				<!-- 검색폼 -->

			                      <div style="display:flex; padding-top:15px;">
			
			                        <div class="form-group">
			                          <select class="form-control select1" id="searchRp" name="searchRp" style="height:35px;">
			                            <option value="rp0" class="op1" selected>전체</option>
			                            <option class="text-secondary" value="rp1"><label class="se-la">신고내용</label></option>
			                            <option class="text-secondary" value="rp2"><label class="se-la">신고자</label></option>
			                          </select>
			                        </div>
			                        <div class="search-div" style="width:90%; display:flex; ">
			                          <input class="form-control mb-2 search1" name="keyword" id="keyword" type="text" placeholder="키워드를 입력해주세요." style="height:35px;">
			                          <!--  <button type="button" class="btn btn-sm btn-primary" style="height:35px;" onclick="selectSearchList(1);">검색</button>-->
			                        </div>  
			                        	                        
		                          </div>
                			</td>
                		</tr>
                		<tr>
                			<th>신고 구분</th>
                			<td>
                				<input type="radio" class="rpType" name="rpType" value="rt0">&nbsp;&nbsp;전체&nbsp;&nbsp;
                				<input type="radio" class="rpType" name="rpType" value="rt1">&nbsp;&nbsp;게시글&nbsp;&nbsp;
                				<input type="radio" class="rpType" name="rpType" value="rt2">&nbsp;&nbsp;댓글
                				<input type="hidden" id="rpType">
                			</td>
                		</tr>
                		<tr>
                			<th>처리 여부</th>
                			<td>
                				<input type="radio" class="rpHandle" name="rpHandle" value="rh0">&nbsp;&nbsp;전체&nbsp;&nbsp;
                				<input type="radio" class="rpHandle" name="rpHandle" value="rh1">&nbsp;&nbsp;처리&nbsp;&nbsp;
                				<input type="radio" class="rpHandle" name="rpHandle" value="rh2">&nbsp;&nbsp;미처리
                				<input type="hidden" id="rpHandle">
                			</td>
                		</tr>
                	
                	</table>
                	
                	<script>
	                	$(document).on("click", ".rpType", function(){
				    		
				    		$(this).siblings("input").prop("checked", false);
				    		$("#rpType").val($(this).val());
				    		
				    	})
				    	
				    	$(document).on("click", ".rpHandle", function(){
				    		
				    		$(this).siblings("input").prop("checked", false);
				    		$("#rpHandle").val($(this).val());
				    		
				    	})
                	</script>
                	
                	<div class="sub-btn" style="margin-top: 2%; margin-bottom: 2%; text-align: center; width: 95%;">
                    	<button type="button" class="btn btn-sm btn-primary" onclick="search();" style="width: 70px; height: 40px; font-size: 16px; margin-right: 1%;">검색</button>
                     	<button type="button" class="btn btn-sm btn-light" onclick="reset();" style="width: 70px; height: 40px; font-size: 16px;">초기화</button>
                    </div>
                    
                    <div class="board-table">
                    <table class="table table-hover" align="center">
                        <thead>
                            <tr>
                                <th width="7%">번호</th>
                                <th width="12%">신고구분</th>
                                <th width="12%">신고일</th>
                                <th width="12%">신고자</th>
                                <th width="34%">신고내용</th>
                                <th width="12%">처리일</th>
                                <th width="11%">처리여부</th>
                            </tr>
                        </thead>
                        <tbody id="rpTbody">
                        
                        
                        </tbody>
                    </table>
                    
                    <script>
                    	function search(){
                    		
                    		$.ajax({
                    			url: "rpSearch.bo",
                    			data: {
                    				searchRp: $("#searchRp").val(),
                    				keyword: $("#keyword").val(),
                    				rpType: $("#rpType").val(),
                    				rpHandle: $("#rpHandle").val()
                    			},
                    			success: function(list){
                    				let value = "";
                    				
                    				if(list.length == 0){
                    					
                    					value += '<tr>'
                    							+	'<td colspan="7">검색 결과가 없습니다.</td>'
                    							+'</tr>';
                    					
                    				}else{

                    					for(let i=0; i<list.length; i++){
                    						
                    						let reportType = "";
                    						if(list[i].reportType == 1){
                    							reportType = "게시글";
                    						}else{
                    							reportType = "댓글";
                    						}
                    						
                    						let status = "";
                    						let handlingDate = "";
                    						if(list[i].status = 'N'){ // 미처리
                    							status = '<span class="standby"> 미처리 </span>';
                    						}else{ // 처리완료
                    							status = '<span class="complete"> 처리완료 </span>';
                    							handlingDate = list[i].handlingDate;
                    						}
                    						
                    						value += '<tr onclick="rpHandle(this);">'
                    								+	'<td>' + list[i].reportCode + '</td>'
                    								+	'<td>' + reportType + '</td>'
                    								+	'<td>' + list[i].reportDate + '</td>'
                    								+	'<td>' + list[i].userName + ' ' + list[i].jobName + '</td>'
                    								+	'<td>' + list[i].reportContent + '</td>'
                    								+	'<td>' + handlingDate + '</td>'
                    								+	'<td>' + status + '</td>'
                    								+'</tr>';
                    						
                    					}
                    					

                    				}
                    				
                   					$("#rpTbody").html(value);
                    					
                    			},error: function(){
                    				console.log("신고 검색 ajax 실패");
                    			}
                    		});
                    		
                    	}
                    	
                    	function reset(){
                    		
                    		$("#keyword").val("");
                    		$("#searchRp>.op1").prop("selected", true);
                    		$("input[type=radio]").prop("checked", false);
                    		
                    	}
                    	
                    	function rpHandle(t){
                    		let rpNo = $(t).children().eq(0).text();
                    		
                    		locaion.href="rpHandle.bo?rpNo=" + rpNo;
                    	}
                    </script>
                	
                	
                	
                	
                	
                	
                	
                	
                	
                </div>
              
              
              
              
              
              
              
              </div>
              <!-- 게시판 내용 끝 -->
		
			  </div>
			</div>
		</div>
	</div>

</body>
</html>