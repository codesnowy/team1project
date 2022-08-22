<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/member/join.css" />
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<meta charset="UTF-8">
<title>나의 정보</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
<h3>나의 정보</h3>
<form id="join" name="join" method="post" action="member/memberEdit.wow" >
		<table class="table table-bordered table-hover">
			<tbody>
				<tr>
					<th><ion-icon name="person-circle" size="large"> </ion-icon></th>
					<th><b>아이디</b></th>
					<td>${member.memId }
					<input type="hidden" name="memId" id="memId" value="${member.memId }">								
					</td>				
				</tr>
				
				<tr>
					<th><ion-icon name="key-outline" size="large"></ion-icon></th>
					<th>비밀번호</th>
					<td><input type="password" name="memPw" id="memPw" placeholder="알파벳과 숫자로 6글자 이상"
						class="form-control input-sm" required="required"
						pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력해주세요."></td>
				</tr>					
				<tr>
					<th><ion-icon name="person-add-outline" size="large"></ion-icon></th>
					<th>닉네임</th>
					<td><input type="text" name="memName" id="memName" value="${member.memName }"
						class="form-control input-sm" required="required" placeholder="2글자 이상" 
						pattern="{2,15}" title="2글자 이상 입력해주세요."></td>
				</tr>
				<tr>
						<th><ion-icon name="transgender-outline" size="large"></ion-icon></th>
						<th>성별</th>
						<td>
							<input class="form-check-input" type="radio" id="memGender1" name="memGender" value="female" 
							${member.memGender eq "female" ? "checked=''" : ""}> 
							<label class="form-check-label" for="memGender1"> 여자</label>
							<input class="form-check-input" type="radio" id="memGender2" name="memGender" value="male"
							${member.memGender eq "male" ? "checked=''" : ""}>
							<label class="form-check-label" for="memGender2"> 남자</label>
   						</td>
					</tr>	
					<tr>
						<th><ion-icon name="today-outline" size="large" ></ion-icon></th>
						<th>생일</th>
						<td>
						<input type="date" name="memBir" id="memBir" value='${member.memBir }' 
						class="form-control input-sm">
						</td>
					</tr>	
				<tr>
					<th><ion-icon name="call-outline" size="large"></ion-icon></th>
					<th>휴대전화</th>
					<td><input type="tel" name="memHp" id="memHp" placeholder="- 를 빼고 숫자만 입력해주세요."
						value="${member.memHp }" pattern="[0-9]{10,11}" maxlength="13" class="form-control input-sm"></td>
				</tr>	
				<tr>
					<th><ion-icon name="mail-open-outline" size="large"></ion-icon></th>
					<th>이메일</th>
					<td><input type="email" name="memMail" id="memMail" placeholder="이메일"
						value="${member.memMail }" class="form-control input-sm"></td>
				</tr>		
				<tr>	
				<td colspan="3">
				<button type="submit" class="btn btn-outline-primary">정보 수정</button>
				</td>
				</tr>
		</tbody>
	</table>
	</form>
</div>
</body>
</html>