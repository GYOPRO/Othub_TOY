<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MemberList | Othub</title>
   <link href="css/order/orderdetail/import.css" rel="stylesheet">
    <link href="css/order/orderdetail/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		
		$("#deletebtn").click(function(ev){
			 if(!confirm("탈퇴 처리 하시겠습니까?")) {
				 ev.preventDefault();
			 }
		 });
		
		});//ready end
	</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
	<section class="myorder">
		<!-- mypage nav -->
		<%@include file="../member/mypagebar.jsp" %>
		<div class="myorderBox">
			<h3 class="orderTitle">주문내역</h3>
				<div class="inner">
      <div class= "table" >
         <table id="inventory" class="tablesd">
            <colgroup>
               <col width="150px"><col width="250px"><col width="200px"><col width="70px"><col width="70px"><col width="150px">
            </colgroup>
            <thead>
               <tr>
                <th colspan="2">상품정보</th>
            <th>주문날짜</th>
            <th>색상</th>
            <th> 수량 </th>
            <th> 금액 </th>
            <th> 리뷰 </th>
               </tr>
            </thead>
            <tbody>
                  <c:forEach items="${ordered}" var="a">
            <tr><td> <img src='images/${a.p_thumb}' height="150" width="150"/></td>
               <td> 
                  <p class="top">${a.p_brand }</p>
                  <p class="middle">상품명 : ${a.p_name }</p>
                  <p class="bottom">상품가격 : <fmt:formatNumber value='${a.p_price}' pattern="#,###"/> 원</p>

               </td>
               <td> ${a.orderdate }</td> 
               
               <td> ${a.p_color }</td>
               <td> ${a.amount } </td>
               <td> <fmt:formatNumber value='${a.p_price * a.amount}' pattern="#,###"/> 원</td>
               <td> 
               <c:if test="${a.review_check == 'n'}">
               <a href="/reviewwrite?order_id=${a.order_id }" id="review_write">리뷰 작성 </a>
               </c:if>
               <c:if test="${a.review_check == 'y'}">
               <a href="/reviewview?order_id=${a.order_id}" id="review_write">작성한 리뷰 보러 가기</a>
               </c:if>
               </td>
            </tr>
            </c:forEach>
            </tbody>
         </table>
         <h3 id="last"> 총 주문 금액 : <fmt:formatNumber value='${total_price}' pattern="#,###"/> 원</h3>
   </div>

   </div>
	</section>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>


</html>