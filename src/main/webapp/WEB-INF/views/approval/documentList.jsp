<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />

		<!-- 컨텐츠 부분-->
		<div class="adminx-content">
			<div class="adminx-main-content">
				<div class="container-fluid">

					<!--메인페이지 컨텐츠-->
					<div class="search-wrapper">
						<span>결재양식 선택</span>
						<div class="search-area">
							<input type="text" placeholder="결재양식 검색" class="form-control">
							<button class="btn btn-primary">검색</button>
						</div>
					</div>
					<div class="document-content-wrapper">
						<div class="document-area">
							<div>
								<span>양식선택</span>
							</div>
							<ul>
								<li>
									<span>연장근무 신청서</span>
									<button class="btn btn-primary btn-sm" onclick="insertPage(1);">작성하기</button>
								</li>
								<li>
									<span>휴가 신청서</span>
									<button class="btn btn-primary btn-sm" onclick="insertPage(2);">작성하기</button>
								</li>
								<li>
									<span>결근 사유서</span>
									<button class="btn btn-primary btn-sm" onclick="insertPage(3);">작성하기</button>
								</li>
								<li>
									<span>업무 기안서</span>
									<button class="btn btn-primary btn-sm" onclick="insertPage(4);">작성하기</button>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		function insertPage(num){
			switch(num){
				case 1 : location.href="overtime.ap?form=연장근무신청서"; break;
				case 2 : location.href="vacation.ap?form=휴가신청서"; break;
				case 3 : location.href="absence.ap?form=결근사유서"; break;
				case 4 : location.href="plan.ap?form=업무기안서"; break;
			}
		}
	</script>
</body>
</html>