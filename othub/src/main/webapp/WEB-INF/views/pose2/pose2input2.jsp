<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
<c:forEach items="${data_list }" var="onefile">
<h1>${onefile[1] }</h1>
	<c:forEach items="${onefile }" var="twofile" begin="2" end="5">
<h3> <a href="pose2result3?image=${twofile }&p_id=${onefile[0]}"> ${twofile } </a> </h3>
<img src="/images/${twofile }" style="width:150px; height:150px;">
	</c:forEach>
<hr>
</c:forEach>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>