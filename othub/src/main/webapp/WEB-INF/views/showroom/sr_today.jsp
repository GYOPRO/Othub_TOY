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
<link href="css/showroom/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
</head>
<body>
	<!-- 이달의 추천 쇼룸 -->
	<section>
		<div class="todayTitle">
			<h3>⭐오늘의 추천 포토룸</h3>
			<i>ⓘpremium</i>
		</div>
		<article class="sr_card_box">
			<c:forEach items="${today_sr }" var="showroom">
				<div class="sr_card">
					<div class="sr_card_img">
						<a href="/showroompost?no=${showroom.sr_num }">
							<img src="images/showroom/user_img/${showroom.sr_imgname1 }">
						</a> 
					</div>
					<div class="sr_card_info">
						<h3><a href="/showroompost?no=${showroom.sr_num }">${showroom.sr_title }</a></h3>
						<div class="location">
							<i class="fa-solid fa-location-dot"></i>
							<span>${showroom.sr_region }</span>
						</div>
						<div class="price">
							<span class="price_val">${showroom.sr_price } </span>
							<span class="price_unit">원/시간</span>
							<c:if test="${role.equals('admin') }">
								<span class="editBtn"><a href="/sr_update?no=${showroom.sr_num }">수정</a></span>
								<span class="editBtn"><a href="/deletePost?no=${showroom.sr_num }">삭제</a></span>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</article>
	</section>
</body>
</html>
