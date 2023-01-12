<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="community.CommunityDTO"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STYLE | OtHub</title>
<!-- Meta Tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="expire" content="-1" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="robots" content="index,follow" />
    <!-- css, javascript -->
	<link href="css/lookbook/board/import.css" rel="stylesheet">
	<link href="css/lookbook/board/common.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

	//삭제 확인
	$("#deletechk").on("click",function(e){
		if(confirm("삭제하시겠습니까?")){
			
		}else{
			return false;
		}
	})

	//좋아요 
	$("#like_btn").click(function(){
		var s_seq = ${oneCommu.s_seq}
		var m_id = "<%=session.getAttribute("m_id") %>";
		if(m_id == 'null'){
			alert("로그인 후 이용가능합니다");
		}

		$.ajax({
			type : "POST",
			url : "boardlike",
			dataType : "json",
			data : {'s_seq' : s_seq, 'm_id' : m_id},
			
			success : function(resp){
				if(resp.result == 0){
					$(".off").attr("class","on");
				}
				else if(resp.result == 1){
					$(".on").attr("class","off");
					
				}
				$("#likecnt").html(resp.result2);
			}
		});//ajax
	});//onclick end
});//ready end
</script>
<script>
$(document).ready(function() {
	//댓글등록
	$("#replyRegist").click(function(){
		var b_seq = ${oneCommu.s_seq} ;//글번호
		var cm_contents = $("#reply").val();
		var cm_writer = "<%=session.getAttribute("m_id") %>";
		
		if(cm_contents == ''){
			alert("내용을 입력해주세요");
		}
		else if(cm_writer == "null"){
			alert("로그인 후 이용해주세요");
		}
		
		$.ajax({
			type: "post",
			url : "../reply/replyRegist",
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify({"b_seq": b_seq, "cm_contents" : cm_contents, "cm_writer": cm_writer}),
			success : function(data){
				if(data == 1){ //성공
					$("#reply").val("");
					getList();
					commentCount();
				}else{ //실패
					alert("잠시 후 다시 확인해주세요")
				}//if else end
			},//success end
		});//ajax end

	})//댓글 end
	
	getList(); //데이터 조회 메소드 호출
	//데이터 조회
	function getList(){
		
		var b_seq = ${oneCommu.s_seq} ;//글번호
		var pageNum = 1;
		
		$.getJSON("../reply/getList/" + b_seq + "/" + pageNum,
		function(data) {
            
            var str = "";
			
        	for(var i = 0 ; i < data.length ; i++){
                var date = new Date(data[i].cm_writingtime);
                var writingtime = date.getFullYear() + "/" + (date.getMonth()+1) + "/" +date.getDate();
        		
                str += "<div class='comment'>";
                str += "<div class='profile clearfix'>";
                str += "<span class='img fl'></span>";
                str += "<span class='id fl'>" + data[i].cm_writer + "</span>";
                str += "</div>";
                str += "<div class='comment_content'>" +  data[i].cm_contents + "<em>" +writingtime +"</em>";
                str += "</div>";
                str += "</div>";
        	}
            
            $("#comments").html(str);
            $("#comment_num").html(data[i])
        });
    } //getList end
    commentCount();
    
	function commentCount(){
		
		var b_seq = ${oneCommu.s_seq} ;//글번호
		var pageNum = 1;
		
		$.getJSON("../reply/commentCount/" + b_seq + "/" + pageNum,
		function(data) {
            
            $("#comment_num").html("댓글 "+data)
        });
    }//commentCount end
	

	
});//ready end
</script>

