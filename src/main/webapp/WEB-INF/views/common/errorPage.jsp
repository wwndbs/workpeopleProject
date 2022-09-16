<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
	.errorpage-container{
		width : 100%;
		height : 100%;
		display : flex;
		justify-content : center;
		align-items : center;
		text-align : center;
	}
	
	.errorpage-container .errorpage-wrapper{
		height : 300px;
	}
</style>
</head>
<body>
	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="menubar.jsp" />

		<!-- 컨텐츠 부분-->
		<div class="adminx-content">
			<div class="adminx-main-content">
				<div class="container-fluid">
					<div class="errorpage-container">
						<div class="errorpage-wrapper">
							<h1><i class="fas fa-exclamation-triangle"></i>ErrorPage</h1>
							<h2>${ errorMsg }</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>