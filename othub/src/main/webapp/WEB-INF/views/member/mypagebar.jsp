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
.mycontainer{
	vertical-align: top;
}
ul li, ul{
	padding:0;
}
.h2{
	font-size: 2em;
	margin:0 0 1.5em 0;
	color:#111;
}
.mycontainer, .container1, .container2 {
	display: inline-block;
}
.container2 {
	vertical-align:top;
	margin-left:3.5em;
	width:81%; 
	height:300px;

}

.inner1{
	width:49%; 
	height:150px;
	float:left;
	border-right: 1px solid white;
	display: inherit;
	background-color:#2186db;
}
.x{
	font-family: 'PreBold', sans-serif;
	margin : 10px;
	color: white;
	font-size: 20px;
	border-bottom: 1px solid white;
	padding-bottom: 10px;
	padding-top: 5px;
}
.y{
	font-family: 'PreBold', sans-serif;
	margin : 10px;
	color: white;
	font-size: 50px;
	margin-bottom: 1px;
}
.inner2{
	width:50%; 
	height:150px;
	float:left;
	display: inherit;
	background-color:#2186db;
}
.container2 > h1{
	font-size: 2.5em;
	margin:0 0 20px 0;
}
.container1 h3{
	font-size: 25px;
	margin-bottom: 5px;
	margin-top: 30px;
}
.container1 li{
	font-size: 15px;
	padding: 5px 0;
}
</style>

<script src="https://kit.fontawesome.com/95fa5ec673.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>

</script>
</head>
<body class="mybar">
	<section class="mycontainer">
		<div class="container1">
			<a href="mypage"><h2 class="h2">마이페이지</h2></a>
			<h3>나의 쇼핑</h3>
			<ul class="nav_category">
				<li><a id="c_nav_d" href="ordered">주문내역</a></li>
				<li><a id="c_nav_d" href="goCart">장바구니</a></li>
				<li><a id="c_nav_d" href="myreserv?m_id=<%=session.getAttribute("m_id")%>">예약정보</a></li>
				<li><a id="c_nav_d" href="myreviewlist?reviewnum=1">내 리뷰</a></li>
			</ul>
			<h3>내 정보</h3>
			<ul class="nav_category">
				<li><a id="c_nav_d" href="updateform">프로필 정보/수정</a></li>
				<li><a id="c_nav_d" href="mycoupon">쿠폰함</a></li>
			</ul>

			<h3>커뮤니티</h3>
			<ul class="nav_category">
				<li><a id="c_nav_d" href="mycommunity">내 게시글</a></li>
				<li><a id="c_nav_d" href="mycomment">내가 쓴 댓글</a></li>
				<li><a id="c_nav_d" href="mylikecommunity">좋아요한 게시글</a></li>
			</ul>
		</div>
	</section>
</body>
</html>
