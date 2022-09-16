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
	
					<form class="document-wrapper">
						<div class="write-area" action="" method="POST">
							<table class="table table-bordered">
								<tr>
									<th colspan="2">
										<br><br>
										<h1><strong>결근사유서</strong></h1>
									</th>
									<td colspan="4">
										<table align="right">
											<tr>
												<th width="120">홍길동 대리</th>
											</tr>
											<tr>
												<td>
													<br>홍길동<br>
													<br>
												</td>
											</tr>
										</table>
										<table align="right">
											<tr>
												<th width="120">홍길남 팀장</th>
											</tr>
											<tr>
												<td>
													<br>홍길남<br>
													<br>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="5">
										<input type="text" name="" class="form-control form-control-sm">
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
										<div class="date-form" style="display: flex;">
											<input type="date" class="form-control form-control-sm" style="width: 150px;">
										</div>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="5" style="text-align: left;">
										<textarea id="summernote" name="editordata"></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="5">
										<input type="file" class="form-control-file border">
									</td>
								</tr>
							</table>

							<div class="btn-area">
								<button type="button" class="btn btn-secondary btn-sm">돌아가기</button>
								<button type="submit" class="btn btn-primary btn-sm" id="save">임시저장</button>
								<button type="submit" class="btn btn-primary btn-sm" id="approval">결재상신</button>
							</div>
						</div>

						<div class="approval-wrapper">
							<button class="btn btn-primary btn-sm">결재선 설정</button>
							<div class="approval-reference-area">
								<p>결재선</p>
								<ul>
									<li>
										<div>
											<img src="resources/images/defaultProfile.jpg" alt="프로필이미지">&nbsp;&nbsp;<strong>개발팀</strong>&nbsp;&nbsp; 홍길동 대리
										</div>
										<button>
											<i class="fas fa-times"></i>
										</button>
									</li>
								</ul>
								<ul>
									<li><div>
											<img src="resources/images/defaultProfile.jpg" alt="프로필이미지">&nbsp;&nbsp;<strong>개발팀</strong>&nbsp;&nbsp; 홍길동 대리
										</div>
										<button>
											<i class="fas fa-times"></i>
										</button>
									</li>
								</ul>
							</div>
							<div class="approval-reference-area">
								<p>참조</p>
								<ul>
									<li>
										<div>
											<img src="resources/images/defaultProfile.jpg" alt="프로필이미지">&nbsp;&nbsp;<strong>개발팀</strong>&nbsp;&nbsp; 홍길동 대리
										</div>
										<button>
											<i class="fas fa-times"></i>
										</button>
									</li>
								</ul>
								<ul>
									<li>
										<div>
											<img src="resources/images/defaultProfile.jpg" alt="프로필이미지">&nbsp;&nbsp;<strong>개발팀</strong>&nbsp;&nbsp; 홍길동 대리
										</div>
										<button>
											<i class="fas fa-times"></i>
										</button>
									</li>
								</ul>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="approvalModal.jsp" />

	<jsp:include page="../common/footer.jsp" />
</body>
</html>