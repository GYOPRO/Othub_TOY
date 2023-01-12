<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

});
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	<!-- main container -->
	<c:forEach items="${productlist }" var="products">
		<tr><td>${products.p_id }</td>
		<td><a href="productdetail?p_id=${products.p_id }">${products.p_name }</a></td>
		<td>${products.p_name }</td></tr>
	</c:forEach>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>