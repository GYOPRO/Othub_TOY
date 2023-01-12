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
<link href="css/reserv/common.css" rel="stylesheet">
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
	
	<section class="myReserv">
		<!-- mypage nav -->
		<%@include file="../member/mypagebar.jsp" %>
		<div class="myreservBox">
			<h3 class="reservTitle">MY예약</h3>
			<c:forEach items="${myList}" var="myreserv">
				<div class="rtime">${myreserv.r_registTime }</div>
				<div class="reserv_card">
					<div class="reserv_head">
						<span>예약상품 정보</span>
						<span>인원</span>
						<span>예약자</span>
						<span>상태</span>
					</div>
					<div class="reserv_body">
						<span>
							<img src="images/showroom/user_img/${myreserv.showroomdto.sr_imgname1}" >
							<div>
								<span>${myreserv.showroomdto.sr_contents }</span><br>
								<span>
									<span class="rinfo">예약일 : </span>
									<span class="rdate">${myreserv.r_date }</span>
								</span><br>
								<span>
									<span class="rinfo">위치 : </span>
									<span>${myreserv.showroomdto.sr_address2 }</span>
								</span>
							</div>
						</span>
						<span>${myreserv.r_numOfPer }</span>
						<span>${myreserv.r_orderer }</span>
						<span>미사용</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
