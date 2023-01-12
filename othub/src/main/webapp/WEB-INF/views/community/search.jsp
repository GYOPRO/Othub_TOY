<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<style type="text/css">
.container{
	width: 800px;
	margin-left: 350px;
}
.form-control{
	margin: 5px;
}
input{
width: 300px;}
select{
width: 80px;}
#buttona{
border: 1px solid;
width: 70px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<form method="post" name="search" action="searchboard">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField" id="selectbox">
								<option value="">--</option>
								<option value="s_title">제목</option>
								<option value="s_writer">작성자</option>
								<option value="s_contents">내용</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100" id="inputbox"></td>
						<td><button type="submit" class="btn btn-success" id="buttona">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#buttona").on("click", function(e){
    
    var type = $("#selectbox").val();
    var keyword = $("#inputbox").val();
    if(!$("#selectbox").val()){
    	alert("검색 종류를 선택하세요.");
    	e.preventDefault();
    	$("#selectbox").focus();
    }
    else if(!$("#inputbox").val()){
    	alert("키워드를 입력하세요.");
    	e.preventDefault();
    	$("#inputbox").focus();
    }
    
});
</script>
</html>
