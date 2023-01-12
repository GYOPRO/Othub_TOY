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
	//새로고침 insert 방지
	function NotReload(){
	    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
	        event.keyCode = 0;
	        event.cancelBubble = true;
	        event.returnValue = false;
	    } 
	}
	document.onkeydown = NotReload;
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	  
	<!-- main container -->
	<main>
		<section class="r_main_sec1">
			<h3 class="r_main_h3">예약 포토룸</h3>
			<article>
				<div class="r_main_arti">
					<div class="r_main_info info_img">
						<img src="images/showroom/user_img/${showroomInfo.sr_imgname1 }">
					</div>
					<div class="r_main_info info_sub">
						<div class="info_top">
							<span class="info_title">${showroomInfo.sr_contents }</span><br>
							<span>예약일로 부터 2일안에 확인 전화드립니다.</span>
						</div>
						<div class="info_p">
							<span>포토룸 유형</span>
							<span>
								<c:if test="${showroomInfo.sr_kind == 1 }">
									스튜디오
								</c:if>
								<c:if test="${showroomInfo.sr_kind == 2 }">
									사진관
								</c:if>
								<c:if test="${showroomInfo.sr_kind == 3 }">
									사진작가
								</c:if>
							</span>
						</div>
						<div class="info_p">
							<span>영업시간</span>
							<span>${showroomInfo.sr_operatingtime }</span>
						</div>
						<div class="info_p">
							<span>휴무일</span>
							<span>${showroomInfo.sr_closed }</span>
						</div>
						<div class="info_p">
							<span>위치</span>
							<span>${showroomInfo.sr_region }</span>
						</div>
					</div>
				</div>
			</article>
		</section>
		<section class="r_main_sec2">
			<h3 class="r_main_h3">예약 정보</h3>
			<div class="reserv_info">
				<div class="info2">
					<span>예약 인원</span>
					<span>${reservView.r_numOfPer }명</span>
				</div>
				<div class="info2">
					<span>예약 일자</span>
					<span>${reservView.r_date }</span>
				</div>
			</div>
			<form class="reserv_form" method="post">
				<label for="r_orderer" class="orderer_label">예약자 명</label><br>
				<input type="text" name="r_orderer" placeholder="예약자 이름을 입력해주세요." required>
				<input type="hidden" name="r_id" value="${reservView.r_id }">
				<input type="hidden" name="m_id" value="${reservView.m_id }">
				<input type="hidden" name="r_price" value="${showroomInfo.sr_price }"><br>
				<button type="submit" onclick="javascript:form.action='/reservprocess'">예약 하기</button>
			</form>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>
