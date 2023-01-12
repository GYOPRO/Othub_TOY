<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>of-hub-product-detail</title>
<link href="css/productdetail/productdetail.css" rel="stylesheet">
<link href="css/productdetail/import.css" rel="stylesheet">
<link href="css/productdetail/common.css" rel="stylesheet">
</head>
<script src="js/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	$("#orderbtn").on("click", function(){
		if("${mid}" != null){
		//var q = $("#amount").val() 
			if($("#amount").val() > 0 && $("#amount").val() <= ${productdetail.p_stock}){
				$.ajax({
					url:  'ordermain',
					data: {amount:$("#amount").val(),p_id:${productdetail.p_id},m_id:"${mid}"},
					type: 'post',
					//datatype: 'json',
					success: function(a){
						alert('주문페이지로 이동합니다.');
						let url ="/ordermain2";
						location.replace(url);
					},
					error: function(){
						alert('로그인 해주세요.');
					}
				});//ajax
			}//if 양수판단 및 재고 판단.
			else if($("#amount").val() < 1) {alert("수량을 1개 이상 입력해주세요.");}
			else if($("#amount").val() > ${productdetail.p_stock}) {alert("주문수량이 재고보다 많습니다.");}
		}//if login
		else{alert("로그인 해주세요.");}
	});//order click
	$("#cartbtn").on("click", function(){
		if("${mid}" != null){
			if($("#amount").val() > 0 && $("#amount").val() <= ${productdetail.p_stock}){
				$.ajax({
					url: 'insertCart',
					data: {amount:$("#amount").val(),p_id:${productdetail.p_id},m_id:"${mid}"},
					type: 'post',
					success: function(){
						var result = confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?");
						if(result){
							location.replace("/goCart");
						}
					},
					error: function(){
						alert('수량을 선택해주세요.');
					}
				});//ajax
			}//amount 판단
			else if($("#amount").val() < 1) {alert("수량을 1개 이상 입력해주세요.");}
			else if($("#amount").val() > ${productdetail.p_stock}) {alert("주문수량이 재고보다 많습니다.");}
		}//if 로그인판단
		else{alert("로그인 해주세요.");}
	});//click
});//ready

</script>
<script>
var bigPic;
window.onload = function(){
bigPic = document.querySelector("#big");
var smallPics = document.querySelectorAll(".small");


for(var i = 0; i < smallPics.length; i++){
	console.log(smallPics[i].getAttribute("src"));
	smallPics[i].addEventListener("click", changepic);
}
}

function changepic(){
	//console.log(this.getAttribute("src"));
	var smallPicAttribute = this.getAttribute("src");
	bigPic.setAttribute("src", smallPicAttribute);
	
}
</script>

<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	<!-- main container -->
<div id="qqq">
	<div id="images">
		<div id="bigImages">
			<img id="big" src='images/${productdetail.p_image1 }'>
		</div>
		<div id="smallImages">
			<img class="small" src='images/${productdetail.p_image1 }'>
			<img class="small" src='images/${productdetail.p_image2 }'>
			<img class="small" src='images/${productdetail.p_image3 }'>
		</div>
	</div>

	<div id="information">
	<div id="head" > </div>

		<div id="fixed"> 
			
			<div id="p_name">${productdetail.p_name }</div>
			<hr>
			<div id="p_information1">
				<div>
					<div id="top"> 브랜드 </div>
					<div id="bottom"> ${productdetail.p_brand } </div>
				</div>
				
				<div>
					<div id="top"> 성별 </div>
					<div id="bottom"> <%
					String sex = "male";
					String p_sex = (String)request.getAttribute("p_sex");
					if(sex.equals( p_sex  )){
					%>
					남성 <br>		
					<%}
					else{%>
					여성 <br>		
					<%}%> </div>
				</div>
				<div>
					<div id="top"> 색상 </div>
					<div id="bottom"> ${productdetail.p_color } </div>
				</div>
				
			
			</div>
			<hr>
			<div id="hm80"></div>
			<hr>
			<div id="p_information1">
				<div>
					<div id="top"> 조회수📍 </div>
					<div id="bottom"> ${productdetail.p_viewcount } </div>
				</div>
				<div>
					<div id="top"> 좋아요💗 </div>
					<div id="bottom"> ${productdetail.p_like } </div>
				</div>
			</div>
			<hr>
			<div id="hm80"></div>
			<hr>
			
			<div id="p_information1">
				<div>
					<div id="top"> 가격💰 </div>
					<div id="bottom"> <fmt:formatNumber value='${productdetail.p_price}' pattern="#,###"/>원 </div>
				</div>
				<div>
					<div id="top"> 재고 </div>
					<div id="bottom"> ${productdetail.p_stock } </div>
				</div>
			</div>
			<hr>
			
			
			
			
			<div id="orderss"> 
			수량선택
			<input type=number id="amount" name="amount" value=1 min=1 max="${productdetail.p_stock }" size="10"><br> 			
			<input type=button value="구매하기" class="bttn" id="orderbtn">
			<input type=button value="장바구니" class="bttn" id="cartbtn">
			
			</div>
		</div>
		
		
		
		
				
	
	
	</div>
</div>
<img id=contents src='images/${productdetail.p_contents }'/>

	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
	
	
	
</body>

</html>