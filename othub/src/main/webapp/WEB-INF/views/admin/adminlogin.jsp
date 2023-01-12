<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login | Othub</title>
<!-- Meta Tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<!-- css, javascript -->
<link href="css/admin/common.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
	<!-- main container -->
	<main>
		<section class="loginbox">
			<h2>Admin Login</h2>
			<form action="adminloginprocess" method="post">
				<input id="adminid" type="text" name="a_id" placeholder="Id"><br>			
				<input id="adminpw" type="password" name="a_pw" placeholder="Password"><br>	
				<input id="loginSubmit" type="submit" value="Login"><br>	
				<c:if test="${message == 'error' }">
					<p>아이디 또는 비밀번호가 일치하지 않습니다</p>
				</c:if>
			</form>
		</section>
	</main>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
