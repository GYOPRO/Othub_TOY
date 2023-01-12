<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/admin/common2.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
	<main class="ptlist_main">
		<!-- navbar include -->
		<%@include file="../admin/adminpagenav.jsp" %>
		<section class="ptlist_sec1">
			<h3 class="h3">입점 신청 상세 조회</h3> 
			<button class="ptlist_btn" onclick="location.href='/partnerlist'">목록</button>
			<div class="ptlist_box">
				<div class="ptlist_head">
					<span>no</span>
					<span>신청 아이디</span>
					<span>입점유형</span>
					<span>회사명</span>
					<span>담당자</span>
					<span>직급</span>
					<span>연락처</span>
					<span>신청일</span>
				</div>
				<div class="ptlist_body" id="ptlist_body" onclick="">
						<span>${pt.pt_id }</span>
						<span>${pt.m_id }</span>
						<span>${pt.pt_kind }</span>
						<span>${pt.pt_companyName }</span>
						<span>${pt.pt_contectPerName }</span>
						<span>${pt.pt_contectPerPosition }</span>
						<span>${pt.pt_contectPerPhone }</span>
						<span>${pt.pt_uploadtime }</span>
				</div>
				<div class="ptlist_body2" id="ptlist_imgbox" >
					<span>
						<span>사업자등록 번호 : </span>
						<span>${pt.pt_companyRegistNum }</span>
					</span>
					<span>
						<span>홈페이지 url : </span>
						<span>${pt.pt_homePageURL }</span>
					</span>
				</div>
				<div class="ptlist_imgbox"><img src="images/partner/img1/user/${pt.pt_Imgname1}"/></div>
			</div>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
