<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
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
                        <form>
                            <table style="width: 900px;">

                                <tr>
                                    <td align="right">추가 부서명 :</td>
                                    <td><input style="height:30px; width:100%" placeholder="부서명"  required></td>
                                    <td style="width:50px;"></td>
                                    <td style="width:150px;"></td>
                                </tr>
                                <tr>
                                    <td align="right">부서 설명 :</td>
                                    <td rowspan="2"><input style="height:80px; width:100%" placeholder="내용을 입력해주세요"></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td id="depbtn">
                                        <button type="submit" class="btn btn-primary">추가</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
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

                            <form id="createForm" method="post" action="" enctype="multipart/form-data">
                                <table border="1px" id="createTable" class="table table-hover" align="center">
                                    <thead>
                                      <tr>

                                        <th style="width: 50px;">번호</th>
                                        <th style="width: 80px;">부서명</th>
                                        <th style="width: 150px;">책임자</th>
                                        <th style="width: 80px;">총 인원</th>
                                        <th style="width: 100px;">부서등록일</th>
                                        <th style="width: 80px;">폐지여부</th>
                                        <th style="width: 120px;">수정/삭제 수정</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>인사부</td>
                                            <td>ㅇㅇㅇ부장</td>
                                            <td>4</td>
                                            <td>2020-09-01</td>
                                            <td>N</td>
                                            <td id="depbtn">
                                                <button style="width:40%" data-toggle="modal" data-target="#modModal">수정하기</button>
                                                <button style="width:40%" data-toggle="modal" data-target="#delModal">삭제하기</button>
                                            </td>
                                        </tr>

										<tr>
                                            <td>1</td>
                                            <td>인사부</td>
                                            <td>ㅇㅇㅇ부장</td>
                                            <td>4</td>
                                            <td>2020-09-01</td>
                                            <td>N</td>
                                            <td id="depbtn">
                                                <button style="width:40%" data-toggle="modal" data-target="#modModal">수정하기</button>
                                                <button style="width:40%" data-toggle="modal" data-target="#delModal">삭제하기</button>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>1</td>
                                            <td>인사부</td>
                                            <td>ㅇㅇㅇ부장</td>
                                            <td>4</td>
                                            <td>2020-09-01</td>
                                            <td>N</td>
                                            <td id="depbtn">
                                                <button style="width:40%" data-toggle="modal" data-target="#modModal">수정하기</button>
                                                <button style="width:40%" data-toggle="modal" data-target="#delModal">삭제하기</button>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>1</td>
                                            <td>인사부</td>
                                            <td>ㅇㅇㅇ부장</td>
                                            <td>4</td>
                                            <td>2020-09-01</td>
                                            <td>N</td>
                                            <td id="depbtn">
                                                <button style="width:40%" data-toggle="modal" data-target="#modModal">수정하기</button>
                                                <button style="width:40%" data-toggle="modal" data-target="#delModal">삭제하기</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>

                        <div id="create3">
                        </div>
                        
                    </div>

                </div>
				<br>
				
                <div class="modal fade" id="modModal">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
            
                            <form action="login.me" method="post">
                                <!-- Modal Body -->
                                <table>
                                    <tr><h3>부서 수정</h3></tr>
                                    <tr>
                                        <td><h4>부서명</h4></td>
                                    </tr>
                                    <tr>
                                        <td>수정할 부서명 : </td>
                                        <td>
                                            <input style="width:150px; height:30px" placeholder="기존 부서명" required>
                                        </td>
                                    </tr>
                                    <br><br>
                                    <tr> 
                                        <td>부서 설명 : </td>
                                        <td>
                                            <input style="width:150px; height:30px" placeholder="간단한 설명">
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
            
                            <form action="login.me" method="post">
                                <h3>부서 삭제</h3>
                                <!-- Modal Body -->
                                <p>
                                    부서 삭제시 데이터를 되돌릴 수 없습니다. 정말로 삭제하시겠습니까?
                                </p>
                                <br>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">삭제</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                </div>


                                <!-- Modal Body -->
                                <p>
                                    부서 내부에 사원이 존재하여 부서를 삭제하지 못합니다.
                                </p>
                                <br>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">삭제</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
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