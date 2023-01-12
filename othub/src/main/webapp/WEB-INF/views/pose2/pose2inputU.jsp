<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/pose2/pose2.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	/*
	var re = ${head};

	if(re == 0){
		alert("인식에 실패하였습니다. 다른 사진을 이용해주세요.");
	}
	var re = 1;
	*/
});//ready end


function readURL1(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
		      document.getElementById('preview1').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}else{
		document.getElementById('preview1').src = "";
	}
}


</script>
</head>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
<body>
<div id="head"> 체형을 분석하여 맞는 옷을 찾아드립니다. </div>
<form action="pose2resultU" method="post" enctype = "multipart/form-data">
<input id="pose_image" type=file name="pose_image" onchange="readURL1(this)" required>
<img id="preview1" width="400px">
<input type="hidden" name="user" value="<%=session.getAttribute("m_id")%>">
<div class="bttn">
	<input id="poseUpload" type="submit" value="사진 등록">
</div>

</form>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>