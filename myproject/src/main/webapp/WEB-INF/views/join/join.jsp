<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="form"  uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/member/join.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
	<h3>회원 가입</h3>
	<form id="join" name="join" method="post" action="memberRegist.wow" >
			<table class="table table-bordered table-hover">
				<tbody>
					<tr>
						<th><ion-icon name="person-circle" size="large"> </ion-icon></th>
						<th>아이디</th>
						<td>
							<input type="text" name="memId" id="memId" maxlength="50" placeholder="알파벳과 숫자로 4글자 이상"
							required="required" pattern="\w{4,}" title="빈칸 없이 알파벳과 숫자로 4글자 이상 입력해주세요.">
							<form:errors path="memId"/>								
							<button type = "button" name="dupIdCheck" class="btn btn-primary" onclick="checkDupId()" 
							value="checkDupId">중복확인</button>
							<input type="hidden" id="idDuplChk" name="idDuplChk" value="ok">
						</td>				
					</tr>
					
					<tr>
						<th><ion-icon name="key-outline" size="large"></ion-icon></th>
						<th>비밀번호</th>
						<td>
							<input type="password" name="memPw" id="memPw" placeholder="알파벳과 숫자로 4글자 이상" class="form-control input-sm"
							required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력해주세요.">
							<form:errors path="memPw"/>
						</td>
					</tr>					
					<tr>
						<th><ion-icon name="person-add-outline" size="large"></ion-icon></th>
						<th>닉네임</th>
						<td>
							<input type="text" name="memName" id="memName"
							class="form-control input-sm" required="required" placeholder="2글자 이상" 
							pattern="{2,15}" title="2글자 이상 입력해주세요."></td>
						</td>
					</tr>
					<tr>
						<th><ion-icon name="transgender-outline" size="large"></ion-icon></th>
						<th>성별</th>
						<td>
							<input class="form-check-input" type="radio" id="memGender1" name="memGender" value="female" checked=""> 
							<label class="form-check-label" for="memGender1"> 여자</label>
							<input class="form-check-input" type="radio" id="memGender2" name="memGender" value="male">
							<label class="form-check-label" for="memGender2"> 남자</label>
   						</td>
					</tr>	
					<tr>
						<th><ion-icon name="today-outline" size="large" ></ion-icon></th>
						<th>생일</th>
						<td>
						<input type="date" name="memBir" id="memBir" value="1995-01-01" class="form-control input-sm">
						</td>
					</tr>	
					<tr>
						<th><ion-icon name="call-outline" size="large"></ion-icon></th>
						<th>휴대전화</th>
						<td>
							<input type="tel" name="memHp" id="memHp" placeholder="- 를 빼고 숫자만 입력해주세요." 
							required="required" pattern="[0-9]{10,11}" maxlength="13" class="form-control input-sm">
							<form:errors path="memHp"/>
						</td>
					</tr>	
					<tr>
						<th><ion-icon name="mail-open-outline" size="large"></ion-icon></th>
						<th>이메일</th>
						<td>
							<input type="email" name="memMail" id="memMail"
							required="required" placeholder="이메일" class="form-control input-sm">
							<form:errors path="memMail"/>
						</td>
					</tr>		
					<tr>
						<th><ion-icon name="map-outline" size="large"></ion-icon></th>
						<th>주소</th>
						<td>
						<input type="text" name="memAddr1" id="memAddr1" class="postcodify_postcode5"required="required" value="" />
						<form:errors path="memAddr1"/>
						<button id="postcodify_search_button" class="btn btn-primary">검색</button><br /><br />
						<input type="text" name="memAddr2" id="memAddr2"  class="postcodify_address" required="required" value="" />
						<form:errors path="memAddr2"/>
						</td>				
					</tr>
					<tr>	
					<td colspan="3">
					<button type="submit" id="memberJoin" class="btn btn-primary">회원가입</button>
					</td>
					</tr>
			</tbody>
		</table>
		</form>
</div>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script type="text/javascript">
	function checkDupId() {	
		let memId = $("form[name='join']").find("#memId").val();
		$.ajax({
			url: "<c:url value='/join/getLoginIdDup.wow'/>"
			,type:"post"
			,data: {memId : memId}	
			,success:function(code){
				if(code == "ok"){
					alert("사용 가능한 아이디입니다.");
					//중복이 아닐 때 idDuplChk 값을 없앤다. 
					$("form[name='join']").find("#idDuplChk").val("");				
				}
				else{
					alert("이미 사용 중인 아이디입니다. 다시 입력해주세요.");
					//중복일 때 memId 값을 없앤다.
					$("form[name='join']").find("#memId").val("");
				}
			}
			,error:function(){
				alert("error");
			}
		});		
	};
</script>
<script>

$(document).ready(function () {
	
	$("input[name='memId']").on("change", function(e){
		idDuplChk=$("#idDuplChk").val("ok");
    });
});

$(function(){
	$("#memberJoin").click(function(){
		e.preventDefault();
		let idDuplChk=$("#idDuplChk").val();
		 if(idDuplChk == "ok"){
		  alert("아이디 중복체크를 해주세요.");	
		  return; //함수 종료
		}else{		
		 document.join.action= "memberRegist.wow";
		 document.join.submit(); //제출
		}
	});
});

</script>
</body>
</html>