<!-- pose1 -->
<script>
$(document).ready(function() {
	var json = JSON.parse('${poseresult}');
	
	//canvas 작업
	var mycanvas = document.getElementById("mycanvas");
	var mycontext = mycanvas.getContext("2d");
	
	var myimage = new Image();
	myimage.src = "images/community/styleimg/${param.image }";
	if(myimage.width > mycanvas.width){
		mycanvas.width = myimage.width;
	}	
	if(myimage.height > mycanvas.height){
		mycanvas.height = myimage.height;
	}	
	
	myimage.onload = function(){//이미지 그릴 준비 대기
		mycontext.drawImage(myimage, 0, 0, myimage.width, myimage.height);
	//	bodyinforms 신체부위이름, 위치점 표시. colors 색상으로 각 신체부위별 다르게 표시
		var x = json.predictions[0][2].x * myimage.width ;
		var y = json.predictions[0][2].y * myimage.height;


		
		var imagedata1 = mycontext.getImageData(x,y,mycanvas.width,mycanvas.height)


		$("#red").val(imagedata1.data[0]);
		$("#green").val(imagedata1.data[1]);
		$("#blue").val(imagedata1.data[2]);


	}//onload
});//ready end
</script>
<!-- pose2 하의 -->
<script>
$(document).ready(function() {
	var json = JSON.parse('${poseresult}');
	

	if(json.predictions[0][12] == null){
		$("#bottom").attr("type","hidden");
	}
	//canvas 작업
	var mycanvas = document.getElementById("mycanvas3");
	var mycontext = mycanvas.getContext("2d");
		
	
	var myimage = new Image();
	myimage.src = "images/community/styleimg/${param.image }";
	if(myimage.width > mycanvas.width){
		mycanvas.width = myimage.width;
	}	
	if(myimage.height > mycanvas.height){
		mycanvas.height = myimage.height;
	}	
	
	myimage.onload = function(){//이미지 그릴 준비 대기
		mycontext.drawImage(myimage, 0, 0, myimage.width, myimage.height);
	//	bodyinforms 신체부위이름, 위치점 표시. colors 색상으로 각 신체부위별 다르게 표시

		var a = json.predictions[0][12].x * myimage.width ;
		var b = json.predictions[0][12].y * myimage.height;


		var imagedata2 = mycontext.getImageData(a,b,mycanvas.width,mycanvas.height)
		$("#red3").val(imagedata2.data[0]);
		$("#green3").val(imagedata2.data[1]);
		$("#blue3").val(imagedata2.data[2]);



	}//onload
});//ready end
</script>
<!-- object -->
<script>
$(document).ready(function() {
	var json = JSON.parse('${objectresult}');
	
	var result = false
	for(var i = 0; i< json.predictions[0].num_detections ; i++){
		if(json.predictions[0].detection_names[i] == "backpack"){
			result = true;
		}
	}
	if(result == false){
		$("#back").attr("type","hidden");
	}

	
	if(json == null){
		$("#back").attr("type","hidden");
	}
	var mycanvas = document.getElementById("mycanvas2");
	var mycontext = mycanvas.getContext("2d");
	
	var myimage = new Image();
	myimage.src = "images/community/styleimg/${param.image }";
	
	myimage.onload = function(){
		
		mycontext.drawImage(myimage, 0, 0, myimage.width, myimage.height);
			var y1 = json.predictions[0].detection_boxes[1][0] * myimage.height;
			var x1 = json.predictions[0].detection_boxes[1][1] * myimage.width;
			var y2 = json.predictions[0].detection_boxes[1][2] * myimage.height;
			var x2 = json.predictions[0].detection_boxes[1][3] * myimage.width;		
			// 사물 박스 그리기
			var x = x1;
			var y = y1;
			var width = x2 - x1;
			var height = y2 - y1;
			var x3 = (x1+x2)/2;
			var y3 = (y1+y2)/2;
			
			if(myimage.width > mycanvas.width){
				mycanvas.width = myimage.width;
			}	
			if(myimage.height > mycanvas.height){
				mycanvas.height = myimage.height;
			}
			
			if(json.predictions[0].detection_names.includes("backpack") == true){
			mycontext.fillStyle="red";
			mycontext.fillRect(x3,y3-50,5,5);
			
			var imagedata = mycontext.getImageData(x,y,mycanvas.width,mycanvas.height)
			$("#red2").val(imagedata.data[0]);
			$("#green2").val(imagedata.data[1]);
			$("#blue2").val(imagedata.data[2]);
			//사물이름 출력
			mycontext.fillStyle="red";
			mycontext.font="12px batang";
			mycontext.fillText(json.predictions[0].detection_names[1], x3, y3);
			}

	

	}//onload
	
});//ready end
</script>
</head>
<%String p_name1 = (String)request.getAttribute("p_name1");
String p_name2 = (String)request.getAttribute("p_name2");
String p_name3 = (String)request.getAttribute("p_name3");
String p_name4 = (String)request.getAttribute("p_name4");
String image2 = (String)request.getAttribute("image2");
String image3 = (String)request.getAttribute("image3");%>
<body>
<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
		<!-- chatbot include -->
		<%@include file="../chatbot/chatbot.jsp" %>
	
