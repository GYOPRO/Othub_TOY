<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/review/reviewview.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$(".delete").click(function(){
	      if(confirm("정말 삭제하시겠습니까?") == true){
	    	  alert("삭제됐습니다");
	      }else{
	    	  event.preventDefault();
	      }
	   }); 	
	
	$("#precheck").click(function(){
		window.open("/pointcheck?image=${reviewview.review_pic_name}");
		});
	
	$("#check").click(function(){
		window.open("/pointresult?image=${reviewview.review_pic_name}");
	});
		
});//ready end

function offdisplay() {
	document.getElementById("check").style.display = "none";
	}


</script>

</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../review/reviewnav.jsp" %>
	
<!-- chatbot include -->
	<%@include file="../chatbot/chatbot.jsp" %>
	
	
<form method ="post" class="review_form">
	
	<div class="review_contents">
	
	<hr style="background:black; height:2px;">
	
	<div class="review_t">
	<c:if test="${reviewview.review_evaluation == 'good'}">
	<b>${reviewview.p_name} 만족해요</b>
	</c:if>
	<c:if test="${reviewview.review_evaluation == 'bad'}">
	<b> ${reviewview.p_name} 별로예요</b>
	</c:if>
	</div>
	
	
	<hr style="border-color:gray; border-width:1px 5 0 0; border-style:dashed;">	
	<label><b class="review_c_t">리뷰 내용</b></label>
	<div class="review_w">
	${reviewview.review_writer}
	</div>
	
	<div class="review_c">
	${reviewview.review_contents}<br>
	</div>
	
	
	<c:if test="${reviewview.review_pic_name != null}">
	<img src="images/review/review_pic/${reviewview.review_pic_name}" style="width: 500px" ><br>
	
		<input type="button" id="precheck" value="적립 가능 포인트"/> 
		<c:if test="${(m_id == reviewview.review_writer || role1 == 'admin') && (reviewview.point_check != 'y')}">
		<button type="submit" id="check" onclick="offdisplay()"> 포인트 적립하기 </button>
		<input type="hidden" name="order_id" value="${reviewview.order_id}" />
		<input type="hidden" name="point_check" value="y" />
		
		
		
		</c:if>
		
		
	</c:if>
	
	
	
	
	</div>
		
	
<c:if test="${m_id == reviewview.review_writer || role1 == 'admin'}">
	
	<div class="writerbutton">
	<a href="/reviewmodify?order_id=${reviewview.order_id }" class="modify">게시물 수정</a>  &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp 
	<a href="/reviewdelete?order_id=${reviewview.order_id}" class="delete">게시물 삭제</a> <br>
	
	</div>
	
</c:if>

</form>

	
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>

</body>
</html>