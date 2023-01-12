<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Editor | Showroom</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/showroom/common.css" rel="stylesheet">
<!-- ckeditor / jquery 라이브러리 연결 -->
<script src="js/ko.js"></script>
<script src="js/ckeditor.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
	<%//variable
		String Date = new java.text.SimpleDateFormat("yyyy.MM.dd").format(new java.util.Date());
	%>
	
	<!-- main container -->
	<main class="sr_write_main" >
		<section class="writingform">
			<form action="updatepost" method="post" enctype="multipart/form-data">
				<h3 class="h3">Showroom Editor</h3>
				<span class="wrt_info">
					<span>⭐ No.${onePost.sr_num } </span>
					<span>✒️ ${m_id } 관리자</span>
					<span>⏱️ ${onePost.sr_writingtime }</span>
				</span>
				<span class="sr_select_box">
					<select name="sr_kind" id="sr_kind"  selected="${onePost.sr_kind }" required>
						<option value="">== 유형 선택 ==</option>
						<option value="1">스튜디오</option>
						<option value="2">사진관</option>
						<option value="3">프리랜서 사진작가</option>
					</select>
					<select name="sr_region" id="sr_region"  required>
						<option value="">== 지역 선택 ==</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="울산">울산</option>
						<option value="부산">부산</option>
						<option value="제주도">제주도</option>
						<option value="제주도">협의</option>
					</select>
				</span>
				<div class="sr_input">
					<input id="sr_title" type="text" name="sr_title"  value ="${onePost.sr_title }" placeholder="제목을 입력해주세요.(상호명)" required>
					<input id="sr_price" type="number" name="sr_price" value ="${onePost.sr_price }" placeholder="시간당 가격을 기입해주세요." required>
					<input id="sr_operatingtime" type="text" name="sr_operatingtime" value ="${onePost.sr_operatingtime }" placeholder="운영시간을 입력해주세요." required>
					<input id="sr_closed" type="text" name="sr_closed" value ="${onePost.sr_closed }" placeholder="휴무일을 입력해주세요." required>
					<input id="sr_number" type="text" name="sr_number" value ="${onePost.sr_number }" placeholder="연락처를 입력해주세요. 02-000-0000" required>
					<input id="member_post"  type="text" name="sr_adress1" value ="${onePost.sr_address1 }" placeholder="우편번호 (주소를 검색하려면 클릭해주세요)" readonly onclick="findAddr()"><br>
					<input id="member_addr" type="text" name="sr_adress2" value ="${onePost.sr_address2 }" placeholder="점포 주소를 입력해주세요." readonly> <br>
					<input type="text" name="sr_adress3" value ="${onePost.sr_address3 }" placeholder="상세 주소를 입력해주세요.">
				</div>
				<textarea id="ckeditor" name="sr_contents" placeholder="내용을 입력하세요.">${onePost.sr_contents }</textarea>
				<div class="file">
					<span>
						<label for="sr_image1">ImageFile1</label>
						<input id="sr_image1" type=file name="sr_image1" onchange="readURL1(this)" accept="image/jpg,jpeg,png,jifi" required>
						<br><img id="preview1">
					</span>
					<span>
						<label for="sr_image2">ImageFile2</label>
						<input id="sr_image2" type=file name="sr_image2" onchange="readURL2(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview2">
					</span>
					<span>
						<label for="sr_image3">ImageFile3</label>
						<input id="sr_image3" type=file name="sr_image3" onchange="readURL3(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview3">
					</span>
					<span>
						<label for="sr_image4">ImageFile4</label>
						<input id="sr_image4" type=file name="sr_image4" onchange="readURL4(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview4">
					</span>
					<span>
						<label for="sr_image5">ImageFile5</label>
						<input id="sr_image5" type=file name="sr_image5" onchange="readURL5(this)" accept="image/jpg,jpeg,png,jifi">
						<br><img id="preview5">
					</span>
				</div>
				<input type="hidden" name="sr_num" value=${onePost.sr_num }>
				<input type="hidden" name="sr_writer" value="<%=session.getAttribute("m_id")%>">
				<input class="sr_write_btn" type="submit" onclick="sr_fileCheck(this)" value="작성하기">
			</form>
		</section>
	</main>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp"%>
</body>
<script>
	//ckeditor 생성
	ClassicEditor
	    .create( document.querySelector( '#ckeditor' ), {
	        language: 'ko' //언어설정
	    })
	    .catch( error => {
	        console.error( error );
	 });
	
	//미입력,미선택 경고창
	var kindCheck = document.getElementById("sr_kind");
	var regionCheck = document.getElementById("sr_region");
	var titleCheck = document.getElementById("sr_title");
	var fileCheck = document.getElementById("sr_image1");
	function sr_fileCheck(){
		if(kindCheck.value == ''){
			kindCheck.focus();
			alert("유형을 선택해주세요.");
			return false;
		}
		else if(regionCheck.value == ''){
			regionCheck.focus();
			alert("지역을 선택해주세요.");
			return false;
		}
		else if(titleCheck.value == ''){
			titleCheck.focus();
			alert("제목 및 내용을 입력해 주세요.");
			return false;
		}
		else if(!fileCheck.value){
			alert("이미지 파일을 첨부해 주세요.");
			return false;
		}
	}
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
