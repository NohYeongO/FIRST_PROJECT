<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<style>
	#content{
            width: 1000px;
            margin: auto;   
            text-align: center;
            padding-top: 80px;
            font-size: 30px;
            
      	  }
    #enroll-form input{
		margin:8px;
	
	}
	#enroll-form{
		background-color: rgb(247, 240, 233);
	}
	 #noticetext{
            margin: auto;
            width: 1000px;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-top: 50px;
        }
	
	</style>

</head>
<body>


<jsp:include page="../common/header.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
			<div id="noticetext">
	     	   <p>회원가입</p>
	   		</div>
	   	<br>
		
	
		<form id = "enroll-form" method="post" action="insertMember">
			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" maxlength="12" required name="userId"></td>
					<td><button class = "btn btn-sm btn-primary" type="button"  onclick="idCheck();">중복확인</button></td>
					<!-- 중복확인 나중에 AJAX배우고 다음주..? -->
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" maxlength="15" required name="userPwd"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" maxlength="15" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 닉네임</td>
					<td><input type="text" maxlength="5" required name="nickName"></td>
					<td></td>
				</tr>
			</table>

			<br><br>

			<div align="center">
				<button type="reset"class="btn btn-sm btn-secondary">취소</button>
				<button type="submit" class="btn btn-sm btn-primary">회원가입</button>
			</div>

			<br><br>
			
		</form>
	
	<br><br><br><br><br><br>



	<jsp:include page="../common/footer.jsp"/>
</body>
</html>