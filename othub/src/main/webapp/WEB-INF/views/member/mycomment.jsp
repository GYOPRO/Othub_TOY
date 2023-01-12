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
   <link href="css/member/coupon/import.css" rel="stylesheet">
    <link href="css/member/coupon/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		
		});//ready end
	</script>
	<style>
	table{

	}
	tr{
	border-bottom: 1px solid;
	}
	td{
	padding: 10px;
	}
	br
{mso-data-placement:same-cell;}
	</style>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
	<section class="myorder">
		<!-- mypage nav -->
		<%@include file="../member/mypagebar.jsp" %>
		<div class="myorderBox">
			<h3 class="orderTitle">내가 쓴 댓글</h3>
				<div class="inner">
				<table>
				<c:forEach items="${boardlist }" var="list">
				    <tr onclick="location.href='oneCommunity?s_seq=${list.s_seq }'">
					    <td> 댓글 내용 : ${list.cm_contents }</td><td></td>
					    <td>글 제목 : ${list.s_title }[${list.s_viewcount}]</td>
					    <td>작성 일자 : ${list.cm_writingtime}</td>
				    </tr>
			      </c:forEach>
          		 </table>
   </div>

   </div>
	</section>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>


</html>