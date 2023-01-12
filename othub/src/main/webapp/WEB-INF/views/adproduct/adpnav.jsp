<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/adproduct/adpnav.css" rel="stylesheet">
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
	
	// 내 목록 확인
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

 <a href="/adplistPage?adpnum=1" id="list_button">상품 목록</a> 
 <a href="/insertproduct" id="insert_button">상품 등록</a> 

</div>

</body>
</html>