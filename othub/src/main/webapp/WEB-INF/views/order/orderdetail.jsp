<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<%@include file="../include/navbar.jsp"%>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	

<div class="wrapper">
        <!--Top menu -->
        <div class="sidebar">
           <!--profile image & text-->
            <!--menu item-->
        </div>

    </div>

	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>


</html>