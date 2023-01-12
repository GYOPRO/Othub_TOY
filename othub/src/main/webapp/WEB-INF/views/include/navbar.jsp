<%@page import="admin.AdminDTO"%>
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
<script src="https://kit.fontawesome.com/95fa5ec673.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		//반응형 메뉴버튼
		$(".nav_toggleBtn").on("click", function(){
			$('.nav_user_menu').toggleClass('active');
			$('.nav_main_menu').toggleClass('active');
		})//on click
	});//ready end
</script>
</head>
<body>

	<%//variable
		String m_id = (String)session.getAttribute("m_id");
		String role1 = (String)session.getAttribute("role1");
	%>
	<!-- header -->
	<header>
		<nav class="nav">
			<div href="" class="nav_toggleBtn">
				<i class="fa-solid fa-bars"></i>
			</div>
			<div class="nav_bar1">
				<div class="nav_logo">
					<a href="/">OT-HUB</a>
				</div>
				<ul class="nav_user_menu">
					<!-- 회원 | 관리자 | 로그인 -->
					<li><% 
					if(m_id == null){
						%><a href="login"><%out.print("login");%></a><%
					}
					else if(role1.equals("admin")){
						out.print(m_id + " 관리자님 접속되었습니다.");
					}
					else if(role1.equals("user") || role1.equals("partner")){
						out.print(m_id + "님 환영합니다.");
					}
					%></li>
					<!--마이페이지 | 관리자페이지 | 회원가입-->
					<li><% 
					if(m_id == null){
						%><a href="signin"><%out.print("sign up");%></a><%
					}
					else if(role1.equals("user") || role1.equals("partner")){
						%><a href="mypage"><%out.print("mypage");%></a><%
					}
					else if(role1.equals("admin")){
						%><a href="adminpage"><%out.print("AdminPage");%></a><%
					}
					%></li>
					<!-- 고객센터 -->
					<li><a href="/cslistPage?csnum=1">Customer Support</a></li>
					<!-- 회원로그아웃 | 관리자로그아웃 -->
					<li><% 
					if(m_id !=null){
						%><a href="logout"><%out.print("logout");%></a><%
					}%>
					</li>
				</ul>
			</div>
			<div class="nav_bar2">
				<div class="nav_main_menu">
					<span><a href="community">룩북</a></span>
					<span><a href="/listrecom?c=1">쇼핑몰</a></span>
					<span><a href="showroom">포토룸</a></span>
					<span><a href="pose2inputU">내 체형의 옷 찾기</a></span>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>
