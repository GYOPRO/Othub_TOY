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
/*
	$(document).ready(function() {
		$('.ptlist_body').click(function(){ 
			if($('.ptlist_imgbox').css('display') == 'none'){
				$('.ptlist_imgbox').css('display', 'block');
			}
			else{
				$('.ptlist_imgbox').css('display', 'none');
			}
		});
	});//ready end

	function listclick('${status.index}'){
		var ptlist_bodys = document.querySelectorAll(".ptlist_body");
		for(var i =0; i < ptlist_bodys.length; i++){
			if(ptlist_bodys[i].css.style){
				
			}
		}
	}
	*/
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
				<c:forEach items="${ptlist }" var="list"  varStatus="status">
					<div class="ptlist_body" id="ptlist_body" onclick="">
						<a href="detailpartner?id=${list.pt_id }">
							<span>${list.pt_id }</span>
							<span>${list.m_id }</span>
							<span>${list.pt_kind }</span>
							<span>${list.pt_companyName }</span>
							<span>${list.pt_contectPerName }</span>
							<span>${list.pt_contectPerPosition }</span>
							<span>${list.pt_contectPerPhone }</span>
							<span>${list.pt_uploadtime }</span>
						</a>
					</div>
				</c:forEach> 
			</div>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
