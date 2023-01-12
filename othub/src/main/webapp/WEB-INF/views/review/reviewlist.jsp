<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="css/review/reviewlist.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
});//ready end
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../review/reviewnav.jsp" %>
	
<!-- chatbot include -->
	<%@include file="../chatbot/chatbot.jsp" %>
	
	<!-- 이 달의 우수 리뷰 -->

<div class="top_review">
<img src="images/review/tape.png" id="tape_top">
<img src="images/review/1.jpeg" style="width:400px" id="top_review_pic">
<p class="top_reivew_con"> <b> ✨ 이 달의 리뷰 - bomi님 ✨</b> <br>
<br>
날씨가 많이 쌀쌀해져서 니트 하나 구매했는데 <br>
까끌거리지도 않고 딱 좋아요! <br>
너무 맘에 들어서 다른 색들도 사려고 합니다 추천해요!:) </p> <br>
<p class="top_reivew_inform"> 💖 이 달의 리뷰로 선정되신 분들께는 <br>
10,000포인트를 적립해드립니다! 💖 </p>
</div>
	
<table>

<thead>
  <tr class="reviewtr">
   <th class="reviewtr_w">작성자</th>
   <th class="reviewtr_p">상품명</th>
   <th class="reviewtr_ev">만족도</th>
   <th class="reviewtr_d">작성일</th>
  </tr>
 </thead>
 
 <c:forEach items="${reviewlist}" var="reviewlist">
 <tr class="reviewtrbody">

 <td class="review_w">${reviewlist.review_writer}</td>
 
 <td class="review_p">
 <a href="/reviewview?order_id=${reviewlist.order_id}">${reviewlist.p_name}</a>
</td>
 
 <td class="review_ev">
 <c:if test="${reviewlist.review_evaluation == 'good' }">
 만족해요
 </c:if>
 <c:if test="${reviewlist.review_evaluation == 'bad' }">
 별로예요
 </c:if>
 </td>
 <td class="review_d"><fmt:formatDate value="${reviewlist.review_regdate}" pattern="yyyy-MM-dd"/></td>
 </tr>
 
 </c:forEach>
 
 
 </table>
 
 <div class="listnumber">
<c:if test="${reviewprev}">
 <span>[ <a href="/reviewlist?csnum=${reviewstartPageNum - 1}">이전</a> ] 
  </span>
</c:if>

<c:forEach begin="${reviewstartPageNum}" end="${reviewendPageNum}" var="reviewnum">
  <span>
    <c:if test="${reviewselect != reviewnum}">
   <a href="/reviewlist?reviewnum=${reviewnum}">${reviewnum}</a>
  </c:if>    
  
  <c:if test="${reviewselect == reviewnum}">
   <b>${reviewnum}</b>
  </c:if>
  </span>
</c:forEach>

<c:if test="${reviewnext}">
 <span>[ <a href="/reviewlist?reviewnum=${reviewendPageNum + 1}">다음</a> ] 
 </span>
</c:if>
</div>	
	
	
	
	

<!-- footer include -->
	<%@include file="../include/footer.jsp" %>

</body>
</html>