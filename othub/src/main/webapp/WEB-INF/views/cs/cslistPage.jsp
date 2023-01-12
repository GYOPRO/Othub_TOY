<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="css/cs/csmain.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	
$(document).ready(function() {
	// 일반글 로그인 확인
	$(".listcontents").on("click",function(e){
		if(<%=session.getAttribute("m_id")%> == null){
			alert("로그인하셔야 확인 가능합니다.");
			e.preventDefault();
		}
		
	});//onclick end
	
});//ready end
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../cs/csnav.jsp" %>
	
<!-- chatbot include -->
	<%@include file="../chatbot/chatbot.jsp" %>
		
<!-- 프로필 -->

<div class="profile">
<img src="images/index/illust.jpg" style="width:400px">
<p class="pro_con"> Ot-Hub에 오신 걸 환영합니다! <br>
문의 사항은 최대한 빠르게 답변드리도록 노력하겠습니다. <br>
Customer Support 운영 시간은 10:00 ~ 17:00 입니다. <br>
간단한 문의사항은 오른쪽 아래에 있는 챗봇을 이용해 주세요. <br>
감사합니다! :) </p>
</div>


<table>
 <thead>
  <tr class="cstr">
   <th class="cstr_n">번호</th>
   <th class="cstr_t">제목</th>
   <th class="cstr_w">작성자</th>
   <th class="cstr_d">작성일</th>
  </tr>
 </thead>
 

 <tbody class="tbody">
 
 <c:forEach items="${cslist}" var="cslist">
 <tr class="listcontents">
 
  <td class="con_n">${cslist.cs_seq}</td>
  
  <!-- no 비밀글 -->
  <c:if test="${cslist.cs_open == 'y'}" >
  <td class="con_t"><a href="/csview?cs_seq=${cslist.cs_seq}" id="cs_title">
  ${cslist.cs_title}</a></td>
  </c:if>
  
  <!-- 비밀글 -->
  <c:if test="${cslist.cs_open == 'n'}" >
  <c:choose>
  	<c:when test="${cslist.cs_writer == m_id || role1 == 'admin'}">
	  	<td class="con_t"><a href="/csview?cs_seq=${cslist.cs_seq}" id="cs_title_secret">
	  	<img src="../images/cs/lock.png" style="width:15px; height:15px">
	  	${cslist.cs_title} </a></td>
  	</c:when>
  	<c:otherwise>
  	<td class="con_t">
  	<img src="../images/cs/lock.png" style="width:15px; height:15px">
  	비밀글은 작성자와 관리자만 열람 가능합니다.</td>
  	</c:otherwise>
  	</c:choose>
  </c:if>
  
  <td class="con_w">${cslist.cs_writer}</td>
  
  <td class="con_d"><fmt:formatDate value="${cslist.cs_regdate}" pattern="yyyy-MM-dd"/></td>
  
 </tr>
</c:forEach>
  
 </tbody>

</table>

<div class="listnumber">
<c:if test="${csprev}">
 <span>[ <a href="/cslistPage?csnum=${csstartPageNum - 1}">이전</a> ] 
  </span>
</c:if>

<c:forEach begin="${csstartPageNum}" end="${csendPageNum}" var="csnum">
  <span>
    <c:if test="${csselect != csnum}">
   <a href="/cslistPage?csnum=${csnum}">${csnum}</a>
  </c:if>    
  
  <c:if test="${csselect == csnum}">
   <b>${csnum}</b>
  </c:if>
  </span>
</c:forEach>

<c:if test="${csnext}">
 <span>[ <a href="/cslistPage?csnum=${csendPageNum + 1}">다음</a> ] 
 </span>
</c:if>
</div>

	
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>

</body>
</html>