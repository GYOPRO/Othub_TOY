<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="css/cart/cartmain.css" rel="stylesheet">
<link href="css/cart/import.css" rel="stylesheet">
<link href="css/cart/common.css" rel="stylesheet">

<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	
	
	
	$(".individual_check").on("change", function(){
		setTotalInfo($(".cart_info_td"));
	});

	
	$(".checkAll").on("click", function(){
		
		if($(".checkAll").is(":checked")){
			$(".individual_check").prop("checked", true);
		}
		else{
			$(".individual_check").prop("checked", false);
		}
		
		setTotalInfo($(".cart_info_td"));
	});

	setTotalInfo();
});



function setTotalInfo(){
	let totalPrice = 0;
	let totalCount = 0;
	let deliveryCost = 0;
	let findTotalPrice = 0;
	let cartList = [];
	
	$(".cart_info_td").each(function(index, element){
	
			if($(element).find(".individual_check").is(":checked") == true ){
				totalPrice += parseInt($(element).find(".individual_totalprice").val());
				totalCount += parseInt($(element).find(".individual_amount").val());
			}
			
			if($(element).find(".individual_check").is(":checked") == true ){
				cartList.push($(element).find(".individual_cartid").val())
			}
			
		
	});

	$(".totalPrice_span").text(totalPrice.toLocaleString());
	$("#totprice").text("s");
	$(".totalCount_span").text(totalCount); 
	$("input#cartToOrder").val(cartList);
}

</script>
 
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	

<table>
	<tr>		
			<th> <input type="checkbox" checked="checked" class="checkAll"> </th>
			<th> 상품정보 </th>
			<th> 상품이미지 </th>
			<th> 색상 </th>
			<th> 수량 </th>
			<th> 금액 </th>
			<th> 삭제하기 </th>		
	</tr>
<c:forEach items="${cart_list}" var="a">		
		<tr>
			<td class="cart_info_td"> 
				
				<input type="checkbox" class="individual_check" checked="checked" id="qxch">
				<input type="hidden" class="individual_price" value="${a.p_price }">
				<input type="hidden" class="individual_amount" value="${a.amount }">
				<input type="hidden" class="individual_totalprice" value="${a.p_price * a.amount}">
				<input type="hidden" class="individual_cartid" value="${a.cart_id }">
			</td> 
			<td> 상품이름 :<a href="productdetail?p_id=${a.p_id }">  ${a.p_name } </a><br>
				상품가격 : <fmt:formatNumber value='${a.p_price}' pattern="#,###"/><br>
				브랜드 : ${a.p_brand }
			</td>
			<td>  <a href="productdetail?p_id=${a.p_id }"> <img src='images/${a.p_thumb }' height="150" width="150"/> </a></td>
			<td> ${a.p_color }</td>
			<td>
				<form action="cartAmount">
				<input name="newamount" type="number" value="${a.amount }"/>
				<input name="newcart_id" type="hidden" value="${a.cart_id}"/>
				<input id="zero" type="submit" value="수정하기">
				</form>
			</td>
			<td> <fmt:formatNumber value='${a.p_price * a.amount}' pattern="#,###"/></td>
			<td> <form action="deleteFromCart">
				<input name="cart_idForDelete" type="hidden" value="${a.cart_id }"/>
				<input id="not" type="submit" value="삭제하기"/>
			</form>
			</td>
		</tr>
	
</c:forEach>
</table>
<div id="hm80"> </div>

<div id="orderss">
	<table>
		<tr>
			<td>
				총 주문금액 <span class="totalPrice_span"></span>원
			</td>
	
			<td>
				총 주문수량 <span class="totalCount_span"></span>개
			</td>
		</tr>
	</table>
</div>


	<form action="/cartToOrder">
	<input type="hidden" id="cartToOrder" name="ppp" value=${cartList }/> 
	<input id="q" type="submit" value="선택상품 주문하기"/>
	</form>

<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>