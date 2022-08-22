<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>

<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
${searchVO}
	<div class="row mt-5">
	<!-- 테이블 넣기 -->
	<div class="row mt-3">
		<table class="table table-hover">
				<colgroup>
				<col width="8%" />
				<col width="12%" />
				<col />
				<col width="15%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr class="table-secondary">
					<th>글번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="board" varStatus="st">
					 <tr>
						<td>${board.boNo }</td>
						<td>${board.boCate }</td>
						<td><a href="board/boardView.wow?boNo=${board.boNo }">${board.boTitle }</a>
						</td>
						<td>${board.boMemId }</td>
						<td>${board.boRegDate }</td>
						<td>${board.boHit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	</div>
</body>
</html>