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
    #noticetext{
       margin: auto;
       width: 1000px;
       text-align: center;
       font-size: 30px;
       font-weight: bold;
       margin-top: 50px;
   }
   #login-form{
		background-color: rgb(247, 240, 233);
	}

	</style>

</head>
<body>

	
<jsp:include page="../common/header.jsp"/>
	
			<div id="noticetext">
	     	   <p>로그인</p>
	   		</div>
	<form id = "login-form"  action="login" method="post">
			<table align="center">
				<tr>
					<th>아이디</th>
					<th><input type="text" name="userId" id="" required /></th>
				</tr>
				<tr>
					<td class="space" colspan="2"><td>
				<tr>
				<tr>
					<td class="space" colspan="2"><td>
				<tr>
				<tr>
					<td class="space" colspan="2"><td>
				<tr>
					<th>비밀번호</th>
					<th><input type="password" name="userPwd" id="" required /></th>
				</tr>
				<tr>
					<td class="space" colspan="2"><td>
				<tr>
				<tr>
					<td class="space" colspan="2"><td>
				<tr>
				<tr>
					<td class="space" colspan="2"><td>
				<tr>
				<tr>
					<th colspan="2" style="margin: 0 auto;" style="text-align: center;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit"  class="btn btn-sm btn-primary">로그인</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-sm btn-secondary" onclick="location.href='enrollFrom'">회원가입</button>
					</th>
				</tr>
			</table>
		</form>   		
		
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>