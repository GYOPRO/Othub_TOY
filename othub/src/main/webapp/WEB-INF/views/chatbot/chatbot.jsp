<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link href="css/chatbot/chatbot_button.css" rel="stylesheet">
<link href="css/chatbot/chatbot_contents.css" rel="stylesheet">


<script>
	function openChatbot() {
		 $(".replyModal").attr("style", "display:block;");
	}	
	
</script>


</head>


<body>


<div id="chatbot_b">
<img id="chatbot_img" src="images/chatbot/chatbot.png" onclick="openChatbot()">
</div>


<!-- modal -->
<div class="replyModal">
 
   <div class="modalContent">
   <span id="toptext"> Ot-Hub 챗봇 </span>
     <img class="modal_cancel" src="images/chatbot/close.png">

		<span id="chat_main_text"> 유저들과 대화를 나눠보세요! </span>
		</div>
		<input type='hidden' id='mid' value='홍길동'>
		<div id='talk'></div>
		<div id='sendZone'>
			<textarea id='msg' value='hi...' ></textarea>
			<input type='button' value='전송' id='btnSend'>
		</div>


		
		
	

   <div class="modalBackground"></div>
   </div>

<script src='js/chatt.js'></script>
<script>


$(".modal_cancel").click(function(){
   $(".replyModal").attr("style", "display:none;");
});

function keyUpEvent(keyCode, ta) {
	if(keyCode == 13) {
		//alert("엔터키 입력됨");
		document.getElementById("button").click();
	}
	
}




$(".modalBackground").click(function(){
	   $(".replyModal").attr("style", "display:none;");
	});
</script>

</body>
</html>