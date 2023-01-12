<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>AdminPage | Othub</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/admin/common2.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});//ready end
</script>
</head>
<body>
	<section class="adminNavBox">
		<div class="admin_list_box">
			<h2 class="h2">관리자 페이지</h2>
			<h3>쇼핑정보 관리</h3>
			<ul>
				<li><a href="ordered">주문내역</a></li>
				<li><a href="goCart">장바구니</a></li>
				<li><a href="datacenter">포즈 데이터 입력</a></li>
				<li><a href="insertproduct">상품 등록</a></li>
				<li><a href="adplistPage?adpnum=1">상품 등록 리스트</a></li>
			</ul>
		</div><br>
		<div class="admin_list_box">
			<h3>회원 관리</h3>
			<ul>
				<li><a href="memberlist">전체 회원 조회</a></li>
				<li><a href="userlist">일반 회원 조회</a></li>
			</ul>
		</div><br>
		<div class="admin_list_box">
			<h3>게시물 관리</h3>
			<ul>
				<li><a href="reportlist">신고된 게시물 조회</a></li>
			</ul>
		</div><br>
		<div class="admin_list_box">
			<h3>파트너 관리</h3>
			<ul>
				<li><a href="partnerlist">입점 신청 조회</a></li>
			</ul>
		</div>
	</section>
</body>
</html>
