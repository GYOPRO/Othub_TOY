<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link href="css/chatbot/chatbot_button.css" rel="stylesheet">
<script>
$(document).ready(function() {
	
});//ready end
</script>

<script type="text/javascript">
	function openChatbot() {
		window.open("/chatbot", "chatbot", "width=300, height=500, top=300, left=1500");
	}
</script>

</head>
<body>


<div id="chatbot_b">
<img id="chatbot_img" src="images/chatbot/chatbot.png" onclick="openChatbot()">
</div>

</body>
</html>