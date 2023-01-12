<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MemberList | Othub</title>
   <link href="css/login/update/import.css" rel="stylesheet">
    <link href="css/login/update/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		
		$("#deletebtn").click(function(ev){
			 if(!confirm("탈퇴 처리 하시겠습니까?")) {
				 ev.preventDefault();
			 }
		 });
		
		});//ready end
	</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
	<section class="myorder">
		<!-- mypage nav -->
		<%@include file="../member/mypagebar.jsp" %>
		<div class="myorderBox">
		<h3 class="orderTitle"><%=m_id %> 님의 정보</h3>
		<div id="container">
   		<div class="inner">
        <div class="form_content signup_wrap" class="afgas">
            <form action="updatemember" method="post">
                <label>아이디</label>
                <input type="text" id="m_id" name="m_id" placeholder="ID" value="${memberdto.m_id }" readonly>
                <label>비밀번호</label>
                <input type="password" id="m_password" name="m_pw" placeholder="Password" value="${memberdto.m_pw }" readonly>
                <label>이름</label>
                <input type="text" id="m_name" name="m_name" placeholder="Name" value="${memberdto.m_name }">
                <label>주소</label>
                <input type="text" id="m_address" name="m_address" placeholder="Address" value="${memberdto.m_address }">
                <label>폰번호</label>
                <input type="text" id="m_phone"name="m_phone" placeholder="010-1234-5678" value="${memberdto.m_phone }">
                <label>이메일</label>
                <input type="email" name="m_email" placeholder="Email" value="${memberdto.m_email }">
                <label>가입일</label>
                <input type="text" name="m_regdate" placeholder="regdate" value="${memberdto.m_regdate  }" readonly="readonly">
                <input id="updatebtn" type="submit" value="수정하기" style="background-color:#2186db;" >
                <h1><a id="deletechk" href="deletemember" >회원 탈퇴</a></h1>
            </form>
	</div>
	</div>
    </div>

   </div>
	</section>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>


</html>
