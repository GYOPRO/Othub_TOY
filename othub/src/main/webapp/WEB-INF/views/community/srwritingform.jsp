<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Editor | Showroom</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/lookbook/writing/common.css" rel="stylesheet">
<!-- ckeditor / jquery 라이브러리 연결 -->
<script src="js/ko.js"></script>
<script src="js/ckeditor.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	var i = 0;
	var maxAppend = 1;
	$("#tagbtn").click(function(){
		if(maxAppend >=5) return;
		$("#tag").append("<input type='hidden' value='"+$("#select2").val()+"' name = p_name"+(++i)+">")
		$("#tagname").append("<li class='tagli'>#"+$("#select2").val()+"</li>");
		maxAppend++;
	})
	

});//ready end
</script>

<script type="text/javascript">
function itemChange(){ 
	var str1 = '${product1}'.split('[').join('').split(']').join(''); //양끝 문자열 제거
	var str2 = '${product2}'.split('[').join('').split(']').join(''); //양끝 문자열 제거
	var str3 = '${product3}'.split('[').join('').split(']').join(''); //양끝 문자열 제거
	var str4 = '${product4}'.split('[').join('').split(']').join(''); //양끝 문자열 제거
	var str5 = '${product5}'.split('[').join('').split(']').join(''); //양끝 문자열 제거
	
	var top = str1.split(",");
	var bottom = str2.split(",");
	var outer = str3.split(",");
	var shoes = str4.split(",");
	var bag = str5.split(",");
	var selectItem = $("#select1").val(); 
	var changeItem; 
	
	if(selectItem == "상의"){  
		changeItem = top;
		}
	else if(selectItem == "하의"){
		changeItem = bottom;
		}
	else if(selectItem == "아우터"){
		changeItem =  outer;
		}
	else if(selectItem == "신발"){
		changeItem =  shoes;
		}
	else if(selectItem == "가방"){
		changeItem =  bag;
		}
	
	 $('#select2').empty(); 
	for(var count = 0; count < changeItem.length; count++){ 
		  var option = $("<option>"+changeItem[count]+"</option>");                
		$('#select2').append(option);            
		} 
		}
</script>

</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	%>
	
	<!-- main container -->
	<main class="sr_write_main" >
		<section class="writingform">
			<form action="writingcommunity" method="post" enctype="multipart/form-data" name="myForm" onsubmit="goSubmit()">
				<h3 class="h3">Look-Book</h3>
				<span class="wrt_info">
					<span>⭐ No.${totalboard } </span>
					<span>✒️ ${m_id } </span>
					<span>⏱️ <%=sf.format(nowTime) %></span>
				</span>
					<span class="sr_select_box">
					
					<select name="p_id" id="select1" onchange='itemChange()'>
						<option>== 카테고리 ==</option>
						<option>상의</option>
						<option>하의</option>
						<option>아우터</option>
						<option>신발</option>
						<option>가방</option>
					</select>
					
					<select id="select2">
					<option>== 상품 ==</option>
					</select>
					<button type="button"id="tagbtn"  value="상품태그">상품태그</button>
				</span>
				<div class="sr_input">
					<input id="sr_title" type="text" name="s_title" placeholder="제목을 입력해주세요." required>

				</div>
				<textarea id="ckeditor" name="s_contents" placeholder="내용을 입력하세요."></textarea>
				<div class="file">
					<span>
						<label for="sr_image1">ImageFile1</label>
						<input id="sr_image1" type=file name="s_image1" onchange="readURL1(this)" accept="image/jpg,jpeg,png,jifi" required>
						<br><img id="preview1">
					</span>
					<span>
						<label for="sr_image2">ImageFile2</label>
						<input id="sr_image2" type=file name="s_image2" onchange="readURL2(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview2">
					</span>
					<span>
						<label for="sr_image3">ImageFile3</label>
						<input id="sr_image3" type=file name="s_image3" onchange="readURL3(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview3">
					</span>
					<span>
					<ul id="tagname" class="tagul">
					
					</ul>
					</span>
				</div>
				<div id='tag'>
				</div>

				<input type="hidden" name="s_writer" value="<%=session.getAttribute("m_id")%>">
				<button class="sr_write_btn" type="submit" >작성하기</button>
			</form>
		</section>
	</main>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp"%>
</body>
<script>
var p_name1 = $("#p_name1").val;
if(p_name1=""){
	alert("한개 이상의 태그를 선택해주세요");
} 
</script>
<script>
	//ckeditor 생성
	ClassicEditor
	    .create( document.querySelector( '#ckeditor' ), {
	        language: 'ko' //언어설정
	    })
	    .catch( error => {
	        console.error( error );
	 });
	
	
	//file priveiw
	function readURL1(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview1').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview1').src = "";
		}
	}
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
	function readURL3(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview3').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview3').src = "";
		}
	}
	function readURL4(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview4').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview4').src = "";
		}
	}
	function readURL5(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('preview5').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview5').src = "";
		}
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
</html>
