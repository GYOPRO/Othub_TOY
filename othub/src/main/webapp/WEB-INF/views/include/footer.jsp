<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link href="css/main/style.css" rel="stylesheet">
</head>
<body>
	<footer>
	 	<div class="footer_line"></div>
		<div class="footer">
			<span><a href="#">team.mandlejo</a></span>
			<span><a href="https://github.com/OlttaeMelona/othub_project_2022">깃허브</a></span>
			<c:if test="${role1 == null }">
				<span><a href="/login">입점신청</a></span>
			</c:if>
			<c:if test="${role1 != null }">
				<span><a href="/ocrpage">입점신청</a></span>
			</c:if>
			<span><a href="/cslistPage?csnum=1">고객센터</a></span>
		</div>
	</footer>
</body>
</html>
