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
		 		$("#ten").trigger("click");
		 		alert("전신입니다. 포인트가 100점 적립됩니다.");

	} else if ( (json.predictions[0]['2'] || json.predictions[0]['5'] ) || 
			(json.predictions[0]['3'] || json.predictions[0]['6']) || 
			(json.predictions[0]['9'] || json.predictions[0]['12']) || 
			(json.predictions[0]['10'] || json.predictions[0]['13']) == null){
				$("#five").trigger("click");
	 			alert("전신이 아닙니다. 포인트가 50점 적립됩니다.");	
	} else {
		alert("이미지 인식이 불가합니다. 신체가 제대로 나온 사진으로 업로드 해주세요.");
	}//else
	
});//ready end

</script>

</head>
<body>

<form method="post" class="ten" style="display:none;">

<input name="m_point" value="100" />
<input name="m_id" value="${m_id}" /><br>

<button type="submit" id="ten" >적립</button>

</form>


<form method="post" class="five" style="display:none;">

<input name="m_point" value="50" />
<input name="m_id" value="${m_id}" /><br>

<button type="submit" id="five" >적립</button>

</form>


</body>
</html>


