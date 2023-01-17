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
                <input type="text" id="member_post" name="m_address1" placeholder="Address" value="${memberdto.m_address1 }" onclick="findAddr()">
                <input type="text" id="member_addr" name="m_address2" placeholder="Address" value="${memberdto.m_address2 }">
                <input type="text" id="m_address3" name="m_address3" placeholder="Address" value="${memberdto.m_address3 }">
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
	<script>
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('member_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	            document.getElementById("m_address3").value="";
	        }
	    }).open();
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>


</html>
