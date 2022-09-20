<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!--양식을 조회하는 모달창-->
    <div class="modal-background" style="display : none;">
      <div class="modal-wrapper" style="height : 750px; width : 800px;">
          <form class="write-area" action="" method="POST">
          
          
          
              <!--결근사유서-->
              <table class="table table-bordered" style="width : 800px; display : none;" align="center">
                  <tr>
                    <th colspan="2">
                      <br><br>
                      <h1><strong>결근사유서</strong></h1>
                    </th>
                    <td colspan="4">
                      <table align="right" class="approval-check">
                        <tr>
                          <th width="120">홍길동 대리</th>
                        </tr>
                        <tr align="center">
                          <td><br>홍길동<br><br></td>
                        </tr>
                      </table>
                      <table align="right" class="approval-check">
                        <tr>
                          <th width="120">홍길남 팀장</th>
                        </tr>
                        <tr>
                          <td align="center"><br>홍길남<br><br></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                      <th>제목</th>
                      <td colspan="5">
                        제목입니다.
                      </td>
                  </tr>
                  <tr>
                      <th>부서</th>
                      <td>개발팀</td>
                      <th>기안자</th>
                      <td>홍길동</td>
                      <th>기안일</th>
                      <td>2022-22-22</td>
                  </tr>
                  <tr>
                      <th>결근일</th>
                      <td colspan="5">
                        <div class="date-form" style="display : flex;">
                          2022-22-22
                        </div>   
                      </td>
                  </tr>
                  <tr>
                      <th>내용</th>
                      <td colspan="5" style="text-align : left;">
                          <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsdsd</textarea>
                      </td>
                  </tr>
                  <tr>
                    <th>첨부파일</th>
                    <td colspan="5">
                      <a href="">파일명.pdf</a>
                    </td>
                  </tr>
                  <tr>
                      <th>반려사유</th>
                      <td colspan="5" style="text-align : left;">
                          <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsd</textarea>
                      </td>
                  </tr>
              </table>



              <!--휴가신청서-->
              <table class="table table-bordered" style="width : 800px; display : none;" align="center">
                <tr>
                  <th colspan="2">
                    <br><br>
                    <h1><strong>휴가신청서</strong></h1>
                  </th>
                  <td colspan="4">
                    <table align="right" class="approval-check">
                      <tr>
                        <th width="120">홍길동 대리</th>
                      </tr>
                      <tr align="center">
                        <td><br>홍길동<br><br></td>
                      </tr>
                    </table>
                    <table align="right" class="approval-check">
                      <tr>
                        <th width="120">홍길남 팀장</th>
                      </tr>
                      <tr>
                        <td align="center"><br>홍길남<br><br></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="5">
                      제목입니다.
                    </td>
                </tr>
                <tr>
                    <th>부서</th>
                    <td>개발팀</td>
                    <th>기안자</th>
                    <td>홍길동</td>
                    <th>기안일</th>
                    <td>2022-22-22</td>
                </tr>
                <tr>
                    <th>휴가종류</th>
                    <td colspan="5">
                      <div class="date-form" style="display : flex;">
                        연차
                      </div>   
                    </td>
                </tr>
                <tr>
                    <th>휴가기간</th>
                    <td colspan="5">
                      <div class="date-form" style="display : flex;">
                        2022-22-22
                      </div>   
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5" style="text-align : left;">
                        <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsdsd</textarea>
                    </td>
                </tr>
                <tr>
                  <th>첨부파일</th>
                  <td colspan="5">
                    <a href="">파일명.pdf</a>
                  </td>
                </tr>
                <tr>
                    <th>반려사유</th>
                    <td colspan="5" style="text-align : left;">
                        <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsd</textarea>
                    </td>
                </tr>
            </table>



            <!--업무기안-->
            <table class="table table-bordered" style="width : 800px; display : none;" align="center">
                <tr>
                  <th colspan="2">
                    <br><br>
                    <h1><strong>업무기안</strong></h1>
                  </th>
                  <td colspan="4">
                    <table align="right" class="approval-check">
                      <tr>
                        <th width="120">홍길동 대리</th>
                      </tr>
                      <tr align="center">
                        <td><br>홍길동<br><br></td>
                      </tr>
                    </table>
                    <table align="right" class="approval-check">
                      <tr>
                        <th width="120">홍길남 팀장</th>
                      </tr>
                      <tr>
                        <td align="center"><br>홍길남<br><br></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="5">
                      제목입니다.
                    </td>
                </tr>
                <tr>
                    <th>부서</th>
                    <td>개발팀</td>
                    <th>기안자</th>
                    <td>홍길동</td>
                    <th>기안일</th>
                    <td>2022-22-22</td>
                </tr>
                <tr>
                    <th>시행일자</th>
                    <td colspan="5">
                      <div class="date-form" style="display : flex;">
                        2022-22-22
                      </div>   
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5" style="text-align : left;">
                        <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsdsd</textarea>
                    </td>
                </tr>
                <tr>
                  <th>첨부파일</th>
                  <td colspan="5">
                    <a href="">파일명.pdf</a>
                  </td>
                </tr>
                <tr>
                    <th>반려사유</th>
                    <td colspan="5" style="text-align : left;">
                        <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsd</textarea>
                    </td>
                </tr>
            </table>



            <!--연장근무신청서-->
            <table class="table table-bordered" style="width : 800px; display : none;" align="center">
                <tr>
                  <th colspan="2">
                    <br><br>
                    <h1><strong>연장근무신청서</strong></h1>
                  </th>
                  <td colspan="4">
                    <table align="right" class="approval-check">
                      <tr>
                        <th width="120">홍길동 대리</th>
                      </tr>
                      <tr align="center">
                        <td><br>홍길동<br><br></td>
                      </tr>
                    </table>
                    <table align="right" class="approval-check">
                      <tr>
                        <th width="120">홍길남 팀장</th>
                      </tr>
                      <tr>
                        <td align="center"><br>홍길남<br><br></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="5">
                      제목입니다.
                    </td>
                </tr>
                <tr>
                    <th>부서</th>
                    <td>개발팀</td>
                    <th>기안자</th>
                    <td>홍길동</td>
                    <th>기안일</th>
                    <td>2022-22-22</td>
                </tr>
                <tr>
                    <th>근무일</th>
                    <td colspan="5">
                      <div class="date-form" style="display : flex;">
                        2022-22-22
                      </div>   
                    </td>
                </tr>
                <tr>
                    <th>근무시간</th>
                    <td colspan="5">
                      <div class="date-form" style="display : flex;">
                        오후 00:00 ~ 오후 00:00
                      </div>   
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5" style="text-align : left;">
                        <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsdsd</textarea>
                    </td>
                </tr>
                <tr>
                  <th>첨부파일</th>
                  <td colspan="5">
                    <a href="">파일명.pdf</a>
                  </td>
                </tr>
                <tr>
                    <th>반려사유</th>
                    <td colspan="5" style="text-align : left;">
                        <textarea cols="60" rows="5" style="resize : none; border-style: none;" readonly>sdsd</textarea>
                    </td>
                </tr>
            </table>
              <div class="document-btn" align="right">
                <button class="btn btn-secondary btn-sm">닫기</button>
                <button class="btn btn-primary btn-sm">회수</button>
                <button class="btn btn-danger btn-sm">삭제</button>
                <button class="btn btn-danger btn-sm">반려</button>
              </div>
          </form>
       </div>
    </div>
</body>
</html>