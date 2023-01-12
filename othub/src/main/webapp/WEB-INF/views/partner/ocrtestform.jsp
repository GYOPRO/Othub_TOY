<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Partner | Othub</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/partner/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
	<main class="pt_main">
		<section class="pt_sec">
			<div class="">
				<form method="post" enctype="multipart/form-data">
					<h2 class="ocr_h2">사업자등록증 OCR 판독기</h2>
					<div class="pt_Info file">
						<div>*파일을 선택해주세요</div>
						<input id="ocr_img" type=file name="ocr_img" onchange="readURL2(this)" accept="image/jpg,jpeg,png,jifi" required>
						<br><img id="preview2">
					</div>
					<input type="hidden" name="m_id" value="<%=session.getAttribute("m_id")%>">
					<button class="pt_btn" id="fileBtn" onclick="javascript:form.action='/ocr'">파일검사</button>
				</form>
			</div>
			<div class="">
				<c:if test="${result != null }">  
					<!-- 결과 출력 (텍스트) -->
			        <div>
				        <h3 class="ocr_h3">OCR : 텍스트 추출 결과</h3>
			        	<span class="ocr_result1" >OCR판독결과 : </span>
			       		<span id="Condition1"></span>
			        </div>
			        <div>
				        <c:if test="${ocrimg.resultText2 == '사업자등록증 ' || ocrimg.resultText2 == '사업자등록증'}">
				        	<div class="ocr_result2">해당 파일은 사업자등록증이 맞습니다. 입점신청을 진행해주세요</div>
				        </c:if>
				        <c:if test="${ocrimg.resultText2 != '사업자등록증 ' && ocrimg.resultText2 != '사업자등록증 '}">
				        	<div class="ocr_result3">해당 파일은 사업자등록증이 아닙니다</div>
				        </c:if>
			        </div>
			      	<div id ="text1" class="hidden"></div>
					<div id="text"></div>
			        <br><br>
			        <c:if test="${ocrimg.resultText2 == '사업자등록증 ' || ocrimg.resultText2 == '사업자등록증'}">
				        <div class="ocrimg_result">
					        <h3 class="ocr_h3">OCR : 원본 이미지 파일</h3>
					        <img src="images/partner/img1/user/${ocrimg.ocr_imgname }">
				        </div>
			        </c:if>
				</c:if>
			</div>
			<button class="pt_btn" onclick="location.href='/partner'">입점신청 하러가기</button>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
<script>
	//file priveiw
	function readURL2(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview2').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview2').src = "";
		}
	}
</script>

<script>
	$(document).ready(function() {
		if('${message == "success"}' || '${message == "true"}'){
			var json = JSON.parse('${result}');
			var fieldlist = json.images[0].fields;
			
			if(fieldlist[1] != false){	
				$("#Condition1").append(fieldlist[1].inferText + "<br>");	
			}
			//inferText
			for(var i =0; i<fieldlist.length; i++){
				$("#text1").append("inferText : "+fieldlist[i].inferText + "<br>");	
			}
			
			for(var i =0; i<fieldlist.length; i++){
				if(fieldlist[i].lineBreak == true){
					$("#text").append(fieldlist[i].inferText + "<br>");	
				}
				else{
					$("#text").append(fieldlist[i].inferText + "&nbsp;");	
				}
			}
			
			//var iftext = document.getElementById('#Condition1').value;
			//$("#Condition2").append(iftext + "<br>");
			
			//숨기기
			$("#text1").hide();
		}
	});//ready end
</script>
</html>
