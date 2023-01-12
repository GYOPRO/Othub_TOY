<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/review/reviewnav.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	// 글쓰기 로그인 확인
	$("#cswrite").on("click",function(e){
		if(<%=session.getAttribute("m_id")%>==null){
			alert("로그인 후 이용해주세요.");
			e.preventDefault();
		}
	});//onclick end
	
	$("#mylist_button").on("click",function(e){
		if(<%=session.getAttribute("m_id")%>==null){
			alert("로그인 후 이용해주세요.");
			e.preventDefault();
		}
	});//onclick end
	
});//ready end
</script>
</head>
<body>

<div class="listnav"> 
<a href="/reviewlist?reviewnum=1" id="list_button">리뷰</a> 
 <a href="/myreviewlist?reviewnum=1" id="mylist_button">내 리뷰</a> 

</div>

</body>
</html>