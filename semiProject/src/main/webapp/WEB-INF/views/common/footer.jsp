<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        #footer{
            height: 200px;
        }
        #footerLine{
            height: 50px;
        }
        #footer_1, #footer_2{
            width: 100%;
        }

        #footer_1{
            height: 20%;
            background-color: rgba(224, 224, 205, 0.63);
            border-top: 0.5px solid rgba(0, 0, 0, 0.295);
            padding-top: 5px;
        }

        #footer_2{
            height: 80%;
            background-color: rgba(224, 224, 205, 0.63);
        }

        #footer_1 > a{
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            color: rgba(0, 0, 0, 0.295);
            vertical-align : middle;
            position: relative;
            left: 25%;
            right: 75%;
            top: 10%;
        }

        #footer_1 > a:hover{
            color: red;
        }
        
        #footer_2 > p{
            width : 100%;
            margin: 0;
            box-sizing: border-box;
        }

        #p1{
            position: relative;
            top: 10%;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            color: rgba(0, 0, 0, 0.226);
            text-shadow: 2px 2px rgba(168, 161, 161, 0.596);
        }

        #p2{
            position: relative;
            text-align: center;
            top: 60%;
            color : rgb(58, 56, 56);
        }

    </style>

</head>
<body>
	<div id="footer">
		<div id="footerLine"></div>
		<div id="footer_1">
			<a href="#">이용약관 |</a> 
			<a href="#">개인정보처리방침 |</a> 
			<a href="#">전자민원 접수</a>
		</div>
		<div id="footer_2">
			<p id="p1">글로벌하조</p>
			<p id="p2">Copyright © 1998-2024 Asihana Information Educational Institute All Right Reserved</p>
		</div>
	</div>
</body>
</html>