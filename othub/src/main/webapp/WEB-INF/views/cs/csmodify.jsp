<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="css/cs/cswrite.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
});//ready end
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../cs/csnav.jsp" %>
	
	<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
	
<form method="post" enctype="multipart/form-data" class="writing_box">
<div class="top_info">
	<div class="writer">&#128221; ${cs_writer}</div>
		
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


	<div class="cs_open_check"> 문의글을
		<input type="radio" value="y" name="cs_open" checked /> 공개 할게요
		<input type="radio" value="n" name="cs_open" /> 비공개 할래요 <br>
	</div>	
	
	<button type="submit" class="cs_submit">완료</button>
	
	</div>	
	
	<input type="hidden" name="cs_writer" value="${cs_writer}" /><br>
	
	<input type="text" name="cs_title" class="cs_title" required value="  ${csview.cs_title}"/><br>
	
	<textarea cols="50" rows="5" name="cs_question" required style="resize:none;"
	required class="cs_question">  ${csview.cs_question}</textarea><br>
	

<div class="inputpic">
   <label for="cs_pic">이미지</label>
   <input type="file" id="cs_pic" name="cs_pic" onchange="readURL(this)"/>
   <br><img id="select_img" style="width:400px">
   
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