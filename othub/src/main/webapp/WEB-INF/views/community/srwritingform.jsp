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
	var top = [
		'카라 크롭 스웻셔츠',
		'스퀘어 넥 크롭 롱 슬리브',
		'스트릿로즈 반팔티',
		'베이직 긴팔 티셔츠 보이즈',
		'시그니처 로고 스웻셔츠',
		'아코 베어 스탠다드 티셔츠',
		'더블코튼 무지 오버핏 긴팔티',
		'컬시브 로고 롱 슬리브 티셔츠',
		'올드 아이비 클래식 카라 하프 티셔츠',
		'NY 테니스 긴팔 티셔츠'];
	var bottom = [
		'와이드핏 메이플 진',
		'쿨링 와이드 밴딩팬츠',
		'커버밴드 슬림 루즈 부츠컷 데님',
		'하프 밴딩 플리츠 스커트',
		'롱 플레어 샤 스커트',
		'사이드 컷팅 스웨트 팬츠',
		'투라인 와이드 트랙팬츠',
		'SINCE LOGO 특양면 조거 팬츠',
		'카펜터 카고 팬츠 더스티퍼플',
		'인텐드 데님팬츠 흑청',];
	var outer = [
		'슬림핏 니트 집업 가디건',
		'컴파이 플리스 자켓',
		'더블 포켓 나일론 집업',
		'크롭 가디건 셋업',
		'베이직 브이넥 가디건',
		'플리스 아우터',
		'덤보 기모 스웨트 집업',
		'무지 더블코튼 맨투맨 가디건',
		'리버시블 아이코닉 벙커 점퍼',
		'벨벳 리버시블 덕다운 숏패딩']; 
	var shoes = [
		'플랫폼 아웃솔 스판 앵클 부츠',
		'모니카 스니커즈 데이지',
		'스코츠데일 홀스빗 로퍼 우먼',
		'프레즐 스틱',
		'크림든 롱부츠',
		'키높이 소가죽 독일군 스니커즈',
		'리커버리 슬라이드 샌들',
		'돔바 올 라운드',
		'MIGHTY BLACK',
		'코니 플레인']; 
	var bag = [
		'Amber bag - S022',
		'Thyme bag - D1045',
		'모그 숄더백',
		'zuri bag',
		'Mellow 멜로',
		'Retro Sport Bag',
		'4way tote bag',
		'아그네스 메신저백',
		'톱스티치 레더 핸들 크로스 바디백',
		'MESH STRING BACKPACK']; 
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
			<form action="writingcommunity" method="post" enctype="multipart/form-data" name="myForm">
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
				<button class="sr_write_btn" type="submit" onclick="goSubmit()">작성하기</button>
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
