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
                <input id="member_post"  type="text" name="m_address1" placeholder="우편번호 (주소를 검색하려면 클릭해주세요)" onclick="findAddr()"><br>
                <input id="member_addr" type="text" name="m_address2" placeholder="주소를 입력해주세요." readonly> <br>
                <input id="m_address3" type="text" name="m_address3" placeholder="상세 주소를 입력해주세요." > <br>
                <label>폰번호</label>
                <input type="text" name="m_phone" placeholder="010-1234-5678" id = "m_phone" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13">
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
	member_post = $("#member_post").val();
	m_address = $("#m_address").val();
	
	if(m_id == "") {
		alert("아이디를 입력해주세요");
	   return false;
	 }
	if(m_password == "")	{
		alert("비밀번호를 입력해주세요");
		return false
	}
	if(member_post == "")	{
		alert("주소를 입력해주세요");
		return false
	}
	if(m_address == "")	{
		alert("상세 주소를 입력해주세요");
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
	        }
	    }).open();
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function autoHypenTel(str) {
	  str = str.replace(/[^0-9]/g, '');
	  var tmp = '';

	  if (str.substring(0, 2) == 02) {
	    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
	    if (str.length < 3) {
	      return str;
	    } else if (str.length < 6) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2);
	      return tmp;
	    } else if (str.length < 10) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 3);
	      tmp += '-';
	      tmp += str.substr(5);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 4);
	      tmp += '-';
	      tmp += str.substr(6, 4);
	      return tmp;
	    }
	  } else {
	    // 핸드폰 및 다른 지역 전화번호 일 경우
	    if (str.length < 4) {
	      return str;
	    } else if (str.length < 7) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3);
	      return tmp;
	    } else if (str.length < 11) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 3);
	      tmp += '-';
	      tmp += str.substr(6);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 4);
	      tmp += '-';
	      tmp += str.substr(7);
	      return tmp;
	    }
	  }

	  return str;
	}
	
$('#m_phone').keyup(function (event) {
	  event = event || window.event;
	  var _val = this.value.trim();
	  this.value = autoHypenTel(_val);
	});
</script>
</html>
