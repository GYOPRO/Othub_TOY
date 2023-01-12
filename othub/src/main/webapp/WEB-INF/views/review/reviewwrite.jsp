<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="css/review/reviewwrite.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){

	
	});
	
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../review/reviewnav.jsp" %>
	
	<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>


	
<form method="post" enctype="multipart/form-data" class="writing_box">
<div class="top_info">

	<div class="writer">&#128221; ${m_id}</div>

	<div class="regdate">&#9200;</div>
	<div id="current_date">
	
	<script>
	date = new Date();
	year = date.getFullYear();
	month = date.getMonth() + 1;
	day = date.getDate();
	document.getElementById("current_date").innerHTML = year + "-" + month + "-" + day;
	</script>
	</div>

	<div class="review_ev"> ${p_name }이/가
		<input type="radio" value="good" name="review_evaluation" checked /> 좋았어요
		<input type="radio" value="bad" name="review_evaluation" /> 별로였어요 <br>
	</div>	
	
	<button type="submit" class="review_submit">작성</button>
	
	</div>	
	<input name="p_id" value="${p_id}" /><br>
	<input type="hidden" name="review_writer" value="${m_id}" /><br>
	<input type="hidden" name="order_id" value="${order}" /><br>
	<input type="hidden" name="review_check" value="y"/>
	<input type="hidden" name="p_name" value="${p_name}"/>
	
	
	<textarea cols="50" rows="5" name="review_contents" required style="resize:none;"
	required placeholder="리뷰 내용을 입력해주세요" class="review_contents"></textarea><br>
	

<div class="inputpic">
   <label for="review_pic">이미지</label>
   <input type="file" id="review_pic" name="review_pic" onchange="readURL(this)"/>
   <br><img id="select_img" style="width:300px">
   
   <script>
   function readURL(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
			
		}else{
			document.getElementById('select_img').src = "";
		}
		
	}
   
   </script>
   
</div>

</form>


<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>