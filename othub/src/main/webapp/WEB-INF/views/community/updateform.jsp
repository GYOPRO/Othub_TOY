<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Meta Tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="expire" content="-1" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="robots" content="index,follow" />
    <!-- css, javascript -->
	<link href="css/lookbook/form/import.css" rel="stylesheet">
	<link href="css/lookbook/form/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
$(document).ready(function(){


});
</script>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>

<form action="updatecommu" method="post" enctype="multipart/form-data" >
<div id="container">
    <div class="inner">
        <h1>STYLE</h1>
    	<div class="table">
            <table class="detail">
                <colgroup>
                    <col width="100px"><col width=""><col width="180px">
                </colgroup>
                <thead>
                    <tr>
                        <th>No. ${oneCommu.s_seq }</th>
                        <th><input type="text" name="s_title" placeholder="제목을 입력하세요." value=${oneCommu.s_title } ></th>
                        <th><%=sf.format(nowTime) %></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="3"><textarea col="2000" rows="10" name="s_contents" placeholder="내용을 입력하세요." >${oneCommu.s_contents }</textarea>
                    </tr>
                </tbody>
            </table>
            
			<input type="hidden" name="s_seq" value=${oneCommu.s_seq }>
			<input id="btnWriting" type="submit" value="수정" style="background-color: #2186db;">
        </div>
    </div>
</div>
</form>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
<script>
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

function readURL2(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
		      document.getElementById('preview2').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}else{
		document.getElementById('preview2').src = "";
	}
}

function readURL3(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
		      document.getElementById('preview3').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	}else{
		document.getElementById('preview3').src = "";
	}
}
</script>
</html>