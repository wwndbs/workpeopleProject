<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<!-- 
	author : 박상현
	
	경로는 servlet-context.xml파일에 <resources mapping="/resources/**" location="/resources/" /> 로 명시되어있어
	resources로 경로를 시작하면됨
	
	header.jsp에 link 넣음
 -->
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

                <!--메인페이지 컨텐츠-->
                <div class="top-wrapper" style="flex-direction : column;">

                    <div id="dep-area" style="width: 1000px; padding:10px;">
                        <h2>부서 추가</h2>
                        <br>
                        <form id="depcreateForm" action="createDep.co">
                            <table style="width: 900px;">

                                <tr>
                                    <td align="right">추가 부서명 :</td>
                                    <td><input style="height:30px; width:100%" placeholder="부서명" name="depName" id="depName" required></td>
                                    <td style="width:50px;"></td>
                                    <td style="width:150px;"></td>
                                </tr>
                                <tr>
                                    <td align="right">부서 설명 :</td>
                                    <td rowspan="2"><input style="height:80px; width:100%" name="depContent" id="depContent" placeholder="내용을 입력해주세요"></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td id="depbtn">
                                        <button type="submit" class="btn btn-primary">추가</button>
                                        <button type="reset" class="btn btn-secondary">취소</button>
                                    </td>
                                </tr>

                            </table>
                        </form>
                    </div>
					<br>

                    <hr>
                    <!--게시판 부분-->
                    <div id="dep-area" style="width: 1200px; padding:20px;">
                        <h2>부서 관리</h2>
                        <br>
                        <div id="dep2">

                            <form id="deplistForm" method="post" action="" enctype="multipart/form-data">
                                <table border="1px" id="createTable" class="table table-hover" text-align="center">
                                    <thead>
                                      <tr style="text-align:center;">
                                        <th style="width: 80px;">부서명</th>
                                        <th style="width: 150px;">책임자</th>
                                        <th style="width: 60px">사원수</th>
                                        <th style="width: 100px;">부서등록일</th>
                                        <th style="width: 80px;">활성화 여부</th>
                                        <th style="width: 120px;">수정/삭제 수정</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <c:choose>
					                		<c:when test="${ empty list }">
					                			<tr>
					                				<td colspan="6">선택할 부서가 존재하지 않습니다.</td>
					                			</tr>
					                		</c:when>
					                		<c:otherwise>
					                			<c:forEach var="d" items="${ list }">
								                     <tr style="text-align:center;">
								                     	<input type="hidden" value="${d.depName }">
								                     	<input type="hidden" value="${d.userCount }">
			                                            <td>${d.depName }</td>
			                                            <td>${d.userName } 부장</td>
			                                            <td>${d.userCount } 명</td>
			                                            <td>${d.createDate }</td>
			                                            <td>${d.status}</td>
			                                            <td id="depbtn">
			                                                <a style="color:white;" data-id="${d.depName}" id="updatebtn" class="btn btn-primary" style="width:45%" data-toggle="modal" data-target="#updatedepModal">수정하기</a>
			                                                <a style="color:white;" data-id="${d.depName}" id="deletebtn" class="btn btn-danger" style="width:45%" data-toggle="modal" data-target="#delModal">삭제하기</a>
			                                            </td>
			                                            
			                                        </tr>
                                                    <script>
											         	$(document).on("click", "#updatebtn", function () {
														     var depName = $(this).data('id');
														     $("#updepName").val( depName );
														});
											         	
											         	$(document).on("click", "#deletebtn", function () {
														     var depName = $(this).data('id');
														     $("#deldepName").val( depName );
														});
			                       					</script>
					                    		</c:forEach>
					                    		
					                    	</c:otherwise>
										</c:choose>

                                    </tbody>
                                </table>
                                
                            </form>
                        </div>

                        <div id="create3">
                        </div>
                        
                    </div>

                </div>
				<br>
				
                <div class="modal fade" id="updatedepModal">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
            
                            <form action="updateDep.co" method="post" style="margin:5px; padding:5px;">
                                <!-- Modal Body -->
                                <table>
                                    <tr><h3>부서 수정</h3></tr>
                                    <tr>
                                    	<td style="width:70px;">부서명 : </td>
                                    	<td>
                                    		<input type="text" id="updepName" name="depName" readonly style="width:150px; height:30px">
                                    	</td>
                                    </tr>
                                    <tr>
                                        <td>수정명 : </td>
                                        <td>
                                            <input style="width:150px; height:30px" name="updateName" placeholder="수정후 부서명" required>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td>설명 : </td>
                                        <td>
                                            <input style="width:150px; height:30px" name="depContent" placeholder="부서 설명">
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">수정</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="delModal">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
            
                            <form action="deleteDep.co" method="post" style="margin:10px; padding:10px;">
                                <h3>부서 삭제</h3>
                                
								<table>
									<tr>
										<td>선태된 부서:</td>
										<td><input type="text" id="deldepName" name="depName" readonly style="width:150px; height:30px;" ></td>
									</tr>
								</table>
                                <!-- Modal Body -->
                                <p>
                                	<br>
                                    부서 삭제시 데이터를 되돌릴 수 없습니다. 정말로 삭제하시겠습니까?
                                </p>
                                <br>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-danger">삭제</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
 	</div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>