<div id="container">
    <div class="inner">
        <h1>STYLE</h1>
    	<div class="table">
            <table class="detail">
                <colgroup>
                    <col width="100px"><col width=""><col width="180px">
                </colgroup>
                <thead>
                    <tr>
                        <th>No. ${oneCommu.s_seq }</th>
                        <th>${oneCommu.s_title }</th>
                        <th>조회수 ${oneCommu.s_viewcount }</th>
                    </tr>
                </thead>
                <tbody>

                   <tr class="stylenone">
                   <td colspan="1">작성자 ${oneCommu.s_writer}</td>
                  
        		   <td colspan="1">
                           <button onclick="window.open(' report?s_seq=${oneCommu.s_seq }', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');">신고하기</button>
             
                   </td>
                   <% if(request.getAttribute("writer").equals(m_id)){ %>
                        <td colspan="5">
                            <a href="deleteCommunity?s_seq=${oneCommu.s_seq }" id="deletechk" class="delete_btn btns">삭제하기</a>
                            <a href="updatecommuform?s_seq=${oneCommu.s_seq }" class="edit_btn btns">수정하기</a>                           
                  		 </td>
                   <% }else if(role1 != null){ if(role1.equals("admin")){%>
                   		<td colspan="5">
                            <a href="deleteCommunity?s_seq=${oneCommu.s_seq }" id="deletechk" class="delete_btn btns">삭제하기</a>
                            <a href="updatecommuform?s_seq=${oneCommu.s_seq }" class="edit_btn btns">수정하기</a>                           
                  		 </td>
                   <% } }%>
                    </tr>
                 
                  
                    <tr>
                        <td colspan="6"><img src="images/community/styleimg/${oneCommu.imagename1 }" alt="firstimage" style="width: 600px"></td>
                    </tr>
                    <% if(image2!= null){if(!image2.equals("")){ %>
                    <tr>
                        <td colspan="6"><img src="images/community/styleimg/${oneCommu.imagename2 }" alt="secondimage"style="width: 600px"></td>
                    </tr>
                    <%}} %>
                      <% if(image3!= null){if(!image3.equals("")){ %>
                    <tr>
                        <td colspan="6"><img src="images/community/styleimg/${oneCommu.imagename3 }" alt="thirdimage"style="width: 600px"></td>
                    </tr>
                    <%}} %>
                    <tr class="lasttr" >
                    	<td colspan="6" style="color:black; font-size: 22px">${oneCommu.s_contents}</td>
                    </tr>
                </tbody>
            </table>
            
            
            <!-- 상품태그 -->
 
            
            <div id="container">
   			<div class="inner">
   			<h2>상품 태그</h2>
   			<div class="flex">
   			<% if(!p_name1.equals("")){ %>
            <div class="card">
               <div class="img"> <a href="productdetail?p_id=${tag1.get(0).getP_id() }"><img src="images/${tag1.get(0).getP_thumb()}"></a></div>
                <div class="txt_box">
                    <h2>${tag1.get(0).getP_name()}</h2>
                    <ol class="clearfix">
                        <li class="fl">
                           <p> ${tag1.get(0).getP_price()} 원</p>
                        </li>
                    </ol>
                </div>
            </div>
             <%} %>
            <% if(p_name2 != null){if(!p_name2.equals("")){ %>
            <div class="card">
               <div class="img"> <a href="productdetail?p_id=${tag2.get(0).getP_id() }"><img src="images/${tag2.get(0).getP_thumb()}"></a></div>
                <div class="txt_box">
                    <h2>${tag2.get(0).getP_name()}</h2>
                    <ol class="clearfix">
                        <li class="fl">
                           <p> ${tag2.get(0).getP_price()} 원</p>
                        </li>
                    </ol>
                </div>
            </div>
             <%} }%>
            <%if(p_name3 != null){ if(!p_name3.equals("")){ %>
            <div class="card">
               <div class="img"> <a href="productdetail?p_id=${tag3.get(0).getP_id() }"><img src="images/${tag3.get(0).getP_thumb()}"></a></div>
                <div class="txt_box">
                    <h2>${tag3.get(0).getP_name()}</h2>
                    <ol class="clearfix">
                        <li class="fl">
                           <p >가격 ${tag3.get(0).getP_price()} 원</p>
                        </li>
                    </ol>
                </div>
            </div>
             <%}} %>
            <%if(p_name4 != null){ if(!p_name4.equals("")){ %>
            <div class="card">
               <div class="img"> <a href="productdetail?p_id=${tag4.get(0).getP_id() }"><img src="images/${tag4.get(0).getP_thumb()}"></a></div>
                <div class="txt_box">
                    <h2>${tag4.get(0).getP_name()}</h2>
                    <ol class="clearfix">
                        <li class="fl">
                           <p> ${tag4.get(0).getP_price()} 원</p>
                        </li>
                    </ol>
                </div>
            </div>
             <%}} %>
            </div>
            </div>
            </div>

            <!-- 댓글 -->
            <div class="comment_box">
                <div class="clearfix">
                    <div class="comment_num fl" id="comment_num"></div>
					<div class="like fl">
						<%if(((Integer)request.getAttribute("result")).intValue()==1) {%>
                        <a id="like_btn" class="on"><%} else{ %><a id="like_btn" class="off"><%} %>
                        <span class="heart"></span>좋아요 <span id="likecnt">${oneCommu.s_like }</span></a>
                    </div>
                </div>
                
                <!-- 댓글 조회 -->
            	<div class="comments" id="comments">
                    
                </div>
                    <!-- 댓글 작성 -->
                    <div class="clearfix">
                        <div class="fl">
                            <textarea placeholder="댓글을 작성해주세요." width="300px" id="reply"></textarea>
                        </div>
                        <div class="fl">
                            <button type="button" class="write_btn" id="replyRegist">댓글달기</button>
                        </div>
                    </div>
                </div>
            </div>
           
            <a href="/community" class="more" style="color:white;text-align: center" >목록</a>
        </div>
    </div>
</div>
<div id="xx"></div>
<form action="color">
<input type="hidden"  id="red" value="" name="red">
<input type="hidden"  id="green" value="" name="green">
<input type="hidden"  id="blue" value="" name="blue">
<input type="submit" value="비슷한 상의 조회">
</form>

<form action="color2">
<input type="hidden" id="red2" value="" name="red">
<input type="hidden" id="green2" value="" name="green">
<input type="hidden"  id="blue2" value="" name="blue">
<input type="submit" value="비슷한 가방 조회" id="back">
</form>

<form action="color3">
<input type="hidden" id="red3" value="" name="red">
<input type="hidden" id="green3" value="" name="green">
<input type="hidden"  id="blue3" value="" name="blue">
<input type="submit" value="비슷한 하의 조회" id="bottom">
</form>

<canvas id="mycanvas" width=500 height=500  hidden></canvas>
<canvas id="mycanvas2" width=500 height=500  hidden></canvas>
<canvas id="mycanvas3" width=500 height=500  hidden></canvas>
<div id="x"></div>
<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
<script type="text/javascript">


</script>
</html>