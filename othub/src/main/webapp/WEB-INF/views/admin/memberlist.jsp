<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!--meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="css/admin/list/common.css" rel="stylesheet">
<!-- js -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
	});//ready end
</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- navbar include -->
	<%@include file="../include/navbar.jsp" %>
	
	<main class="list_main">
		<!-- navbar include -->
		<%@include file="../admin/adminpagenav.jsp" %>
		<section class="ptlist_sec1">
			<h3 class="h3">전체 회원 정보</h3>
			<table id="inventory">
            <colgroup>
              <col width="100px"><col width="100px"><col width="100px"><col width="150px"><col width="150px"><col width="150px"><col width="100px">
               <col width="100px"><col width="100px"><col width="50px" span="2">
            </colgroup>
            <thead >
               <tr>
                  <th>아이디</th>
                  <th>비밀번호</th>
                  <th>이름</th>
                  <th>주소</th>
                  <th>폰</th>
                  <th>이메일</th>
                  <th>성별</th>
                  <th>가입일자</th>
                  <th>등급</th>
                  <th colspan="2"></th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${memberlist }" var="member">
               <tr class="styleone">
                  <form method="post" name="form">
                  <td><input type="text" value="${member.m_id}" name="m_id"></td>
                  <td>${member.m_pw }</td>
                  <td>${member.m_name }</td>
                  <td>${member.m_address }</td>
                  <td>${member.m_phone}</td>
                  <td>${member.m_email }</td>
                  <td>${member.m_sex}</td>
                  <td>${member.m_regdate }</td>
                  <td>
                     <select name="role1" id="select" class="dgfa">
                        <c:if test="${member.role1.equals('admin') }">
                            <option value="${member.role1}">${member.role1}</option>
                            <option value="user">user</option>
                            <option value="partner">partner</option>
                        </c:if>
                        <c:choose>
                           <c:when test="${member.role1.equals('partner')}">
                              <option value="${member.role1}">${member.role1}</option>
                               <option value="user">user</option>
                               <option value="admin">admin</option>
                            </c:when>
                           <c:when test="${member.role1.equals('user')}">
                              <option value="${member.role1}">${member.role1}</option>
                               <option value="admin">admin</option>
                               <option value="partner">partner</option>
                            </c:when>
                            
                        </c:choose>>    
                     </select>
                  </td>
                  <td class="updatemember"><input type="submit" value="수정" onclick="javascript: form.action='updateMemberByAdmin';"/></td>
                  <td class="deletemember"> <input type="submit" id="deletebtn" value="탈퇴" onclick="javascript: form.action='deleteMemberByAdmin';"/></td>
                  </form>
               </tr>
               </c:forEach>
            </tbody>
         </table>
		</section>
	</main>
	<!-- footer include -->
	<%@include file="../include/footer.jsp" %>
</body>
</html>