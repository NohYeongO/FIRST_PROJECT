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
    #insert-form{
        width:  700px;
        margin:  auto;
    }
    label{
        font-weight: bold;
    }
	#counter{
		color:#aaa;
        text-align: right;
        margin-bottom: 20px;
        line-height: 0%;
	}
</style>


</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div style="height: 80px;"></div>

    <form action="insertNotice" method="post" id="insert-form" enctype="multipart/form-data">
        <input type="hidden" name="noticeWriter" value="${sessionScope.loginUser.userNo}">

        <div class="form-group">
            <label for="usr">제목</label>
            <input type="text" class="form-control" id="usr" name="noticeTitle" required/>
            <input type="checkbox" name="noticeHold" id="noticeHold">
    		<label for="noticeHold">상단고정</label>
        </div>

        <div class="form-group">
            <label for="comment">내용</label>
            <textarea class="form-control" rows="19" id="comment" placeholder="1000자까지 입력가능합니다." 
            style="resize: none;" name="noticeContent" required></textarea>
        </div>

        <div id="counter">(0 / 1000)</div>

        <div class="form-group">
            <input type="file" name="noticeFile">
        </div>

        <div align="center" style="margin-top: 40px;">
            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">취소</button>
            <button type="submit" class="btn btn-sm btn-danger">등록</button>
        </div>
    </form>

    <script>
        $('#usr, textarea').on('keyup', function(e) {
            let str = $(this).val();
            let regExp = /[<>+_\-@#$%&*|\\;]/ig;
            
            if (regExp.test(str)) {
                alert('사용할 수 없는 특수 문자입니다.');
                str = str.replace(regExp, '');
                $(this).val(str);
            }
        });

        $('#comment').keyup(function(e) {
            let content = $('#comment').val();
            $('#counter').html("(" + content.length + " / 1000)");

            if (content.length > 1000) {
                alert("최대 1000자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 1000));
            }
        });
    </script>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>