<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>

<meta charset="UTF-8">
<title>자유게시판 글 수정</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="row mt-5"></div>
<div class="container">
	<div class="content01">
		<form action="boardRegist.wow" id="editor_form" method="post">
			<table class="table">
				<tr>
				    <td class="td_left">제목</td>
				    <td class="td_right">
				        <input type="text" class="form-control input-sm" id="title" name="boTitle" maxlength="50" required="required">
				    </td>
				</tr>
				<tr>
					<td class="td_left">분류</td>
					<td><select name="boCate" required="required">
							<option value="">--선택하세요--</option>							
							<option value="잡담">잡담</option>
							<option value="펀딩후기">펀딩후기</option>
							<option value="정보공유">정보공유</option>
					</select></td>
				</tr>
				<tr>
					<td class="td_right">
					<input type="hidden" name="boMemId" value="${USER_INFO.userId }"   >
					</td>
				</tr>
				<tr class = boContent>
				    <td class="td_left" >내용</td>
				    <td class="td_right">
				    <div class="form-group">
				        <textarea class="form-control" name="boContent" id="content" rows="10" required="required"></textarea>
				    </div>
				    </td>				    
				</tr>
			</table>

                  <!-- 버튼 만들기 -->
			<div class="buttons">
				<a href="boardList.wow"><button type="button" class="btn btn-outline-primary">목록</button></a>
				<button type="submit" class="btn btn-outline-primary">저장</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>