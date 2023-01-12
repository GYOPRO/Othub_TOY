<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	   var json = JSON.parse('${pose2result}');
	   var keys = Object.keys(json.predictions[0][0]);
	   var json2 = JSON.parse('${testtest}');
	   
	   var keys2 = Object.keys(json2);
	   //$("#test1").html(keys2[2]);
	   

	   //canvas 작업
	   var mycanvas = document.getElementById("mycanvas");
	   var mycontext = mycanvas.getContext("2d");
	   
	   var colors = ["black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black"];
	   var bodyinforms = ["코", "목", "오어깨", "오팔꿈치", "오손목", "왼어깨", "왼팔꿈치", "왼손목", "오엉덩이", "오무릎", "오발목", "왼엉덩이", "왼무릎", "왼발목", "오눈", "왼눈", "오귀", "왼귀"];
	   var myimage = new Image();
	   myimage.src = "images/${jspPath}";
	 
	   myimage.onload = function(){
		   if(myimage.width > mycanvas.width){
		         mycanvas.width = myimage.width;
		      }
		      if(myimage.height > mycanvas.height){
		         mycanvas.height = myimage.height;
		      }
		      
	      mycontext.drawImage(myimage, 0, 0, myimage.width, myimage.height);
	      
	       
	      
	      for(var i = 0; i < bodyinforms.length; i++){
	         var x = json.predictions[0][i].x * myimage.width;
	         var y = json.predictions[0][i].y * myimage.height;
	         mycontext.fillStyle = colors[i];
	         mycontext.fillText(bodyinforms[i], x, y);
	         mycontext.fillRect(x, y, 5, 5);
	      
	   //양손목그리기
	   /*
	   if(bodyinforms[i].indexOf("왼손목")>=0){
	      var leftx = json.predictions[0][i].x * myimage.width;
	      var lefty = json.predictions[0][i].y * myimage.height;
	   }
	   if(bodyinforms[i].indexOf("오손목")>=0){
	      var rightx = json.predictions[0][i].x * myimage.width;
	      var righty = json.predictions[0][i].y * myimage.height;
	   }
	   mycontext.beginPath();
	   mycontext.moveTo(leftx, lefty);//시작점
	   mycontext.lineTo(rightx, righty);//종료점까지 선
	   mycontext.closePath();
	   mycontext.strokeStyle = "red";
	   mycontext.lineWidth = 5;
	   */
	   mycontext.stroke();
	      }//for
	      
	      
	   }//onload
	   
	   var end = [];
	   var arr = [];
	   var bodies = [];
	   for(var i = 0; i < keys2.length; i++){
		   	arr = [keys2[i], json2[keys2[i]].x, json2[keys2[i]].y];
		   	arr2 = bodyinforms[i];
		   	bodies.push(arr2);
			bodies.push(" ");
		   	end.push(arr);
	   }
	   

	   $("#test1").html(bodies);
	   var u = keys2.length;
	   $.ajax({
			type: "post",
			url:  'pose2resultU2',
			data: {posejson:JSON.stringify(end), u:u},
			//datatype: 'json',
			success: function(a){
				alert('분석완료');
				location.replace("/pose2resultU3");
			}//sucess
	   });//ajax
	});
</script>
</head>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
${jspPath}

<div id="test1"></div>


<img src="images/${jspPath}">
<canvas id="mycanvas" width=500 height=500 style="border:2px solid green">
</canvas>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>