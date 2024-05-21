<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      #content{
            width: 1000px;
            height: 800px;
            margin: auto;
        }
        #content >p{
            height: 4%;
            margin: 0;
            padding-left: 8%;
            padding-top: 10px;
            font-weight: bold;
            font-size: 20px;
            text-shadow: 2px 2px rgba(128, 128, 128, 0.411);
        }
        #noticeBoard{
            width: 950px;
            margin: auto;
            height: 50%;
            border: 2px solid rgba(201, 134, 134, 0.486);
            margin-top: 10px;
            border-radius: 15px;
            background-color: #FDF5E6;
        }
        #noticeAll{
            width: 800px;
            margin: auto;
            height: 20%;
            border-bottom: 1px solid rgba(201, 134, 134, 0.486);
            z-index: 1;
        }
        #first{
            width: 800px;
            margin: auto;
            height: 20%;
            border-bottom: 1px solid rgba(201, 134, 134, 0.486);
        }
        #firstNotice{
            padding-top: 30px;
            font-size: 20px;
            font-weight: bold;
        }
        #first>a{
            position: relative;
            font-size: 20px;
            font-weight: bold;
            left: 97%;
            bottom: 20%;
        }
        .noticeContent{
            position: relative;
            left: 18%;
            text-decoration: none;
            font-size: 23px;
            color: black;
        }
        .noticeContent:hover{
            color:red;
        }
        .noticePlus{
            position: absolute;
            left: 75%;
            padding-top: 10px;
            text-decoration: none;
            color:rgb(75,70,70);
        }
        .noticePlus:hover{
            color:red;
        }
        #second{
            width: 800px;
            margin: auto;
            height: 20%;
            border-bottom: 1px solid rgba(201, 134, 134, 0.486);
        }
        #secondNotice{
            padding-top: 30px;
            font-size: 20px;
            font-weight: bold;
        }
        #second>a{
            position: relative;
            font-size: 20px;
            font-weight: bold;
            left: 97%;
            bottom: 20%;
        }
        #third{
            width: 800px;
            margin: auto;
            height: 20%;
            border-bottom: 1px solid rgba(201, 134, 134, 0.486);
        }
        #thirdNotice{
            padding-top: 30px;
            font-size: 20px;
            font-weight: bold;
        }
        #third>a{
            position: relative;
            font-size: 20px;
            font-weight: bold;
            left: 97%;
            bottom: 20%;
        }
        #noticeAll>a{
            position: relative;
            left: 92%;
            top: 2%;
            font-size: 13px;
            font-weight: bold;
            color: rgb(85, 83, 83);
        }
        #noticeAll > a:hover{
            color:red;
        }
        #noticeAll>p{
            position: relative;
            top: 28%;
            left: 4%;
            font-weight: bold;
            font-size: 22px;
        }


        #boardAll{
            width: 950px;
            height: 40%;
            margin: auto;
            margin-top: 10px;
            border-radius: 15px;
            display: flex;
        }

        #faq{
            width: 50%;
            height: 100%;
            border-radius: 15px;
            border: 2px solid rgba(201, 134, 134, 0.486);
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiayndm_86vVBmOwCboChpKAExjeTrjW9i7kZnJnFJEuIJ6o0qaxNO8s6o_7uyrLp4tsw&usqp=CAU');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            background-color: #FDF5E6;
            box-sizing: border-box;
        }
        #faq>button{
            position: relative;
            top:2%;
            left: 85%;
            border: none;
            width: 60px;
            height: 30px;
            background-color: #FF5A5A;
            font-weight: bold;
            color: white;
            border-radius: 10px;
        }
        #qa{
            width: 50%;
            height: 100%;
            border-radius: 15px;
            border: 2px solid rgba(201, 134, 134, 0.486);
            background-image: url('data:image/png;base64,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');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            background-color: #FDF5E6;
            box-sizing: border-box;
        }
        #qa>button{
            position: relative;
            top:2%;
            left: 85%;
            border: none;
            width: 60px;
            height: 30px;
            background-color: #FF5A5A;
            font-weight: bold;
            color: white;
            border-radius: 10px;
        }
        button:active{
            box-shadow: 3px 3px 3px rgba(204, 96, 96, 0.5);
            position: relative;
            top:2px
        }
        #contentLine{
            height: 1%;
        }
</style>
</head>
<body>
   
    <jsp:include page="../common/header.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
   
   <div id="content">
        <p>고객센터</p>
        
        <div id="noticeBoard">
        
            <div id="noticeAll" class="notice">
                <p>공지사항</p>
                <a href="notice">더보기</a>
            </div>
            
            
            <div id="first" class="notice">
                <c:choose>
                	<c:when test="${ noticeList[0] ne null }">
		                <div id="firstNotice">
		                    <label>아시하나 소식</label>
		                    <a href="noticeDetail?noticeNo=${ noticeList[0].noticeNo }" class="noticeContent detail">${ noticeList[0].noticeTitle }</a>
		                </div>
		                    <a href="noticeDetail?noticeNo=${ noticeList[0].noticeNo }" class="noticePlus detailPlus">+</a>
                	</c:when>
                	<c:otherwise>
	                	<label>공지사항이 존재하지 않습니다.</label>
                	</c:otherwise>
                </c:choose>
            </div>
            <div id="second" class="notice">
             	<c:choose>
                	<c:when test="${ noticeList[1] ne null }">
		                <div id="firstNotice">
		                    <label>아시하나 소식</label>
		                    <a href="noticeDetail?noticeNo=${ noticeList[1].noticeNo }" class="noticeContent detail">${ noticeList[1].noticeTitle }</a>
		                </div>
		                    <a href="noticeDetail?noticeNo=${ noticeList[1].noticeNo }" class="noticePlus detailPlus">+</a>
                	</c:when>
                	<c:otherwise>
	                	<label>공지사항이 존재하지 않습니다.</label>
                	</c:otherwise>
                </c:choose>
            </div>
            <div id="third" class="notice">
            	<c:choose>
                	<c:when test="${ noticeList[2] ne null }">
		                <div id="firstNotice">
		                    <label>아시하나 소식</label>
		                    <a href="noticeDetail?noticeNo=${ noticeList[2].noticeNo }" class="noticeContent detail">${ noticeList[2].noticeTitle }</a>
		                </div>
		                    <a href="noticeDetail?noticeNo=${ noticeList[2].noticeNo }&currentPage=1" class="noticePlus detailPlus">+</a>
                	</c:when>
                	<c:otherwise>
	                	<label>공지사항이 존재하지 않습니다.</label>
                	</c:otherwise>
                </c:choose>
            </div>
            
        </div>
        
        <div id="contentLine"></div>
        
        <div id="boardAll">
            <div id="faq">
                <button onclick="faq();">GO</button>
            </div>
            
            <div id="qa">
                <button onclick="qa();">GO</button>
            </div>
        </div>
        
    </div>
      
      <script>
      
		    $('.detail').click(function(){
		  		
		  		let noticeNo = $(this).text();
		  		
		  	})
	      
	      	function faq(){
	      		location.href = "${ path }/faq.customer";
	      	}
	      	function qa(){
	      		location.href = "qnaList";
	      	}
      	
      </script>
      
      
      
      
	<jsp:include page="../common/footer.jsp"/>




</body>
</html>