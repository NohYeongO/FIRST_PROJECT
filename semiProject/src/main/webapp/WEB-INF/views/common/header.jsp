<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asihana</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<style>
        #login_join{
            height: 50px;
            width: 1000px;
            margin: auto;
            padding-top: 10px;
            text-shadow: 2px 2px rgba(128, 128, 128, 0.226);
        }
        #login_join > a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            position: relative;
            left: 90%;
            font-size: 13px;
        }
         #login_join > p{
              text-decoration: none;
            color: rgb(85, 83, 83);
            position: relative;
            left: 90%;
            font-size: 13px;
        }
        #logotop{
            height: 40px;
            width: 1000px;
            margin: auto;
            text-align: center;
            text-shadow: 2px 2px rgba(128, 128, 128, 0.226);
        }
        #logolow{
            height: 60px;
            width: 1000px;
            margin: auto;
            text-align: center;
            text-shadow: 3px 3px rgba(128, 128, 128, 0.226);
        }
        #menubar{
            height: 47px;
            width: 1000px;
            margin: auto;
            border-bottom: 1px solid rgba(75, 70, 70, 0.692);
        }
        #logotop > a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            font-size: 17px;
            font-weight: 600;
            position: relative;
            top: 40%;
        }
        #logolow > a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            font-size: 30px;
            font-weight: 800;
           
        }
        #logolow  b{
            color: red;
        }


        #navi{
            list-style: none;
            margin: 0;
            height: 100%;
            position: relative;
            bottom: 20%;
            left: 15%;
        }

        #navi > li{
            float: left;
            width: 13%;
            height: 100%;
            text-align: center;
        }

        #navi a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            font-weight: 700;
            width: 100%;
            height: 100%; 
            display : block; 
            line-height: 50px;
            z-index: 2;
        }

        #navi > li > ul{
            list-style : none;
            padding : 0px;
            display: none;
        }

        #navi > li > a:hover + ul{
            display: block;
        }

        #navi > li > ul:hover {
           display: block;
        }

        #navi a:hover{
            font-size: 18px;
            color: red;
        }

        #navi > li > ul > li > a{
            position: relative; 
            font-weight: bold;
            font-size : 14px; 
            background-color: rgba(226, 86, 86, 0.452);
            height: 40px;
            padding-bottom: 7px; 
        }
        #navi > li > ul a:hover{font-size : 14px;}
        
        #navi_mypage{
            list-style: none;
            margin: 0;
            height: 100%;
            position: relative;
            bottom: 20%;
            right: 5%;
            top:70%
        }

        #navi_mypage > li{
            float: right;
            width: 13%;
            height: 100%;
            text-align: center;
        }

        #navi_mypage a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            font-weight: 700;
            width: 100%;
            height: 100%; 
            display : block; 
            line-height: 50px;
            z-index: 2;
        }

        #navi_mypage > li > ul{
            list-style : none;
            padding : 0px;
            display: none;
        }

        #navi_mypage > li > a:hover + ul{
            display: block;
        }

        #navi_mypage > li > ul:hover {
           display: block;
        }

        #navi_mypage a:hover{
            font-size: 18px;
            color: red;
        }

        #navi_mypage > li > ul > li > a{
            position: relative; 
            font-weight: bold;
            font-size : 14px; 
            background-color: rgba(226, 86, 86, 0.452);
            height: 40px;
            padding-bottom: 7px; 
        }
        #navi_mypage > li > ul a:hover{font-size : 14px;}
    </style>
</head>
<body>


	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${ alertMsg }',function(){alertify.success('ㅎㅎ')});
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
		<c:choose>
		<c:when test="${ empty loginUser }">
			<div id="login_join">
		        <a href="loginForm">로그인</a>
		        <a href="enrollForm">회원가입</a>
		    </div>
		</c:when>
		<c:otherwise>
			<div id="login_join">
				<c:choose>
					<c:when test="${ loginUser.userId ne 'admin' }">
						<ul id="navi_mypage" >
				        <li>
			                 <a href="#">⚙</a>
			                <ul>
			                    <li><a href="#">📅My여행플랜</a></li>
			                    <li><a href="#">📝My여행기</a></li>
			                    <li><a href="#">👨‍👩‍👦‍👦친구</a></li>
			                </ul>
				        </li>
				        </ul>
					</c:when>
					<c:otherwise>
						<a href="#">관리자페이지</a>
					</c:otherwise>
				</c:choose>	
				<a href="logout">로그아웃</a>
		        <p>${ loginUser.nickName }님 환영합니다!</p>
	   		</div>	
		</c:otherwise>
	</c:choose>
 
	    <div id="logotop">
	        <a href="index.jsp">아시아를 한눈에 하나로</a>
	    </div>
	    <div id="logolow">
	        <a href="index.jsp">아시<b>하</b>나</a>
	    </div>
	    <div id="menubar">
	        <ul id="navi">
	            <li>
	                <a href="#">살펴보기</a>
	                <ul>
	                    <li><a href="#">여행스토리</a></li>
	                    <li><a href="#">여행정보</a></li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">여행기</a>
	            </li>
	            <li>
	                <a href="#">여행플랜</a>
	            </li>
	            <li>
	                <a href="#">커뮤니티</a> 
	            </li>
	            <li>
	                <a href="customer">고객센터</a>
	                <ul>
	                    <li><a href="notice">공지사항</a></li>
	                    <li><a href="faq">FAQ</a></li>
	                    <li><a href="qnaList">Q & A</a></li>
	                </ul>
	            </li>
	        </ul>
	    </div>
	    
</body>
</html>