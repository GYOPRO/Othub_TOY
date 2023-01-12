<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/adproduct/adplist.css" rel="stylesheet">
<title>Insert title here</title>

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
	<%@ include file="../adproduct/adpnav.jsp" %>
	
<!-- chatbot include -->
	<%@include file="../chatbot/chatbot.jsp" %>
		

<table>
 <thead>
  <tr class="adptr">
   <th class="adptr_n">상품 번호</th>
   <th class="adptr_p">상품명</th>
   <th class="adptr_b">브랜드</th>
   <th class="adptr_d">등록일</th>
  </tr>
 </thead>
 


 <tbody class="tbody">

 <c:forEach items="${adplist}" var="adplist">
 <tr class="listcontents">
 
  <td class="con_n">${adplist.p_id}</td>
  
  
  <td class="con_p"><a href="/insertproductcheck?p_id=${adplist.p_id}" id="cs_title">
  ${adplist.p_name}</a></td>
  
  <td class="con_b">${adplist.p_brand}</td>
  
  <td class="con_d"><fmt:formatDate value="${adplist.p_regdate}" pattern="yyyy-MM-dd"/></td>
  
  
 </tr>
</c:forEach>
  
 </tbody>

</table>

<div class="listnumber">
<c:if test="${adpprev}">
 <span>[ <a href="/adplistPage?adpnum=${adpstartPageNum - 1}">이전</a> ] 
  </span>
</c:if>

<c:forEach begin="${adpstartPageNum}" end="${adpendPageNum}" var="csnum">
  <span>
    <c:if test="${adpselect != adpnum}">
   <a href="/adplistPage?csnum=${adpnum}">${adpnum}</a>
  </c:if>    
  
  <c:if test="${adpselect == adpnum}">
   <b>${adpnum}</b>
  </c:if>
  </span>
</c:forEach>

<c:if test="${adpnext}">
 <span>[ <a href="/adplistPage?adpnum=${adpendPageNum + 1}">다음</a> ] 
 </span>
</c:if>
</div>

	
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>

</body>
</html>