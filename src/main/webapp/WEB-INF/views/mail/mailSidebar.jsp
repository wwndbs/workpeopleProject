<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>

      <!-- 메일 사이드바 시작 -->
       <div class="mail-sidebar">

         <div class="sidebar1">
           <h5>메일</h5>
           <div class="div">
           <button type="button" class="mail-btn-enroll" onclick="location.href='enrollForm.ma'">메일 쓰기</button>
           </div>
         </div>

         <div class="sidebar2">
           <h5>메일함</h5>
           <ul class="mailbox-list">
             <li><a href="box.ma">받은메일함</a></li>
             <li><span><a href="box.ma?boxType=2">보낸메일함</a></span><span><button class="mail-btn-sidebar">수신확인</button><br></span></li>
             <li><a href="">내게쓴메일함</a></li>
             <li><a href="">임시보관함</a></li>
             <br>

             <li><span><a href="">스팸메일함</a></span><span><button class="mail-btn-sidebar">비우기</button><br></span></li>
             <li><span><a href="">휴지통</a></span><span><button class="mail-btn-sidebar">비우기</button><br></span></li>
             <br>
             
             <li><a href="">중요메일함</a></li>
             <li><a href="">안읽은메일함</a></li>
           </ul>
         </div>

         <div class="sidebar3">
           <h5>태그</h5>
           <ul class="tag-list">
             <li>
               <span>
                 <i class="fas fa-tag" style="color: crimson;"></i>
                 <a href="">나의부서</a>
               </span>
               <ion-icon name="ellipsis-vertical-outline"></ion-icon>
             </li>
             <li>
               <span>
                 <i class="fas fa-tag" style="color: dodgerblue;"></i>
                 <a href="">외부업체</a>
               </span>
               <ion-icon name="ellipsis-vertical-outline"></ion-icon>
             </li>
             <li>
               <span>
                 <i class="fas fa-tag" style="color: gold;"></i>
                 <a href="">참고자료</a>
               </span>
               <ion-icon name="ellipsis-vertical-outline"></ion-icon>
               </li>
             <a href="" style="color: gray; font-size:14px; margin: 28px;"> + 태그 추가</a>
           </ul>
         
         </div>
         <br><br>

         <div class="sidebar4">
           <ion-icon name="settings-outline" style="vertical-align: -3px;"></ion-icon>
           <a href="" style="margin-left: 5px;">
             메일 환경설정
           </a>
         </div>

       </div>
       <!-- 메일 사이드바 끝 -->

</body>
</html>