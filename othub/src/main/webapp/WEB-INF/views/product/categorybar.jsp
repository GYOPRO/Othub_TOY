<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> </title>

<style>
	
nav.c_nav {
	float:left;
	text-align:center;
	padding-left:50px;
	margin-bottom:10px;
	width:150px;
	position:relative;
	top: 50px;
	font-size:16px;
}

ul.nav_category{
	margin:0;
	padding:0;
}

h3 { 
	margin:0;
	padding:0;
	font-size:22px;
	margin-bottom:20px;
	text-align:center;
}

a#c_nav_d {
	color:#000;
	display:block;
	padding:10px 0;
}

a#c_nav_d:hover {
 	text-decoration:none;
 	background:#eee;
}

</style>

<script src="https://kit.fontawesome.com/95fa5ec673.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>

</script>
</head>
<body>
	<header>
	
		<nav class="c_nav">
		
		<h3> 카테고리 </h3>
			
				<ul class="nav_category">
					<li><a id="c_nav_d" href="/listrecom?c=1">상의</a></li>
					<li><a id="c_nav_d" href="/listrecom?c=2">하의</a></li>
					<li><a id="c_nav_d" href="/listrecom?c=3">아우터</a></li>
					<li><a id="c_nav_d" href="/listrecom?c=4">신발</a></li>
					<li><a id="c_nav_d" href="/listrecom?c=5">가방</a></li>
					<li><a id="c_nav_d" href="/reviewlist?reviewnum=1" id="list_button">리뷰</a></li>
				</ul>
			
		</nav>
	</header>
</body>
</html>
