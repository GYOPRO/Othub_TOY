<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="expire" content="-1" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="robots" content="index,follow" />
    <!-- css, javascript -->
    <link href="css/login/import.css" rel="stylesheet">
    <link href="css/login/common.css" rel="stylesheet">
    <script src="js/jquery-3.6.0.min.js"></script>
    
<title>SignUp | OtHub</title>

<script>
$(document).ready(function(){
	

});//ready


</script>
</head>

</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
<div id="container">
    <div class="inner">
        <div class="form_content signup_wrap">
            <h1>Sign Up</h1>
            <form action="signin" method="post" onsubmit="return submitCheck()">
                <label>아이디</label>
                <div class="check">
                <input type="text" name="m_id" placeholder="ID" id="m_id">
                <button type="button" onclick="checkId()" id="idcheck">중복 확인</button>
                </div>
              	<span class="id_ok">사용 가능한 아이디입니다.</span>
				<span class="id_already">이미 사용중인 아이디입니다.</span>
                <label>비밀번호</label>
                <input type="password" name="m_pw" placeholder="Password" id="m_password">
                <div id="pwcheck"></div>
                <label>이름</label>
                <input type="text" name="m_name" placeholder="이름" id="m_name">
                <label>주소</label>
                <input type="text" name="m_address" placeholder="주소" id="m_address">
                <label>폰번호</label>
                <input type="text" name="m_phone" placeholder="010-1234-5678" id = "m_phone">
                <label>이메일</label>
                <input type="email" name="m_email" placeholder="Email" id="m_email">
                
                <label>성별</label>
                
                <div class="select">
                <input type="radio" name="m_sex"  id="m_sex1"><label for="m_sex1">남</label>
				<input type="radio" name="m_sex"  id="m_sex2"><label for="m_sex2">여</label>
				</div>
				
                <input id="signbtn" type="submit" value="가입하기"  onclick="checkId()">
                <c:if test="${message == 'error'}">
 					<div style="color:red;"> 중복된 아이디 입니다.
 					</div>
 				</c:if>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
<script type="text/javascript">
function checkId(){
	var m_id = $('#m_id').val();
	
	
	$.ajax({
		url : '/idCheck',
		type : 'post',
		data : {m_id:m_id},
		dataType : 'json',
		success : function(cnt){
			if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
                $('#id').val('');
			}
		},
		error:function(){
			alert("에러입니다");
		}
			
	});
}
function submitCheck() {

	m_id = $("#m_id").val();
	m_password = $("#m_password").val();
	m_name = $("#m_name").val();
	m_address = $("#m_address").val();
	m_phone = $("#m_phone").val();
	m_email = $("#m_email").val();
	m_sex = $(":input:radio[name=m_sex]:checked").val();
	
	if(m_id == "") {
		alert("아이디를 입력해주세요");
	   return false;
	 }
	if(m_password == "")	{
		alert("비밀번호를 입력해주세요");
		return false
	}
	if(m_name == "")	{
		alert("이름을 입력해주세요");
		return false
	}
	if(m_address == "")	{
		alert("주소를 입력해주세요");
		return false
	}
	if(m_phone == "")	{
		alert("전화번호를 입력해주세요");
		return false
	}
	if(m_email == "")	{
		alert("이메일을 입력해주세요");
		return false
	}
	if(m_sex == "")	{
		alert("성별을 선택해주세요");
		return false
	}
	
	  return true;

	}

</script>
</html>
