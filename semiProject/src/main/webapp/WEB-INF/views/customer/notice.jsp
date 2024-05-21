<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #noticetext{
            margin: auto;
            width: 1000px;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-top: 50px;
            border-bottom: 1px solid rgba(75, 70, 70, 0.692);
        }
        #noticetext>p{
            margin: 0;
            margin-bottom: 20px;
        }


        #search{
            margin: auto;
            width: 800px;
            height: 100px;
            text-align: center;
            margin-top: 50px;
            background-color: rgb(247, 240, 233);
            border-radius: 15px;
        }
        #search>form{
            position: relative;
            top: 33%;
            height: 32px;
        }
        #select{
            height: 100%;
            width: 60px;
            text-align: center;
            border: 1px solid rgb(180, 108, 108);
            border-radius: 5px;
        }
        #select:focus{outline: none;}
        #searchText{
            height: 100%;
            width: 300px;
            border: 1px solid rgb(180, 108, 108);
            border-radius: 5px;
            box-sizing: border-box;
        }
        #searchText:focus{outline: none;}
        #search button{
            position: relative;
            top: 2px;
            right: 5px;
            height: 100%;
            width: 50px;
            border-radius: 5px;
            border: none;
            background-color: red;
            color: white;
            font-weight: bold;
        }
        #search button:active{
            box-shadow: 3px 3px 3px rgba(204, 96, 96, 0.5);
            position: relative;
            top:2px
        }

        
        .table{
            width: 1000px;
            margin: auto;
            text-align: center;
        }
        .noticeNo{
            width: 30%;
            border-left: none;
            border-right: none;
        }
        .title{
            width: 50%;
            border-left: none;
            border-right: none;
            padding-right: 120px;
        }
        .date{
            width: 20%;
            border-left: none;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th{
            border-bottom: 1px solid #b182827a;
            padding: 20px;
            background-color: rgb(247, 240, 233);
            border-radius: 5px;
            font-size: 15px;
        }
        td{
            border-bottom: 1px solid #b18282c4;
            padding: 15px;
            background-color: rgba(247, 240, 233, 0.253);
            font-size: 15px;
        }
        #insertNotice>button{
            border: none;
            background-color: red;
            width: 45px;
            height: 30px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
        }        
	    #buttonBox{
            width: 1000px;
            text-align: center;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        #backButton, #nextButton{
            width: 45px;
            height: 30px;
            background-color: red;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
        }
        .numButton{
            width: 30px;
            height: 30px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            font-size: 15px;
        }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div id="noticetext">
        <p>공지사항</p>
    </div>

    <div id="search">
        <form action="notice" method="get">
            <select name="select" id="select">
                <option value="title" selected>제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" id="searchText" name="keyword">
            <input type="hidden" name="currentPage" value="1">
            <button type="submit">검색</button>
        </form>
    </div>

    <div style="height: 70px;"></div>

    <table class="table">
        <thead>
            <tr>
                <th class="th noticeNo">번호</th>
                <th class="th title">제목</th>
                <th class="th date">등록일</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${ (empty noticeList) or ( pi.currentPage > pi.endPage )}">
                    <tr>
                        <td colspan="3" style="color: #ff52a0;">조회된 게시글이 없습니다.</td>
                    </tr>
                </c:when>
                <c:when test="${ (!empty noticeList) }">
                    <c:forEach var="notice" items="${ noticeList }">
                        <tr onmouseover="mouseIn(this);" onmouseout="mouseOut(this);">
                            <c:choose>
                                <c:when test="${ notice.noticeHold eq 'Y' }" >
                                    <td class="td noticeNo" style="color:red;"><input type="hidden" class="hiddenNo" value="${ notice.noticeNo }">[공지]</td>
                                    <td class="td title">${ notice.noticeTitle }</td>
                                    <td class="td date">${ notice.createDate }</td>
                                </c:when>
                                <c:otherwise>
                                    <td class="td noticeNo">${ notice.noticeNo }</td>
                                    <td class="td title">${ notice.noticeTitle }</td>
                                    <td class="td date">${ notice.createDate }</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
        </tbody>
    </table>
    
    <c:if test="${ sessionScope.loginUser ne null && sessionScope.loginUser.userId.equals('admin') }">
		<div id="insertNotice" style="text-align: right; margin-top: 40px; padding-right:20%">
			 <button>작성</button>
		</div>
	</c:if>
    

    <!-- 버튼 영역 -->
    <div id="buttonBox">
        <c:choose>
            <c:when test="${ pi.currentPage > pi.endPage or pi.currentPage < pi.startPage }"></c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${pi.currentPage > 1 && keyword != null }">
                        <button id="backButton" onclick="location.href='notice?currentPage=${ pi.currentPage - 1 }&select=${ select }&keyword=${keyword}'">이전</button>
                    </c:when>
                    <c:when test="${pi.currentPage > 1 && keyword == null }">
                        <button id="backButton" onclick="location.href='notice?currentPage=${ pi.currentPage - 1 }'">이전</button>
                    </c:when>
                </c:choose>
                <c:forEach var="i" begin="${pi.startPage}" end="${ pi.endPage}" step="1" >
                    <c:choose>
                        <c:when test="${ pi.currentPage eq i }">
                            <button class="numButton" style="background-color: rgba(243, 101, 91, 0.877); color:whitesmoke">${ i }</button>
                        </c:when>
                        <c:when test="${ i > 0 && keyword != null }">
                            <button class="numButton" onclick="location.href='notice?currentPage=${ i }&select=${select}&keyword=${keyword}'">${ i }</button>
                        </c:when>
                        <c:when test="${ i > 0 && keyword == null }">
                            <button class="numButton" onclick="location.href='notice?currentPage=${ i }'">${ i }</button>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${ pi.currentPage ne pi.getMaxPage() && keyword != null }">
                        <button id="backButton" onclick="location.href='notice?currentPage=${ pi.currentPage + 1 }&select=${ select }&keyword=${keyword}'">다음</button>
                    </c:when>
                    <c:when test="${ pi.currentPage ne pi.getMaxPage() && keyword == null }">
                        <button id="backButton" onclick="location.href='notice?currentPage=${ pi.currentPage + 1 }'">다음</button>
                    </c:when>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        function mouseIn(e){
            e.style.backgroundColor = 'lightgray';
        }
        
        function mouseOut(e){
            e.style.backgroundColor = 'rgba(247, 240, 233, 0.253)';
        }
        
		$('#insertNotice>button').click(function(){
			location.href='enrollNoticeForm';
		})
        
        $('.td').click(function(){
            let noticeNo;
            if($(this).hasClass('noticeNo')){
                noticeNo = $(this).text();
                if(noticeNo === '[공지]'){
                    noticeNo = $(this).children('.hiddenNo').val();
                }
            }
            else{
                noticeNo = $(this).siblings().eq(0).text();
                if(noticeNo === '[공지]'){
                    noticeNo = $(this).siblings().children('.hiddenNo').val();
                }
            }
            location.href='noticeDetail?noticeNo=' + noticeNo + '&currentPage=' + ${ pi.currentPage };
        })
        
        
        
        
        
    </script>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>