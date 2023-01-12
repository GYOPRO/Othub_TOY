<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	var json = JSON.parse('${poseresult}');

	if( (json.predictions[0]['2'] || json.predictions[0]['5'] ) && 
			(json.predictions[0]['3'] || json.predictions[0]['6']) && 
			(json.predictions[0]['9'] || json.predictions[0]['12']) && 
			(json.predictions[0]['10'] || json.predictions[0]['13']) != null){
		 		alert("전신입니다. 포인트를 100점 적립하실 수 있습니다.");

	} else if ( (json.predictions[0]['2'] || json.predictions[0]['5'] ) || 
			(json.predictions[0]['3'] || json.predictions[0]['6']) || 
			(json.predictions[0]['9'] || json.predictions[0]['12']) || 
			(json.predictions[0]['10'] || json.predictions[0]['13']) == null){
	 			alert("전신이 아닙니다. 포인트를 50점만 적립하실 수 있습니다.");	
	} else {
		alert("이미지 인식이 불가합니다. 신체가 제대로 나온 사진으로 업로드 해주세요.");
	}//else
		
		self.close();
	
});//ready end

</script>

</head>
<body>

<div id="text">
<p> 사진을 분석하지 못했습니다.
보다 신체가 정확히 나온 사진으로 사진을 등록해 주세요.</p>
</div>



</body>
</html>


