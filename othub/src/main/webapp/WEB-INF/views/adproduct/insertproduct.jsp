<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/adproduct/adpinsert.css" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
});//ready end
</script>
</head>
<body>

<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	<%@ include file="../adproduct/adpnav.jsp" %>
	
<!-- chatbot include -->
	<%@include file="../chatbot/chatbot.jsp" %>


<form method="post" enctype="multipart/form-data" class="insert_box">

<button type="submit" class="product_submit">등록</button><br>

<input type="text" name="p_name" id="p_name" required placeholder="상품명" required> <br>

<input type="text" name="p_brand" id="p_brand" required placeholder="브랜드명" required> <br>

<input type="number" name="p_price" id="p_price" required placeholder="가격" > 

<input type="number" name="p_stock" id="p_stock" required placeholder="재고" > <br>

<select name="category_id" id="category_id" required>
<option disabled selected id="first">카테고리</option>
<option value=1> 상의 </option>
<option value=2> 하의 </option>
<option value=3> 아우터 </option>
<option value=4> 신발 </option>
<option value=5> 가방 </option>
</select>

<select name="p_color" id="p_color" required>
<option disabled selected id="first">컬러</option>
<option value="white"> white </option>
<option value="black"> black </option>
<option value="blue"> blue </option>
<option value="red"> red </option>
<option value="orange"> orange </option>
<option value="yellow"> yellow </option>
<option value="green"> green </option>
<option value="brown"> brown </option>
<option value="silver"> silver </option>
<option value="gold"> gold </option>
<option value="ivory"> ivory </option>
<option value="beige"> beige </option>
</select>

<select name="p_sex" id="p_sex" required>
<option disabled selected id="first">성별</option>
<option value="male"> 남성 </option>
<option value="female"> 여성 </option>
</select>


<div class="inputpic">

<div class="p_thumb">
   <label for="p_thumb">썸네일</label>
   <input type="file" id="p_thumb" name="p_thumb" onchange="readURL1(this)" required/>
   <br><img id="select_img1" style="width:200px">
   
   
</div>

<div class="p_image1">
   <label for="p_image1">이미지1</label>
   <input type="file" id="p_image1" name="p_image1" onchange="readURL2(this)" required/>
   <br><img id="select_img2" style="width:200px">
   
</div>

<div class="p_image2">
   <label for="p_image2">이미지2</label>
   <input type="file" id="p_image2" name="p_image2" onchange="readURL3(this)" required/>
   <br><img id="select_img3" style="width:200px">

   
</div>

<div class="p_image3">
   <label for="p_image3">이미지3</label>
   <input type="file" id="p_image3" name="p_image3" onchange="readURL4(this)" required/>
   <br><img id="select_img4" style="width:200px">

</div>

<div class="p_contents">
   <label for="p_contents">상세 이미지</label>
   <input type="file" id="p_contents" name="p_contents" onchange="readURL5(this)" required/>
   <br><img id="select_img5" style="width:200px">
   
   </div>
   
   <script>

   function readURL1(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img1').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img1').src = "";
		}
	}

   function readURL2(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img2').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img2').src = "";
		}
	}
   
   function readURL3(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img3').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img3').src = "";
		}
	}
   
   function readURL4(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img4').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img4').src = "";
		}
	}

   
   function readURL5(input) {
		if(input.files &&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				document.getElementById('select_img5').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('select_img5').src = "";
		}
	}
   </script>
   

</div>


</form>


<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>