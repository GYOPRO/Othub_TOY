<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STYLE | OtHub</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="expire" content="-1" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="robots" content="index,follow" />
    <!-- css, javascript -->
	<link href="css/lookbook/main/import.css" rel="stylesheet">
	<link href="css/lookbook/main/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		// 글쓰기 로그인 확인
		$("#writing").on("click",function(e){
			if(<%=session.getAttribute("m_id")%>==null){
				alert("로그인 후 이용해주세요.");
				e.preventDefault();
			}
		});//onclick end
		
		$("#like").on("click",function(e){
			if(<%=session.getAttribute("m_id")%>==null){
				alert("로그인 후 이용해주세요.");
				e.preventDefault();
			}
		});//onclick end
		
		//좋아요 
	$("#like_btn").click(function(){
		var s_seq = $("#s_seq").val();
		var m_id = "<%=session.getAttribute("m_id") %>";
		
		if(m_id == 'null'){
			alert("로그인 후 이용가능합니다");
		}
		
		$.ajax({
			type : "POST",
			url : "boardlike",
			dataType : "json",
			data : {'s_seq' : s_seq, 'm_id' : m_id},
			
			success : function(resp){
				if(resp.result == 0){
					
				}
				else if(resp.result == 1){
					
					
				}
				$("#likecnt").html(resp.result2);
			}
		});//ajax
	});//onclick end
			
		
	});//ready end
	</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
<div id="container">
    <div class="inner">
        <ul class="nav2 clearfix">
        	<li class="fl on" id="array"><a href="community">최신</a></li>
            <li class="fl" id="array"><a href="communitylike">인기</a></li>
            <li class="fl" id="array"><a href="mylikecommunity" onclick="logincheck" id="like">좋아요</a></li>
            <li class="fl writing" id="writing"><a href="writingcommunity">글쓰기</a></li>
        </ul>
        <div class="flex">
			<c:forEach  var="board" items="${boardlist}">
	            <div class="card">
	                <div class="img"><a href="oneCommunity?s_seq=${board.s_seq }&image=${board.imagename1 }"><img src="images/community/styleimg/${board.imagename1 }"></a></div>
	                <div class="txt_box">
	                    <div class="profile clearfix">
	                    	<div class="profile_img fl"><img src="images/community/profile_default.png"></div>
	                        <div class="profile_name fl">${board.s_writer }</div>
	                        <input type="hidden" value=${board.s_seq } id="s_seq">
	                    </div>
	                    <h2><a href="oneCommunity?s_seq=${board.s_seq }" style="color:black;">${board.s_title}</a></h2>
	                    <ol class="clearfix">
	                    <!-- 좋아요 -->
	                        <li class="fl">	                                               
		                        <button type="button" id="like_btn" >
		                         <span class="like_off" id="likecnt">${board.s_like }</span>
		                        </button>                       
	                        </li>
	                         <!-- 좋아요 -->
	                        <li class="fl">
	                            <span class="comment">${board.s_viewcount }</span> 
	                        </li>
	                    </ol>
	                </div>
	            </div>
			</c:forEach>
        </div> 
		<!-- 검색 include -->
<%@ include file="../community/search.jsp" %>
		
    </div>
</div>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>