<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Post | OtHub</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/showroom/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp"%>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
	<main class="postMain">
		<header class="postHead">
			<h3 class="postTitle">${onePost.sr_title }</h3>
		</header>
		<section class="PostImg">
			<article class="postImgBox">
				<div class="postBigImg">
					<img class="bigImg" src="images/showroom/user_img/${onePost.sr_imgname1 }">
				</div>
				<div class="postSmallImg">
					<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname1 }">
					<c:if test="${onePost.sr_imgname2 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname2 }">
					</c:if>
					<c:if test="${onePost.sr_imgname3 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname3 }">
					</c:if>
					<c:if test="${onePost.sr_imgname4 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname4 }">
					</c:if>
					<c:if test="${onePost.sr_imgname5 != '' }">
						<img class="smallImg" src="images/showroom/user_img/${onePost.sr_imgname5 }">
					</c:if>
				</div>
			</article>
		</section>
		<aside class="postAside">
			<form method="post">
				<table>
					<tbody>
						<tr>
							<td class="rowname">상품명</td>
							<td class="col_p">${onePost.sr_title }</td>
						</tr>
						<tr>
							<td class="rowname">유형</td>
							<td class="col_p">
								<c:if test="${onePost.sr_kind == 1}">
									스튜디오
								</c:if>
								<c:if test="${onePost.sr_kind == 2}">
									사진관
								</c:if>
								<c:if test="${onePost.sr_kind == 3}">
									사진작가
								</c:if>
							</td>
						</tr>
						<tr class="col">
							<td class="rowname2 r_num" colspan="2">
								<label class="rowname" for="r_numOfPer">예약인원</label><br>
								<input type='button' onclick='javascript:this.form.r_numOfPer.value--;' value='-'/>
								<c:if test="${role1 == 'user'}">
									<input type="text" name="r_numOfPer" value="1" required>
								</c:if>
								<c:if test="${role1 != 'user'}">
									<input type="text" name="r_numOfPer" value="1">
								</c:if>
								<input type='button' onclick='javascript:this.form.r_numOfPer.value++;' value='+'/>
							</td>
						</tr>
						<tr>
							<td class="rowname2" colspan="2">
								<label class="rowname" for="r_date">예약 날짜</label><br>
								<c:if test="${role1 == 'user'}">
									<input type="date" name="r_date" id="date" required>
								</c:if>
								<c:if test="${role1 != 'user'}">
									<input type="date" name="r_date" id="date">
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="hidden" colspan="2">
								<input type="hidden" name="m_id" value="${member.m_id }"><br>
								<input type="hidden" name="sr_num" value="${onePost.sr_num }">
							</td>
						</tr>	
					</tbody>
				</table>
				<div class="d_btn">
					<c:if test="${role1 == 'user' }">
						<button type="submit" onclick="javascript:form.action='/reserv'">예약 하기</button><br>
					</c:if>
					<c:if test="${role1 != 'user' && role1 !='admin' && role1 !='partner' }">
						<button onclick="javascript:form.action='/login'">로그인 후 예약해주세요</button>
						<button onclick="javascript:form.action='/signup'">회원가입 하러가기</button>
					</c:if>
					<c:if test="${role1 =='admin' || role1 =='partner' }">
						<button>예약은 일반회원만 가능합니다</button>
					</c:if>
				</div>
			</form>
		</aside>
		<section class="postContents">
			<div class="contentsInfo_box">
				<div class="contentsInfo">
					<span>▤공간유형</span>
					<span>
						<c:if test="${onePost.sr_kind == 1}">
							스튜디오
						</c:if>
						<c:if test="${onePost.sr_kind == 2}">
							사진관
						</c:if>
						<c:if test="${onePost.sr_kind == 3}">
							사진작가
						</c:if>
					</span>
				</div>
				<div class="contentsInfo">
					<span>▤이용시간</span>
					<span>${onePost.sr_operatingtime}</span>
				</div>
				<div class="contentsInfo">
					<span>▤휴무</span>
					<span>${onePost.sr_closed}</span>
				</div>
			</div>
			<div class="contentsMapInfo">
				<h4>${onePost.sr_contents }</h4>
				<span>${onePost.sr_address2 }</span>
				<div>
					<span>전화번호</span>
					<span>${onePost.sr_number}</span>
				</div>
			</div>
			<c:if test="${onePost.sr_address2 != '' && onePost.sr_address2 != null}">
				<div id="map"></div>
			</c:if>
		</section>
	</main>
	
	<!-- footer include -->
	<%@include file="../include/footer.jsp"%>
</body>


<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de99cf4145328e6411314ae05caa843b&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('<c:out value='${onePost.sr_address2}'/>', function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    
	    
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:10px 0 5px;color:blue;font-weight:700;"><c:out value='${onePost.sr_contents}'/></div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	});  
</script>
<script>
	//이미지 전환
	window.onload = function(){
		var bigImg = document.querySelector(".bigImg");
		var smallImgs = document.querySelectorAll(".smallImg");
		
		
		for(var i = 0; i < smallImgs.length; i++){
			console.log(smallImgs[i].getAttribute("src"));
			smallImgs[i].addEventListener("click", changeImg);
		}
		function changeImg(){
			var smallPicAttribute = this.getAttribute("src");
			bigImg.setAttribute("src", smallPicAttribute);
		}
	}
	
	//input date 날짜범위 선택
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("date").setAttribute("min", today);
	
	var d = new Date();
	var endDay1 = new Date(new Date().setDate(d.getDate() +14));
	var endDay2 = new Date(+endDay1 + 3240 * 10000).toISOString().split("T")[0]
	document.getElementById("date").setAttribute("max", endDay2);
</script>
</html>
