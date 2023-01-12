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

	});
</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
<div> 저희 분석 프로그램에 의하면 <span style="color:blue">${m_name }</span>회원님은 <span style="color:blue">${head}</span>등신이십니다. </div>

<div> 회원님과 비슷한 체형의 모델이 입은 옷은 다음과 같습니다.</div>

<div> 총 <span style="color:blue">${number }</span>개의 상품이 조회되었습니다.</div>

<div class="four"> 사진을 클릭하면 제품 링크로 이동합니다. </div>
<c:forEach items="${pid_list }" var="onefile">
<h3> ${onefile.p_name } </h3>
<h3> <a href="productdetail?p_id=${onefile.p_id }"> <img src="/images/${onefile.p_thumb }"> </a> </h3>


</c:forEach>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>