<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<%@include file="/WEB-INF/inc/header.jsp" %>
<style type="text/css">
.homeimg{
  margin-left: 200px;
  width: 800px;
  height: 800px;

}
</style>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp"%>
<div class = "container">
<div class="row mt-5">
</div>
<img class="homeimg" alt="" src="<%=request.getContextPath() %>/resources/img/home.gif">
</div>
</body>
</html>
