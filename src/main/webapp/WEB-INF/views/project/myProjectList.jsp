<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
	<title>워크피플</title>
	<!-- favicon 설정 -->
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
    <style>
      .row{
        width:100%;
        height: 320px;
        margin: 0px 0px -5px -13px;
      }
      .color{
        background-color:rgb(118, 194, 252);
        width: 5%;
        height: 90.7%;
      }
      .font1{
        font-weight: bold;
        font-size: 90%;
        width:300%
      }
      .font2{font-size: 75%; width:200%}
      .font3{font-size: 90%; font-weight: bold; color:rgb(244, 217, 14); width:300%}
      .approval1{width: 98.5% !important; font-weight: bold; font-size: 15px;}
      .btn1{margin: 10px -1500px 0px 1500px; width: 70%;}
      .box11, .box1{cursor : pointer; margin: 0px -5px 0px 0px;} 
	  .box1:hover{background-color : #f4f9fe;}
      .col-lg-3{max-width: 80%;}
	  .container-fluid{margin-right: 0px !important;}
	  .modifyPro, .deletePro{cursor : pointer}	
    </style>
</head>
<body>
	<div class="adminx-container">
	      <!-- 상단 메뉴 바 -->
		  <jsp:include page="../common/header.jsp" />
		
		  <!-- 좌측 슬라이드 메뉴 바 -->
		  <jsp:include page="../common/menubar.jsp" />
		  
	      <!-- 컨텐츠 부분 wrapper -->
	      <div class="adminx-content">
	        <div class="adminx-main-content">
	          <div class="container-fluid">
	          		            
	            <input type="hidden" name="projectNo" value="${ pp.projectNo }">
	            <input type="hidden" name="projectNo" value="${ pm.projectNo }">
                <input type="hidden" name="no" value="${ p.proBoardNo }">
                <input type="hidden" name="pmMember" value="${ pmMember }">
                <input type="hidden" name="userNo" value="${ loginUser.userNo }">
                <input type="hidden" name="userMemNo" value="${ pm.userMemNo }">          
                <input type="hidden" name="depName" value="${ loginUser.depName }">   
                                
	            <!-- 관리자에게만 보여지는 승인탭(팀장/부장) -->
	            <c:if test="${ loginUser.jobName == '부장' || loginUser.jobName == '팀장'}">
		            <div class="form-group">
		              <select class="form-control approval1" name="demoStyle" id="approveTest">
		                <option value="default" class="op1">가입요청</option>
		                <c:choose>
		                  <c:when test="${ not empty appList }">
		                  	<c:forEach var="p" items="${ appList }">
			                  <option class="text-secondary" id="testOption" value="${ p.projectNo }" userNo="${ p.userMemNo }" proApprove="${ p.proApprove }">
				                  <b>[${ p.projectTitle }]</b> ${ p.pbDepName } ${ p.pbUserName }${ p.pbJobName }
			                  </option>		                
			                </c:forEach>
			              </c:when>
			              <c:otherwise>
			              	<option class="text-secondary" value="secondary"><label class="se-la">가입신청이 없습니다.</label><label for="">&nbsp; </label></option>
			              </c:otherwise>  
		                </c:choose>
		              </select>
		            </div>		           
	            </c:if>
	            
	            <!-- 관리자 승인 모달 -->
	            <form action="approve.pr" method="post">
			       <div class="modal" id="approveAdd">
			           <div class="modal-dialog modal-dialog-centered">
			               <div class="modal-content" style="height:230px; width: 370px;">
			               	  <input type="hidden" name="projectNo" id="projectNo" value="">
				              <input type="hidden" name="userMemNo" id="userMemNo" value="">
							  <input type="hidden" name="proApprove" id="proApprove" value="">
							  
			                  <!-- Modal body -->
			                  <div class="modal-body" style="text-align:center;">
			                  	  <br><br>
			                      <span id="modalContent"></span>의 <br>
			                      가입을 승인하시겠습니까?
			                  </div>
			                  <!-- Modal footer -->
			                  <div class="modal-footer" style="justify-content:center;">
				                <button type="submit" class="btn btn-jyok" id="holiday-give-btn">승인</button>	                
				                <button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
			                  </div>
			              </div>
			           </div>
			        </div>
			        
			        <script>
			        	$('#approveTest').change(function(){
			        		
			        		let projectNo = $(this).children(":selected").val();
			        		let userMemNo = $(this).children(":selected").attr("userNo");
			        		let proApprove = $(this).children(":selected").attr("proApprove");
			        		// 위의 두개는 모달 div안에 input type="hidden"요소에 value값으로 넣어야됨
			        		let content = $(this).children(":selected").text();
			        		// content는 모달 div안에 id가 modalContent요소에 text값으로 넣어야됨			        		
			        		
			        		$('input[name=projectNo]').attr('value', projectNo);
			        		$('input[name=userMemNo]').attr('value', userMemNo);
			        		$('input[name=proApprove]').attr('value', proApprove);
							$('#modalContent').text(content);			        		
			        		
			        		//console.log(projectNo, userMemNo, content, proApprove);
			        		
		        			$('#approveAdd').modal('show');
		        			
		        		})
			        </script>
			        			        
			    </form>	
	
	            <!-- 내팀 -->
	            <div class="pb-3">
	              <h5 style="font-weight: 400"><b>My Team</b>
	              <!-- 관리자에게만 보여지는 프로젝트 생성버튼-->
	              <c:if test="${ loginUser.jobName == '부장' || loginUser.jobName == '팀장' }">
	              	<button hidden type="button" class="btn btn-primary btn1" onclick="location.href='enrollPro.pr'" style="width: 7.5%; height: 40px; font-size: 17px;">프로젝트 생성</button>
	              </c:if>
	              </h5>
	            </div>
	                            
	            <!--프로젝트 박스-->
	            <div class="row">
	              <!-- 내가 참여한 프로젝트만  -->
	              <c:choose>
	              	<c:when test="${ empty list }">
	              		<span style="margin: 0px 0px 0px 730px"><br><br><br><br><br>현재 팀에서 진행하고 있는 프로젝트가 없습니다.</span>
	              	</c:when>	
	              	<c:otherwise>
                   	<c:set var="depName" value="${ loginUser.depName }"/>	
	                  <c:forEach var="pp" items="${ list }">       
	                       
	                     <div class="col-md-6 col-lg-3 d-flex myPro">
			              	
			              	<c:if test="${ pp.checkDep == 1 }">
			                  <div class="color"></div>
			                </c:if>
			                <c:if test="${ pp.checkDep == 0 and pp.proApprove == 'N' }">			                
			                  <!-- 토스트 메시지 div -->
			                  <div id="toast">
			                    		                    
			                  </div>
			                </c:if>     
			                
			                <script>			        		
				        		function chooseProject(checkDep){
				                				       
				                	console.log(checkDep);
				                	
				                	if(checkDep == 0){
				                		toast("승인받은 프로젝트만 참가 가능합니다.");
				                	}else{
				                		location.href='proList.pr?no=${pp.projectNo}';
				                		//location.href='proList.pr?no=${pp.projectNo}&status=1';
				                	}
				                	
				                }
				                	
				                //토스트
				                let removeToast;
		
								function toast(string) {
								    const toast = document.getElementById("toast");
			
								    toast.classList.contains("reveal") ?
								        (clearTimeout(removeToast), removeToast = setTimeout(function () {
								            document.getElementById("toast").classList.remove("reveal")
								        }, 1000)) :
								        removeToast = setTimeout(function () {
								            document.getElementById("toast").classList.remove("reveal")
								        }, 1500)
								    toast.classList.add("reveal"),
								        toast.innerText = string
								}
			                </script>		                
			                
			                <div class="card mb-grid project w-100 box1" onclick="chooseProject(${pp.checkDep});">
			                <input type="hidden" id="projectNo" name="projectNo" value="8">
			                <input type="hidden" name="checkDep" value="">
			                			                
			                  <div class="card-body d-flex flex-column">                                            
			                    <div class="d-flex justify-content-between mb-3">
			                      <h5 class="card-title mb-0">
			                        <div style="float:right; font-size: 80%; margin: 0px -240px 0px 100px">	
			                          <label hidden for="" class="modifyPro">수정</label>
			                          <label hidden for="" class="deletePro">삭제</label>&nbsp;&nbsp;&nbsp;
			                        </div>
			                        <br>
			                        <label class="font1">&nbsp;&nbsp;${ pp.projectTitle }</label><br>                    
									<label class="font2">&nbsp;&nbsp;${ pp.depName }</label><br>
									<div style="position:absolute;  bottom:30px !important">
										<c:if test="${ pp.category == '기획중' }">
					                        <label class="font3" style="">&nbsp;&nbsp;기획중</label>
				                        </c:if>
										<c:if test="${ pp.category == '기획완료' }">
					                        <label class="font3" style="color:orange;">&nbsp;&nbsp;기획완료</label>
				                        </c:if>
										<c:if test="${ pp.category == '프로젝트 진행중' }">
					                        <label class="font3" style="color:rgb(42, 187, 42)">&nbsp;&nbsp;프로젝트 진행중</label>
				                        </c:if>
										<c:if test="${ pp.category == '프로젝트 완료' }">
					                        <label class="font3" style="color:rgb(113, 113, 255)">&nbsp;&nbsp;프로젝트 완료</label>
				                        </c:if>
										<c:if test="${ pp.category == '피드백' }">
					                        <label class="font3" style="color:rgb(185, 101, 213)">&nbsp;&nbsp;피드백</label>
				                        </c:if>	
			                        </div>		                        			                        			                        
			                      </h5>
			                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right; width:8% !important"></i>
			                      <span for="" style="margin: 230px 0px -20px 21px;" id="pcount">${ pp.countMember }</span]>
			                    </div>
			                  </div>
			                </div>
			              </div>
			              			              
		              </c:forEach>
		            </c:otherwise>
	              </c:choose>
	              	              
	            </div>
	
	
	
	            <hr>
	
	            <div class="pb-3" style="margin: 30px 0px 0px 0px">
	              <h5 style="font-weight: 350"><b>참여중인 프로젝트</b></h2>
	            </div>
	
	            <div class="row">
	            
	              <!-- 내가 참여한 프로젝트2  -->
	              <c:choose>
	              	<c:when test="${ empty list2 }">
	              		<span style="margin: 0px 0px 0px 730px"><br><br><br><br><br>현재 팀에서 진행하고 있는 프로젝트가 없습니다.</span>
	              	</c:when>	
	              	<c:otherwise>
                   	<c:set var="depName" value="${ loginUser.depName }"/>	
	                  <c:forEach var="pp" items="${ list2 }">       
	                       
	                     <div class="col-md-6 col-lg-3 d-flex box11">
			              	
			              	<c:if test="${ proApprove == 'Y' }">
			                </c:if>
			                  <div class="color"></div>
			                
			                <div class="card mb-grid project w-100 box1" onclick="location.href='proList.pr?no=${pp.projectNo}'">
			                  <div class="card-body d-flex flex-column">                                            
			                    <div class="d-flex justify-content-between mb-3">
			                      <h5 class="card-title mb-0">
			                        <div style="float:right; font-size: 80%; margin: 0px -240px 0px 100px">	
			                          <label hidden for="" class="modifyPro">수정</label>
			                          <label hidden for="" class="deletePro">삭제</label>&nbsp;&nbsp;&nbsp;
			                        </div>
			                        <br>
			                        <label class="font1">&nbsp;&nbsp;${ pp.projectTitle }</label><br>                    
									<label class="font2">&nbsp;&nbsp;${ pp.depName }</label><br>
									<div style="position:absolute;  bottom:30px !important">
										<c:if test="${ pp.category == '기획중' }">
					                        <label class="font3" style="">&nbsp;&nbsp;기획중</label>
				                        </c:if>
										<c:if test="${ pp.category == '기획완료' }">
					                        <label class="font3" style="color:orange;">&nbsp;&nbsp;기획완료</label>
				                        </c:if>
										<c:if test="${ pp.category == '프로젝트 진행중' }">
					                        <label class="font3" style="color:rgb(42, 187, 42)">&nbsp;&nbsp;프로젝트 진행중</label>
				                        </c:if>
										<c:if test="${ pp.category == '프로젝트 완료' }">
					                        <label class="font3" style="color:rgb(113, 113, 255)">&nbsp;&nbsp;프로젝트 완료</label>
				                        </c:if>
										<c:if test="${ pp.category == '피드백' }">
					                        <label class="font3" style="color:rgb(185, 101, 213)">&nbsp;&nbsp;피드백</label>
				                        </c:if>	
			                        </div>		                        			                        			                        
			                      </h5>
			                      <i data-feather="user" style="margin: 230px -17px -20px 200px; float: right; width:8% !important"></i>
			                      <span for="" style="margin: 230px 0px -20px 21px;" id="pcount">${ pp.pmMemberCount }</span]>
			                    </div>
			                  </div>
			                </div>
			              </div>
			              
		              </c:forEach>
		            </c:otherwise>
	              </c:choose>
	              
	                       
	              </div>
	
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	
	    <!-- bootstrap -->
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	    <script src="resources/bootstrap/dist/js/vendor.js"></script>
	    <script src="resources/bootstrap/dist/js/adminx.js"></script>
  </body>
</html>










