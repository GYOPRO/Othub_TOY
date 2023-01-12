<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>othub</title>
<link href="css/adproduct/adpview.css" rel="stylesheet">
</head>
<script src="js/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	//등록
	$("#datainsert").on("click", function(){
		if(confirm("등록하시겠습니까? 쇼핑몰에 반영되니 주의하세요.") == true){
			$("#datainsert2").trigger("click");
	    	  alert("등록됐습니다");
	      }else{
	    	  return;
	      }
	
	});
	//삭제 확인
	$("#adpdelete").click(function(){
	      if(confirm("정말 삭제하시겠습니까?") == true){
	    	  alert("삭제됐습니다");
	      }else{
	    	  return;
	      }
	   }); 
	
	//등록 후 삭제
	$("#datainsert2").on("click", function(){
		location.href="adpdelete?p_id=${getproduct.p_id}";	
	});
	
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
	<%@ include file="../adproduct/adpnav.jsp" %>
	
<!-- chatbot include -->
	<%@include file="../chatbot/chatbot.jsp" %>
	<!-- main container -->
	

	<div id="images">
		<div id="bigImages">
			<img id="big" src='images/${getproduct.p_image1_name }'>
		</div>
		<div id="smallImages">
			<img class="small" src='images/${getproduct.p_image1_name }'>
			<img class="small" src='images/${getproduct.p_image2_name }'>
			<img class="small" src='images/${getproduct.p_image3_name }'>
		</div>
	</div>

<div id="information">
		
		<div id="category">
		<c:if test="${getproduct.category_id == '1' }">
		상의
		</c:if>
		<c:if test="${getproduct.category_id == '2' }">
		하의
		</c:if>	
		<c:if test="${getproduct.category_id == '3' }">
		아우터
		</c:if>
		<c:if test="${getproduct.category_id == '4' }">
		신발
		</c:if>
		<c:if test="${getproduct.category_id == '5' }">
		가방
		</c:if>
		</div>
		
		<div id="p_name">
		<B>${getproduct.p_name }</B><br>
		</div>
		
		<div id="p_brand">
		${getproduct.p_brand }<br>
		</div>
		
		<hr>
		
		<div id="p_price">
		<B><fmt:formatNumber value='${getproduct.p_price}' pattern="#,###"/>원</B><br>
		</div>
		
		<div id="p_stock">
		재고 ${getproduct.p_stock } 
		</div>
		
		<div id="p_sex">
		<c:if test="${getproduct.p_sex == 'male' }">
		남성
		</c:if>
		<c:if test="${getproduct.p_sex == 'female' }">
		여성
		</c:if>
		</div>
		
		
		<div id="buttons">
			<p id="datainsert"> 등록하기 </p>
			<a id="adpamodify" href="adpmodify?p_id=${getproduct.p_id}"> 수정하기</a> |
			<a id="adpdelete" href="adpdelete?p_id=${getproduct.p_id}"> 삭제하기 </a>
			</div>
</div>



<img id=contents src='images/${getproduct.p_contents_name }'/>

<form method="post">
<input type="hidden" name="p_id" value="${getproduct.p_id }">
<input type="hidden" name="p_name" value="${getproduct.p_name }">
<input type="hidden" name="p_sex" value="${getproduct.p_sex }">
<input type="hidden" name="p_price" value="${getproduct.p_price }">
<input type="hidden" name="p_stock" value="${getproduct.p_stock }">
<input type="hidden" name="p_brand" value="${getproduct.p_brand }">
<input type="hidden" name="p_color" value="${getproduct.p_color }">
<input type="hidden" name="category_id" value="${getproduct.category_id }">
<input type="hidden" name="p_thumb_name" value="${getproduct.p_thumb_name }">
<input type="hidden" name="p_image1_name" value="${getproduct.p_image1_name }">
<input type="hidden" name="p_image2_name" value="${getproduct.p_image2_name }">
<input type="hidden" name="p_image3_name" value="${getproduct.p_image3_name }">
<input type="hidden" name="p_contents_name" value="${getproduct.p_contents_name }">
<input type="submit" value="등록하기" id="datainsert2" style="display:none;">

</form>

	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
	
	
	
</body>

</html>