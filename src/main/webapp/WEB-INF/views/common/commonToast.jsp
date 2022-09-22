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
	<div id="toast"></div>
	
	<c:if test="${ not empty toastMsg }">
		<script>
			$(function(){
				toast("${ toastMsg }");				
			})
		</script>
		<c:remove var="toastMsg" scope="session" />
	</c:if>

	<script>

	
		// toast script
		let removeToast;
	
		function toast(string) {
		    const toast = document.getElementById("toast");
	
		    toast.classList.contains("reveal") ?
		        (clearTimeout(removeToast), removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 1000)) :
		        removeToast = setTimeout(function () {
		            document.getElementById("toast").classList.remove("reveal")
		        }, 1500)
		    toast.classList.add("reveal"),
		        toast.innerText = string
		}	
	</script>
</body>
</html>