<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="row mt-5">
		<form name="search" action="boardList.wow" method="post" class="form-horizontal">
			<input type="hidden" name="curPage" value="${searchVO.curPage }"> 
			<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">	
			<div class="form-group">
				<div class="row align-items-center">
					<div class="col-2"> <b>분류</b>	</div>
						<div class="col">
							<select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
								<option value="">--선택하세요--</option>							
								<option value="잡담" ${searchVO.searchCategory eq "잡담" ? "selected='selected'" : ""}>잡담</option>
								<option value="펀딩후기" ${searchVO.searchCategory eq "펀딩후기" ? "selected='selected'" : ""}>펀딩후기</option>
								<option value="정보공유" ${searchVO.searchCategory eq "정보공유" ? "selected='selected'" : ""}>정보공유</option>
							</select>
						</div>
						<div class="col-2">
							<button type="submit" class="btn btn-sm btn-primary btn-lg"> 선택	</button>
						</div>
					</div>					
				</div>	
			</form>
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
						<td><a href="boardView.wow?boNo=${board.boNo }">${board.boTitle }</a>
						</td>
						<td>${board.boMemId }</td>
						<td>${board.boRegDate }</td>
						<td>${board.boHit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	<!-- START : 페이지네이션  -->
	<div class="container row" style="float: none; margin:100 auto;">
		<div class="col-md-1" style="float: none; margin:0 auto;">
			<ul class="pagination pagination-sm">
				<!-- 첫 페이지  -->
				<li class="page-item disabled">
					<a class="page-link" href="funding/funding.wow?curPage=1" data-page="1"><span
						aria-hidden="true">&laquo;</span></a>
				</li>
				<!-- 이전 페이지 -->
				<c:if test="${searchVO.firstPage!=1 }">
					<li class="page-item disabled">
						<a class="page-link" href="board.wow?curPage=${searchVO.firstPage-1 }"
						data-page="${searchVO.firstPage-1 }"><span aria-hidden="true">&lt;</span>
						</a>
					</li>
				</c:if>

				<!-- 페이지 넘버링  -->
				<c:forEach begin = "${searchVO.firstPage }" end="${searchVO.lastPage }" var="i">
					<c:if test="${i eq searchVO.curPage }">
						<li class="page-item active"><a class="page-link" href="#">${searchVO.curPage }</a></li>
					</c:if>
					<c:if test="${i ne searchVO.curPage }">
						<li class="page-item">
						<a class="page-link" href="boardList.wow?curPage=${i }" data-page="${i }">${i }</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음  페이지  -->
				<c:if test="${searchVO.lastPage!=searchVO.totalPageCount }">
					<li><a href="boardList.wow?curPage=${searchVO.lastPage+1 }" data-page="${searchVO.lastPage+1 }"><span
							aria-hidden="true">&gt;</span></a></li>
				</c:if>

				<!-- 마지막 페이지 -->
				<li class="page-item">
					<a class="page-link" href="boardList.wow?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }"><span
							aria-hidden="true">&raquo;</span>
					</a>
				</li>
					
			</ul>
		</div>
		<!-- END : 페이지네이션  -->	
		<div class="row mt-2">
			<div class="col-2">
				<c:if test="${USER_INFO.userId ne null}">
					<a href="boardForm.wow">
					<button type="button" class="btn btn-outline-primary">글쓰기</button>
					</a>
				</c:if>	
			</div>
		</div>
	</div>
	</div>
</div>
	<script type="text/javascript">
		$form=$("form[name='search']");
		$curPage=$form.find("input[name='curPage']");

		$('ul.pagination li a[data-page]').click(function(e) {
			e.preventDefault(); 
			$curPage.val($(this).data('page'));
			$form.submit();	
		}); // ul.pagination li a[data-page]
	
		$form.find("button[type=submit]").click(function(e) {
			e.preventDefault();
			$curPage.val(1);
			$form.submit();
			$form=$("form[name='search']");
			$curPage=$form.find("input[name='curPage']");

			$('ul.pagination li a[data-page]').click(function(e) {
				e.preventDefault(); // 이벤트 전파 방지,  <a>의 기본 클릭이벤트를 막기위함
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