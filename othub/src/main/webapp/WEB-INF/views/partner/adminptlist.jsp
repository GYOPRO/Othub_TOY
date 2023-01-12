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
	$(document).ready(function() {
			
	});//ready end
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
			<h3 class="h3">입점 신청 조회</h3>
			<div>
				<table class="ptlist_table">
					<thead class="ptlist_thead">
						<tr>
							<th>no</th>
							<th>신청 아이디</th>
							<th>입점 카테고리</th>
							<th>회사명</th>
							<th>담당자</th>
							<th>직급</th>
							<th>연락처</th>
							<th>신청일</th>
						</tr>
					</thead>
					<tbody class="ptlist_tbody">
						<c:forEach items="${ptlist }" var="list">
							<tr>
								<td>${list.pt_id }</td>
								<td>${list.m_id }</td>
								<td>${list.pt_kind }</td>
								<td>${list.pt_companyName }</td>
								<td>${list.pt_contectPerName }</td>
								<td>${list.pt_contectPerPosition }</td>
								<td>${list.pt_contectPerPhone }</td>
								<td>${list.pt_uploadtime }</td>
							</tr>
							<tr>
								<td colspan="8">
									<div class="ptlist_imgbox">
										<img src="images/partner/img1/${list.pt_Imgname1}"/>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
