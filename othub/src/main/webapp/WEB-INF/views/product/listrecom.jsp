<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<link href="css/product/productmain.css" rel="stylesheet">

<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

	
});//ready end


</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@include file="categorybar.jsp" %>

<section class="listcontent">

<c:forEach items="${recom}" var="recom" end="0" >
<div class="productlist">
<div class="container">
		<div class="row">
			<form method="get" name="search" action="searchproduct">
				<table class="pull-right">
					<tr>
						<td>
							<select class="form-control" name="searchField" id="selectbox">
									<option value="">--</option>
									<option value="p_name">상풍명</option>
									<option value="p_brand">브랜드</option>
	
							</select>
						</td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100" id="inputbox"></td>
						<td><button type="submit" class="btn btn-success" id="buttona">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<div class = "container2">
 <a href="/listrecent?c=${recom.category_id}"> 최신순 </a> &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
 <a href="/listlike?c=${recom.category_id}"> 인기순 </a> &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
 <a href="/listrecom?c=${recom.category_id}"> 추천순 </a>
 </div>
</div>
</c:forEach>


 <ul id="product" class="item">
  <c:forEach items="${recom}" var="recom">
  
   <li id="listli">
    <div class="p_thumb">
      <a href="productdetail?p_id=${recom.p_id }"> <img src="images/${recom.p_thumb}"> </a>
    </div>
     
    <div class="p_name">
     <a href="productdetail?p_id=${recom.p_id }">${recom.p_name}</a>
    </div>
    
    <div class="p_brand">
     📍 ${recom.p_brand}
     </div>
     
    <div class="p_price">
     💰 <fmt:formatNumber value="${recom.p_price}" pattern="#,###" />
    </div>
    
    <div class="p_like">
     💗 ${recom.p_like}
    </div>
    
   </li>
   </c:forEach>
   
   <!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>

    
   </ul>
  </section> 






<!-- footer include -->
	<%@include file="../include/footer.jsp" %>

</body>
</html>