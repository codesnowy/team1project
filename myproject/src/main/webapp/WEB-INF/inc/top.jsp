<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">펀딩모아</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/funding/fundingList.wow">펀딩 보기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/board/boardList.wow">자유게시판</a>
        </li>
        <c:if test="${USER_INFO eq null }">
	    	<a href="<%=request.getContextPath()%>/login/login.wow">
	    	<button class="btn btn-primary disabled" id="login" type="button">로그인</button>
	    	</a>
	    </c:if>
	    <c:if test="${USER_INFO ne null }">
		    <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">내 메뉴</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/mypage.wow">내 정보</a>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/myfunding.wow?memId=${USER_INFO.userId}">내 펀딩</a>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/myboard.wow?boMemId=${USER_INFO.userId}">내가 쓴 글</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="<%=request.getContextPath()%>/login/logout.wow">로그아웃</a>
	          </div>
	        </li>
 	    </c:if> 
      </ul>
    </div>
  </div>
  
</nav>