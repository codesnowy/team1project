<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>

<meta charset="UTF-8">
<title>나의 펀딩</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/funding/fundingList.css" />
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="row mt-5"></div>
<form id="fundinginfo" name="fundinginfo" >
<input type="hidden" id="memId" name="memId" value="${USER_INFO.userId }">
</form>

<div class="container" id="list">

</div>

<script type="text/javascript">
let memId = $("form[name='fundinginfo']").find('#memId').val();
let list ="";
var result =[];
let currentPage = 0;

function fn_funding_list(){
	 $.ajax({
       url:"<c:url value='/member/myfundingget.wow'/>"
    	 , data:{memId : memId}
       , success: function(data) {
	    	   list = data.result;	    	 
	    	   console.log(list)
	    	   for(i=0; i < list.length; i += 12){
	    	   		result.push(list.slice(i, i + 12));
	    	   }
        },
		error : function() {
            alert('error');
      },
     complete : function() {       
    	 	fn_page(currentPage);
    	  }
	 }); //ajax
}

function fn_page (num){
/* 	console.log(result[num]); */
	str = "";
	$.each(result[num], function(i, element) {				   
		str+='<div class="funding">';
		str+='<a href="<%=request.getContextPath()%>/funding/fundingView.wow?fuNo='+ element.fuNo +'&memId=${USER_INFO.userId}"><img class="fundingimg" alt="" src="'+ element.fuImg +'"></a>';
		str+='<a href="<%=request.getContextPath()%>/funding/fundingView.wow?fuNo='+ element.fuNo +'&memId=${USER_INFO.userId}"><b>'+ element.fuTitle +'</b></a>';
		str+='<div class="amount">'+ element.fuAmount +' 달성('+ element.fuPercent +' %)</div>';
		str+='<div class="category">♥'+ element.fulike +' <b>｜</b> '+ element.fuCate +'	</div>';
		str+='<div class="fuDday"><b>'+ element.fuDday +'일 남음｜</b> '+ element.fuSite +' </div>';
		str+='</div>';
	});
		$("#list").append(str);
}

$(function(){
	fn_funding_list();
});	

//스크롤 바닥 감지
window.onscroll = function(e) {	
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    	currentPage +=1;
    	fn_page(currentPage);
    }
};

</script>

</body>
</html>