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

<form action="writingcommunity" method="post" enctype="multipart/form-data" >
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
                        <th>No. ${totalboard }</th>
                        <th><input type="text" name="s_title" placeholder="제목을 입력하세요."></th>
                        <th><%=sf.format(nowTime) %></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="td">
                        <div class="file">

                        	<input id="s_image1" type=file name="s_image1" onchange="readURL1(this)" required>

                        </td>
                        <td><input type=file name="s_image2" onchange="readURL2(this)"></td>
                        <td><input type=file name="s_image3" onchange="readURL3(this)"></td>
                    </div>
                    </tr>
                     <tr>
                        <td><img id="preview1" width="400px"></td>
                        <td><img id="preview2" width="400px"></td>
                        <td><img id="preview3" width="400px"></td>
                    </tr>
                    <tr>
                        <td colspan="3"><textarea col="2000" rows="10" name="s_contents" placeholder="내용을 입력하세요." ></textarea>
                    </tr>
                </tbody>
            </table>
			<input type="hidden" name="s_writer" value="<%=session.getAttribute("m_id")%>">
			<input id="btnWriting" type="submit" value="글 등록" style="background-color: #2186db;">
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