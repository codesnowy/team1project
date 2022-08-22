<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">	
<div class="row mt-5">

	<h2 class="tit_error">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
		<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
		</svg> 
		404<br>
		원하시는 페이지를찾을 수가 없습니다.
	</h2>
	<p class="desc_error">
		방문 원하시는 페이지의 주소가 잘못 입력되었거나,<br>
		변경 혹은 삭제되어 요청하신 페이지를 찾을 수가 없습니다.<br>
		입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
	</p>
</div>
</div>
</body>
</html>