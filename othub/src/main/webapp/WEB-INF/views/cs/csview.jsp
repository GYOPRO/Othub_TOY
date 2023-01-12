<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/cs/csview.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$(".delete").click(function(){
	      if(confirm("정말 삭제하시겠습니까?") == true){
	    	  alert("삭제됐습니다");
	      }else{
	    	  return;
	      }
	   }); 
	
});//ready end
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../cs/csnav.jsp" %>
	
	<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	

<form method="post" class="cs_form">
	
	<div class="cs_contents">
	
	<hr style="background:black; height:2px;">
	
	<div class="cs_t">
	<b>${csview.cs_title}</b><br>
	</div>
	
	
	<hr style="border-color:gray; border-width:1px 5 0 0; border-style:dashed;">	
	<label><b class="cs_c_t">문의 내용</b></label>
	<div class="cs_w">
	${csview.cs_writer}
	</div>
	
	<div class="cs_c">
	${csview.cs_question}<br>
	</div>
	
	<c:if test="${csview.cs_pic_name != null}">
	<img src="images/cs/cs_pic/${csview.cs_pic_name}" style="width: 500px"><br>
	</c:if>
	
	</div>
	
	<c:if test="${m_id == csview.cs_writer || role1 == 'admin'}">
	
	
	
	<div class="writerbutton">
	<a href="/csmodify?cs_seq=${csview.cs_seq }" class="modify">게시물 수정</a>  &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp 
	<a href="/csdelete?cs_seq=${csview.cs_seq}" class="delete">게시물 삭제</a> <br>
	</div>
	
	</c:if>
	<br>
	<br>
<hr style="background:gray; height:0px;">
</form>

<!-- 답변 -->


	
	<div class="cs_answere_box">
	<label><b class="answere_t">답변 내용</b></label>
	
	
	
	<c:if test="${csview.answere_check == 'y'}">
	
	<div class="cs_answere_contents">
	<c:forEach items="${answere}" var="answere">
		<p class="answere_c">${answere.answere_contents }</p>
	</c:forEach>
			
	</div>
	</c:if>
	
	<c:if test="${csview.answere_check == 'n'}">
	<p class="answere_c"> 답변을 조금만 기다려주세요! </p>
	</c:if>



<c:if test="${role1 == 'admin' }">
<form method="post" action="/answere">
	
	<div class="cs_answere_textbox">
	<c:if test="${csview.answere_check == 'n'}">
	<label><b class="add_answere_text">답변 입력</b></label> <br>
	<textarea cols="70" rows="5" name="answere_contents" style="resize:none;"
	class="answere_contents"></textarea>
	<input type="hidden" name="cs_seq" value="${csview.cs_seq}">
	<input type="hidden" name="answere_check" value="y">
	<button type="submit" class="add_answere">등록</button>
	</c:if>
	</div>
	
</form>
</c:if>
	</div>
	
	
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>