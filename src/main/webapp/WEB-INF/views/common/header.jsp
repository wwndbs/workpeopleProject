<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- bootstrap template -->
<link rel="stylesheet" type="text/css" href="resources/bootstrap/dist/css/adminx.css" media="screen" />

<!--bootstrap, jQuery-->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!--pretendard font-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="resources/bootstrap/dist/css/font-pretendard.css">

<!--fontawesome kit-->
<script src="https://kit.fontawesome.com/ea8287c514.js" crossorigin="anonymous"></script>

<!-- google icon -->
<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    
<!--css-->
<link rel="stylesheet" href="resources/css/yh.css">
<link rel="stylesheet" href="resources/css/juyun.css">
<link rel="stylesheet" href="resources/css/sanghyun.css">
<link rel="stylesheet" href="resources/css/hyerim.css">
<link rel="stylesheet" href="resources/css/seowon.css">


<!--summernote-common-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<!--summernote-lite-->
<script src="resources/api/summernote/summernote-lite.js"></script>
<script src="resources/api/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/api/summernote/summernote-lite.css">


<title>워크피플</title>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<nav class="navbar navbar-expand justify-content-between fixed-top">
		<a class="navbar-brand mb-0 h1 d-none d-md-block" href="main.wp">
			<img src="resources/images/workpeople-logo-blue02.png" height="30" alt="">
		</a>

		<div class="d-flex flex-1 d-block d-md-none">
			<a href="#" class="sidebar-toggle ml-3">
				<i data-feather="menu"></i>
			</a>
		</div>

		<ul class="navbar-nav d-flex justify-content-end mr-2">
			<!-- 상단 메뉴 프로필 -->
			<li class="nav-item dropdown">
				<a class="nav-link avatar-with-name" id="navbarDropdownMenuLink" data-toggle="dropdown" href="#">
					<img src="<c:out value='${ loginUser.profImg }' default='resources/profile_images/defaultProfile.jpg' />"><!--프로필이미지-->
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="updateForm.me">정보수정</a>
					<a class="dropdown-item text-danger" href="logout.me">로그아웃</a>
				</div>
			</li>
		</ul>
	</nav>
</body>
</html>