<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link href="css/order/import.css" rel="stylesheet">
    <link href="css/order/common.css" rel="stylesheet">
     <link href="css/order/orders.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
		
<div class="table">
<table class="table" border="2">
	<tr class="table">
		<th>상품정보</th>
		<th>상품이미지</th>
		<th>색상</th>
		<th> 수량 </th>
		<th> 금액 </th>
	</tr>


	<c:forEach items="${ordersdetail}" var="a">
		<tr>
			<td> 상품이름 : ${a.p_name }<br>
				상품가격 : <fmt:formatNumber value='${a.p_price}' pattern="#,###"/><br>
				브랜드 : ${a.p_brand }
			</td>
			<td> <img src='images/${a.p_thumb}' height="150" width="150"/></td>
			<td> <span style="color:${a.p_color}"> ${a.p_color }</span></td>
			<td> ${a.amount } </td>
			<td> <fmt:formatNumber value='${a.p_price * a.amount}' pattern="#,###"/></td>
		</tr>
	</c:forEach>
</table>
</div>
<div class="totprice"> 총 주문 금액 : <fmt:formatNumber value='${total_price}' pattern="#,###"/> 원</div>

<div class="userinfor">
<div class="inforhead"> 주문자 정보 </div>>
이름 : ${memberdetail.m_name } <br>>
주소 : ${memberdetail.m_address } <br>>
전화번호 : ${memberdetail.m_phone } <br>>
이메일주소 : ${memberdetail.m_email } <br>
</div>

<form action="doOrder">
	<c:forEach items="${ordersdetail}" var="a">
	<input type="hidden" name="order_ids" value="${a.order_id}">
	<input type="hidden" name="p_ids" value="${a.p_id}">
	<input type="hidden" name="amounts" value="${a.amount }">
	</c:forEach>
	<input class="bttn" type="submit" value="주문하기" onClick="alert('주문 완료되었습니다.')">
</form>

<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>