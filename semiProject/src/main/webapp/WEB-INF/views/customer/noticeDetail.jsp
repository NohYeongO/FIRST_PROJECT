<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
    #noticeMark {
        margin: auto;
        height: 150px;
        width: 1000px;
        text-align: center;
        line-height: 140px;
        font-size: 30px;
        font-weight: bold;
        text-shadow: 2px 2px rgba(128, 128, 128, 0.541);
        border-bottom: 1px solid rgba(0, 0, 0, 0.208);
    }

    #noticeBox {
        height: 850px;
        width: 1000px;
        margin: auto;
        border-radius: 5px;
    }

    #titleBox {
        height: 50px;
        width: 100%;
        border-bottom: 1px solid rgba(0, 0, 0, 0.208);
        text-align: center;
        font-size: 20px;
        font-weight: 800;
    }

    #titleBox > p {
        margin-top: 20px;
    }

    #dateBox {
        height: 100px;
        text-align: right;
        padding-right: 30px;
    }

    #dateBox > p {
        margin-top: 2px;
        font-size: 15px;
        font-weight: bold;
        color: rgb(70, 68, 68);
    }

    #imageBox {
        height: 400px;
        width: 500px;
        margin: auto;
        text-align: center;
        border: 1px solid rgba(0, 0, 0, 0.493);
    }

    img {
        width: 100%;
        height: 100%;
    }

    #noticeText {
        width: 500px;
        height: 200px;
        margin: auto;
        padding-top: 50px;
        word-wrap: break-word;
    }

    #buttonBox {
        margin: auto;
        text-align: center;
        width: 100%;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div id="noticeMark">
        <p>공지사항</p>
    </div>

    <div id="noticeBox">
        <div id="titleBox">
            <p>${noticeDetail.noticeTitle}</p>
        </div>

        <div id="dateBox">
            <label style="font-size: 12px;">작성일</label>
            <p>${noticeDetail.createDate}</p>
        </div>

        <c:choose>
            <c:when test="${noticeFile ne null}">
                <div id="imageBox">
                    <img src="resources/notice/${ noticeFile.changeName }" alt="공지사항 이미지">
                </div>
            </c:when>
            <c:otherwise>
                <div id="imageBox" style="border:none;"></div>
            </c:otherwise>
        </c:choose>

        <div id="noticeText">
            <p>${noticeDetail.noticeContent}</p>
        </div>

        <div id="buttonBox">
            <c:choose>
                <c:when test="${(sessionScope.loginUser ne null) and (sessionScope.loginUser eq 'admin')}">
                    <button class="btn btn-sm btn-danger" onclick="noticeUpdate();">수정</button>
                    <button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        function noticeBack() {
            location.href='notice?currentPage=${currentPage}';
        }
        
        function noticeUpdate() {
            location.href='noticeUpdateForm?noticeNo=${noticeDetail.noticeNo}';
        }
    </script>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>