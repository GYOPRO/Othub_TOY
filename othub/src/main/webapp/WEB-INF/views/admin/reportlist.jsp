<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/admin/list/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
	<main class="list_main">
		<!-- navbar include -->
		<%@include file="../admin/adminpagenav.jsp" %>
		<section class="ptlist_sec1">
			<h3 class="h3">신고된 게시물</h3>
			<table id="inventory">
            <colgroup>
              <col width="100px"><col width="100px"><col width="150px"><col width="100px"><col width="100px">
            </colgroup>
            <thead >
               <tr >
                  <th>번호</th>
                  <th>글번호</th>
                  <th>신고내용</th>
                  <th>신고자</th>
         
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${list }" var="list">
               <tr class="styleone" onclick="location.href='oneCommunity?s_seq=${list.s_seq }'">
                  <td>${list.r_seq }</td>
                  <td>${list.s_seq }</td>
                  <td>${list.r_value }</td>
                  <td>${list.r_user}</td>
                  <td><button><a href="deletereport?s_seq=${list.s_seq }">게시글 삭제</a></button></td>
               </tr>
               </c:forEach>
            </tbody>
         </table>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>