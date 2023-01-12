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
$(document).ready(function() {
	$("input:button").on('click', function(){
		
		$.ajax({
			url:'chatbotresultajax',
			data: {'request' : $("#request").val() , 'event': $(this).val() },
			type:"get",
			dataType:'json',
			success:function(server){
				//alert(server.bubbles[0].data.description);
				$("#chat").append("<p><span id='question'>" + $("#request").val() +"</span></p>");
				
				var bubbles = server.bubbles;
				for(var i = 0; i < bubbles.length; i++){
					if(bubbles[i].type == 'text'){
						//텍스트답변
					$("#chat").append
					("<p><span id='answere'>" + server.bubbles[0].data.description +"</p>");
					$("#mp3").css("display", "inline");
					
					
					}//text답변 if
					else if(bubbles[i].type == 'template'){
						//멀티링크답변이나 이미지답변 
						if(bubbles[i].data.cover.data.imageUrl != null ){
							$("#chat").append
							("<img src=" + bubbles[i].data.cover.data.imageUrl + " width=200 height=200><br>");
						}//이미지답변
						else if(bubbles[i].data.cover.type == "text"){
							$("#chat").append
							("<p><span id='answere'>" 
									+ server.bubbles[0].data.cover.data.description +"</p>");
							//contentTable변수 배열
							for(var j = 0; j < bubbles[i].data.contentTable.length; j++){
								for(var k = 0; k < bubbles[i].data.contentTable[j].length; k++ ){
									var linkname = bubbles[i].data.contentTable[j][k].data.title;
									var url = bubbles[i].data.contentTable[j][k].data.data.action.data.url;
									$("#chat").append("<a href=" + url + " >" + linkname + "</a><br>");
									//<a href=url변수>linkname변수</a>
								}
							}
						}//멀티링크답변
				}
				
				}//for 	
			}//success
		});//ajax
		setTimeout("$('#request').val('')", 200);
		 
	});//on
});//ready end
</script>

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
    
	   <div class="chat_main" id="chat"> 
		<span id="chat_main_text"> 안녕하세요, Ot-Hub입니다. 무엇을 도와드릴까요? </span>
		</div>
		
		<div class="chat_input">
		<input class="request" type=text id="request" name="request" onkeyup="keyUpEvent(event.keyCode, this)">
		<input class="modal_send_button" id=button type=button value="답변">
		<img class="modal_send_icon" src="images/chatbot/send.png">
		</div>
		</div>
		
		
	

   <div class="modalBackground"></div>
   </div>


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