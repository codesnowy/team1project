<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/member/login.css" />
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
<div class="container">
<div class="login">
	<div class="text">
		<h2>로그인</h2>
		나만의 프로젝트를 발견해보세요 <br> 
	</div>
	<div class="login_form">
		<form name="loginForm" action="login_check.wow" method="post"> 
			<table class="table table-bordered">
			<tbody>
				<tr>
					<th><ion-icon name="person-circle" size="large"> </ion-icon></th>
					<th>아이디</th>
					<td><input type="text" name="userId" id="userId" class="form-control input-sm" value="" required="required"></td>
				</tr>
				<tr>
					<th><ion-icon name="key-outline" size="large"></ion-icon></th>
					<th>비밀번호</th>
					<td><input type="password" name="userPass" id="userPass" class="form-control input-sm" required="required"></td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="submit" id="btnLogin" class="btn btn-primary">로그인</button>
					<c:if test="${param.message == 'idorpwnotcorrect' }">
                        <br>
                        <div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
                    </c:if>
                    <c:if test="${param.message == 'idorpwempty' }">
                    	<br>
                        <div style="color: red;">아이디 또는 비밀번호에 값이 없습니다.</div>
                    </c:if>					
                    <c:if test="${param.message == 'joinsucess' }">
                    	<br>
                        <div style="color: red;">회원가입에 성공하였습니다.</div>
                    </c:if>			 
					</td>
				</tr>			
				<tr>
					<td colspan="3">
						<a href="<%=request.getContextPath()%>/join/join.wow">회원가입</a>
					</td>
				</tr>	
			</tbody>
			</table>
		</form>
	</div>
	</div>
</div>
</body>
</html>