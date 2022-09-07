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

					<div class="search-wrapper">
						<span>할 일</span>
						<form class="search-area">
							<input type="text" placeholder="새로운 할 일을 생성해보세요." class="form-control">
							<button class="btn btn-primary">등록</button>
						</form>
					</div>
					<div class="todo-content-wrapper">
						<div class="todo-list-area">
							<div class="todo-title blue">할 일</div>
							<div class="todo-list" id="list" draggable="true">
								<ul>
									<li id="item">
										<span>오늘의 할 일은 무엇일까요</span>
										<button><i class="fas fa-times"></i></button>
									</li>
									<li id="item">
										<span>오늘의 할 일은 무엇일까요</span>
										<button><i class="fas fa-times"></i></button>
									</li>
									<li id="item">
										<span>오늘의 할 일은 무엇일까요</span>
										<button><i class="fas fa-times"></i></button>
									</li>
								</ul>
							</div>
						</div>
						<div class="todo-list-area">
							<div class="todo-title orange">진행중</div>
							<div class="todo-list" id="run" draggable="true">
								<ul>
									<li id="item">
										<span>오늘의 할 일은 무엇일까요</span>
										<button><i class="fas fa-times"></i></button>
									</li>
									<li id="item">
										<span>오늘의 할 일은 무엇일까요</span>
										<button><i class="fas fa-times"></i></button>
									</li>
								</ul>
							</div>
						</div>
						<div class="todo-list-area">
							<div class="todo-title green">완료</div>
							<div class="todo-list" id="success" draggable="true">
								<ul>
									<li id="item">
										<span>오늘의 할 일은 무엇일까요</span>
										<button><i class="fas fa-times"></i></button>
									</li>
									<li id="item">
										<span>오늘의 할 일은 무엇일까요</span>
										<button><i class="fas fa-times"></i></button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 드래그 제이쿼리 -->
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<script>
		$(function() {
			// 리스트 정렬
			$(".todo-list>ul").sortable({
				revert : true
			});

			// 리스트 드래그
			$(".todo-list>ul>li").draggable({
				start : function() {
					console.log("start");
				},
				connectToSortable : ".todo-list>ul",
				scroll : false,
				helper : "clone",
				revert : "invalid"
			});

			// 텍스트 선택 불가능
			$(".todo-list>ul, .todo-list>ul>li").disableSelection();

			// 각 구역별 리스트 드롭
			$("#list").droppable({
				drop : function() {
					console.log("list-end");
				}
			})
			$("#run").droppable({
				drop : function() {
					console.log("run-end");
				}
			})
			$("#success").droppable({
				drop : function() {
					console.log("success-end");
				}
			})
		});
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>