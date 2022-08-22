<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>

<meta charset="UTF-8">
<title>펀딩 상세보기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/funding/fundingView.css" />
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="row mt-5">
</div>
<div class = "container">
	<div class="fu_header">	
		<h5>${funding.fuCate }</h5>
		<h2>${funding.fuTitle }</h2> 
	</div>
	<div class="row" id="fu_item">
		<div class="col-6" id="fu_img">
			<img class="align-items-center" alt="" src="${funding.fuImg }">
		</div>
		<div class="col-6" id="fu_introduction">
			<div class="introduction">달성 현황</div>
			<div class="fu_detail">
				<h3>${funding.fuAmount }</h3><div class="fuPercent">${funding.fuPercent }</div>
			</div>
			<div class="fu_title">남은 시간</div>
			<div class="fu_detail"><h3>${funding.fuDday } ${funding.fuDday eq "오늘마감" ? "" : "남음"}</h3></div>
			<div class="fu_title">크라우드 펀딩 사이트</div>
			<div class="fu_detail"><h4>${funding.fuSite }</h4></div>
			<div class="fu_title">창작자</div>
			<div class="fu_detail"><h4>${funding.fuEnter }</h4></div>
			
			<div class="option">
				<!-- 찜하기 부분 -->
				<c:if test="${USER_INFO eq null }">
				<button type="button" class="btn btn-secondary disabled">
				<ion-icon name="heart-outline" size="large"></ion-icon> ${funding.fuLike }</button> 
				</c:if>
				<c:if test="${USER_INFO ne null }">
					<form id="addLike" name="addLike" >					
						<input type="hidden" id="fuNo" name="fuNo" value="${funding.fuNo }">
						<input type="hidden" id="memId" name="memId" value="${USER_INFO.userId }">
						<!-- 사용자가 좋아요 안 한 글일 때 -->
						<c:if test="${checklike eq 0 }">
						<div id="emptyheart">
							<button type="button" class="btn" id="heartClick">
							<ion-icon name="heart-outline"size="large">	</ion-icon> 
							${funding.fuLike }</button>
						</div>	
						</c:if>
						<!-- 사용자가 좋아요 한 글일 때 -->
						<c:if test="${checklike eq 1 }">
						<div id="fillheart">
							<button type="button" class="btn" id="heartClick">
							<ion-icon id="heart" name="heart"  size="large"></ion-icon> 
							${funding.fuLike }</button>
						</div>	
						</c:if>
					</form>					
				</c:if>
				<!-- 찜하기 부분 끝 -->
				<button type="button" class="btn" onclick="clip(); return false;">
				<ion-icon name="share-social-outline"  size="large"></ion-icon></button>
			</div>			
				<button type="button" class="btn btn-primary btn-lg" onclick="window.open('${funding.fuUrl}')">&nbsp;&nbsp;더 알아보기&nbsp;&nbsp;</button>		
		</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	$("#heartClick").click(function(){
		let fuNo = $("form[name='addLike']").find('#fuNo').val();
		let memId = $("form[name='addLike']").find('#memId').val();
		$.ajax({
			url: "<c:url value='/like/saveLike.wow'/>"
			,type : 'POST'
			,data : {memId : memId, fuNo : fuNo}
			,success : function(data){
				if(data == 0){						
					alert("찜하였습니다");					
					document.location.href = document.location.href;
				}else if(data == 1){
					alert("찜을 취소하였습니다");					
					document.location.href = document.location.href;
				}				
			},
			error : function() {
                alert('error');
            }
		}); 				
	});
});

function clip(){

    let url = '';    
    let textarea = document.createElement("textarea");      
    document.body.appendChild(textarea); 
    url = window.document.location.href;  
    textarea.value = url;  
    textarea.select(); 
    document.execCommand("copy");   
    document.body.removeChild(textarea);
    
    alert("URL이 복사되었습니다.")  
}

</script>

</body>
</html>