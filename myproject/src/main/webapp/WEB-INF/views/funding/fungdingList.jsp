<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>

<meta charset="UTF-8">
<title>펀딩 전체 보기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/funding/fundingList.css" />
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">

	<form class="fucategory" name="search" action="fundingList.wow" method="post" class="form-horizontal">
		<input type="hidden" name="curPage" value="${searchVO.curPage }"> 
		<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">	
		<div class="form-group">
			<div class="row">
				<div class="col-1"> <b>분류</b></div>
				<div class="col">
					<select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
						<option value="">--선택하세요--</option>		
						<c:forEach items="${cateList }" var="cate" varStatus="st">
							<option value="${cate}" ${searchVO.searchCategory eq cate ? "selected='selected'" : ""}>${cate}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-1"> <b>사이트</b></div>
				<div class="col">
					<select id="id_searchSite" name="searchSite" class="form-control input-sm">
						<option value="">--선택하세요--</option>		
						<option value="tumblbug" ${searchVO.searchSite eq "tumblbug" ? "selected='selected'" : ""}>텀블벅</option>
						<option value="wadiz" ${searchVO.searchSite eq "wadiz" ? "selected='selected'" : ""}>와디즈</option>
						<option value="ohmycompany" ${searchVO.searchSite eq "ohmycompany" ? "selected='selected'" : ""}>오마이컴퍼니</option>
					</select>
				</div>	
				<div class="col-1"> <b>정렬</b></div>
				<div class="col">
					<select id="id_arrarytype" name="arraryType" class="form-control input-sm">	
						<option value="">--선택하세요--</option>		
						<option value="fu_dday desc" ${searchVO.arraryType eq "fu_dday desc" ? "selected='selected'" : ""}>최신순</option>
						<option value="fu_amount desc" ${searchVO.arraryType eq "fu_amount desc" ? "selected='selected'" : ""}>달성율 높은 순</option>
						<option value="fu_dday" ${searchVO.arraryType eq "fu_amount" ? "selected='selected'" : ""}>마감순</option>
					</select>
				</div>	
				<div class="col-2">
					<button type="submit" class="btn btn-sm btn-primary btn-lg"> 선택</button>
				</div>
			</div>					
		</div>	
	</form>
</div>
<div class="container" id="list">
	<c:forEach items="${fundingList }" var="funding" varStatus="st">
		<div class="funding">
			<a href="fundingView.wow?fuNo=${funding.fuNo }&memId=${USER_INFO.userId}"><img class="fundingimg" alt="" src="${funding.fuImg }"></a>
			<a href="fundingView.wow?fuNo=${funding.fuNo }&memId=${USER_INFO.userId}"><b>${funding.fuTitle }</b></a>			
			<div class="amount">${funding.fuAmount } 달성(${funding.fuPercent } %)</div>
			<div class="category">♥ ${funding.fuLike } <b>｜</b> ${funding.fuCate }	</div>
			<div class="fuDday"><b>${funding.fuDday eq "0" ? "오늘 마감": funding.fuDday }${funding.fuDday eq "0" ? "" : "일 남음"}｜</b> ${funding.fuSite } </div>
		</div>
	</c:forEach>
</div>
<!-- START : 페이지네이션  -->
<div class="container" id="paging">
	<ul class="pagination">
		<!-- 첫 페이지  -->
		<li class="page-item"><a class="page-link" href="fundingList.wow?curPage=1" data-page="1">
		<span	aria-hidden="true">&laquo;</span></a></li>
		<!-- 이전 페이지 -->
		<c:if test="${searchVO.firstPage!=1 }">
			<li class="page-item"><a class="page-link" href="fundingList.wow?curPage=${searchVO.firstPage-1 }"
				data-page="${searchVO.firstPage-1 }"><span aria-hidden="true">&lt;</span></a></li>
		</c:if>

		<!-- 페이지 넘버링  -->
		<c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" var="i">
			<c:if test="${searchVO.curPage !=i }">
				<li class="page-item"><a class="page-link" href="fundingList.wow?curPage=${i }" data-page="${i }">${i }</a></li>
			</c:if>
			<c:if test="${searchVO.curPage ==i }">
				<li class="page-item active"><a class="page-link" href="#">${i }</a></li> 
			</c:if>
		</c:forEach>

		<!-- 다음  페이지  -->
		<c:if test="${searchVO.lastPage!=searchVO.totalPageCount }">
			<li class="page-item"><a class="page-link" href="fundingList.wow?curPage=${searchVO.lastPage+1 }" data-page="${searchVO.lastPage+1 }">
			<span	aria-hidden="true">&gt;</span></a></li>
		</c:if>

		<!-- 마지막 페이지 -->
		<li class="page-item"><a class="page-link" href="fundingList.wow?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }">
		<span	aria-hidden="true">&raquo;</span></a></li>				
	</ul>
</div>
<!-- END : 페이지네이션  -->


<script type="text/javascript">
		$form=$("form[name='search']");
		$curPage=$form.find("input[name='curPage']");	

		// 페이지 링크 클릭
		$('ul.pagination li a[data-page]').click(function(e) {
			e.preventDefault(); 
			$curPage.val($(this).data('page'));
			$form.submit();	
		}); // ul.pagination li a[data-page]

		
		$form.find("button[type=submit]").click(function(e) {
			e.preventDefault();
			$curPage.val(1);
			$form.submit();
		});

		$('#id_rowSizePerPage').change(function(e) {
			$curPage.val(1);
			$form.find("input[name='rowSizePerPage']").val($(this).val());
			$form.submit();
		}); // '#id_rowSizePerPage'.change

	
</script>
</body>
</html>