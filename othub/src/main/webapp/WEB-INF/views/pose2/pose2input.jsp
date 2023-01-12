<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/pose2/pose2.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
<c:forEach items="${filelist }" var="onefile">
<h3> <a href="pose2result?image=${onefile }"> ${onefile } </a> </h3>
<img src="/images/${onefile }" style="width:100px; height:100px;">
</c:forEach>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>