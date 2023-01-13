<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<% String m_id = (String)session.getAttribute("m_id");%>
</head>
<body>

신고하기
<br>
작성자 : <%=request.getAttribute("writer") %><br>
내  용 : <%=request.getAttribute("title") %>

<br>
<form method="get" action="reportss">
	<%if(m_id != null){ %><input type="hidden" name="r_user" value="<%=m_id%>"><%}else{ %><input type="hidden" name="r_user" value=user><%} %>
	<input type="hidden" name=s_seq value=<%=request.getAttribute("s_seq") %>>
	<label><input type="radio" name="r_value" value="스팸홍보/도배"> 스팸홍보/도배글입니다.</label><br>
	<label><input type="radio" name="r_value" value="음란물"> 음란물입니다.</label><br>
	<label><input type="radio" name="r_value" value="불법정보 포함"> 불법정보를 포함하고 있습니다.</label><br>
	<label><input type="radio" name="r_value" value="청소년 유해"> 청소년에게 유해한 내용입니다.</label><br>
	<label><input type="radio" name="r_value" value="개인정보 노출"> 개인정보 노출 게시물입니다.</label><br>
	<label><input type="radio" name="r_value" value="불쾌한 표현"> 불쾌한 표현이있습니다.</label><br>
	
	<input id="reportbtn" type="submit" value="신고하기" onclick="window.close()"><br>
	<input id="closebtn" type="button" value="창닫기" onclick="window.close()"><br>
</form>
</body>
<script type="text/javascript">

</script>
</html>
