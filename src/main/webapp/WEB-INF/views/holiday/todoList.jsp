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

					<div class="search-wrapper">
						<span>할 일</span>
						<form class="search-area" action="insertTodo.td">
							<input type="hidden" value="${ loginUser.userNo }" name="userNo">
							<input type="text" placeholder="새로운 할 일을 생성해보세요." class="form-control" name="todoContent">
							<button class="btn btn-primary" type="submit">등록</button>
						</form>
					</div>
					<div class="todo-content-wrapper">
						<div class="todo-list-area">
							<div class="todo-title blue">할 일</div>
							<div class="todo-list" id="list" draggable="true">
								<ul>
									<!-- ajax조회 -->
								</ul>
							</div>
						</div>
						<div class="todo-list-area">
							<div class="todo-title orange">진행중</div>
							<div class="todo-list" id="run" draggable="true">
								<ul>
									<!-- ajax조회 -->
								</ul>
							</div>
						</div>
						<div class="todo-list-area">
							<div class="todo-title green">완료</div>
							<div class="todo-list" id="success" draggable="true">
								<ul>
									<!-- ajax조회 -->
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
	
	<jsp:include page="../common/commonToast.jsp" />
	
	<!-- 할 일 리스트 조회 ajax -->
	<script>
		$(function(){
			$.ajax({
				url : "todoListView.td",
				success : function(todolist){
					let list = "";
					let run = "";
					let success = "";
					for(let i = 0; i < todolist.length; i++){
						if(todolist[i].status == 1){
							list += '<li id="item">'
							     +      '<span style="display : none;">' + todolist[i].todoNo + '</span>'
							     +  	'<span>' + todolist[i].todoContent + '</span>'
							     +      '<button><i class="fas fa-times"></i></button>'
							     +  '</li>';
							$("#list ul").html(list);
						}else if(todolist[i].status == 2){
							 run += '<li id="item">'
							     +      '<span style="display : none;">' + todolist[i].todoNo + '</span>'
							     +  	'<span>' + todolist[i].todoContent + '</span>'
							     +      '<button><i class="fas fa-times"></i></button>'
							     +  '</li>';
							 $("#run ul").html(run);
						}else{
					     success += '<li id="item">'
						         +      '<span style="display : none;">' + todolist[i].todoNo + '</span>'
							     +  	'<span>' + todolist[i].todoContent + '</span>'
							     +      '<button><i class="fas fa-times"></i></button>'
							     +  '</li>';
							 $("#success ul").html(success);
						}
					}
				},
				error : function(){
					console.log("할 일 조회 부분 ajax연결 실패");
				}
			})
		})
	</script>

	<script>
	    // 할 일 삭제
		$(document).on("click", "#item>button", function() {
			location.href="deleteTodo.td?no=" + $(this).parent().children().eq(0).text();
		});
	</script>
	
	<script>
		$(function() {
			// 리스트 정렬
			$(".todo-list>ul").sortable({
				revert : true
			});

			// 리스트 드래그
 			$(".todo-list>ul>li").draggable({
/* 				start : function() {
					console.log("start");
				}, */
				connectToSortable : ".todo-list>ul",
				scroll : false,
				revert : "invalid"
			});
			

			// 텍스트 선택 불가능
			$(".todo-list>ul, .todo-list>ul>li").disableSelection();
		});
	</script>
	
	<script>
		// 할 일 상태변경
		$(document).on("mousedown","#item", function(){
			let todoNo = $(this).children().eq(0).text();
			
			// 각 구역별 리스트 드롭
			$("#list").droppable({
				drop : function() {
					location.href="updateTodoStatus.td?todoNo=" + todoNo + "&section=1";
				}
			})
			$("#run").droppable({
				drop : function() {
					location.href="updateTodoStatus.td?todoNo=" + todoNo + "&section=2";
				}
			})
			$("#success").droppable({
				drop : function() {
					location.href="updateTodoStatus.td?todoNo=" + todoNo + "&section=3";
				}
			})
		})
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>