<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
#qnaMark {
	margin: auto;
	padding-top: 20px;
	height: 150px;
	width: 1000px;
	text-align: center;
	line-height: 100px;
	font-size: 30px;
	font-weight: bold;
	text-shadow: 2px 2px rgba(128, 128, 128, 0.541);
	border-bottom: 1px solid rgba(0, 0, 0, 0.208);
}

#qnaBox {
	height: auto;
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

#titleBox>P {
	margin-top: 20px;
}

#dateBox {
	height: 100px;
	text-align: right;
	padding-right: 30px;
}

#dateBox>p {
	margin-top: 2px;
	font-size: 15px;
	font-weight: bold;
	color: rgb(70, 68, 68);
}

#downloadBox {
	height: 50px;
	width: 700px;
	margin: auto;
	text-align: left;
	font-size: 15px;
	font-weight: 1000;
	line-height: 40px;
}

#qnaText {
	width: 700px;
	height: 400px;
	margin: auto;
	padding-top: 10px;
	border: 1px solid rgb(231, 225, 225);
	word-wrap: break-word;
}

#buttonBox {
	margin: auto;
	text-align: center;
	width: 100%;
	height: 100px;
	line-height: 100px;
}

#replyBox {
	margin: auto;
	width: 750px;
	height: 500px;
	max-height: 500px;
	overflow-y: auto;
	padding-bottom: 20px;
}

#replyBox::-webkit-scrollbar {
	width: 20px;
	height: 5px;
}

#replyBox::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, 0.090);
}

#replyText {
	width: 700px;
	height: 110px;
	margin: auto;
}

#replyText textarea {
	resize: none;
	width: 600px;
	height: 100%;
	box-sizing: border-box;
	border: 1px solid red;
	border-radius: 3px;
	font-size: 15px;
	font-weight: 400;
}

#replyText>button {
	width: 100px;
	height: 100%;
	float: right;
	background-color: red;
	border: none;
	color: white;
	font-size: 18px;
	font-weight: 1000;
	border-radius: 3px;
}

#reply:focus {
	outline: none;
}

#counter {
	font-size: 13px;
}

#replyLine {
	height: 30px;
	width: 700px;
	margin: auto;
	border-bottom: 0.5px solid rgba(0, 0, 0, 0.267);
	box-sizing: border-box;
}

#replySelect {
	width: 700px;
	height: 135px;
	margin: auto;
	box-sizing: border-box;
}

#replyAnswer {
	overflow-y: auto;
	max-height: 350px;
	padding-bottom: 20px;
}

.answer {
	width: 700px;
	margin: auto;
	height: 130px;
	box-sizing: border-box;
}

.answer a {
	position: relative;
	left: 90%;
	bottom: 50%;
	font-size: 12px;
	line-height: 100px;
	color: blue;
}

.answerTextBox {
	margin: auto;
	width: 700px;
	height: 100px;
	box-sizing: border-box;
	line-height: 70px;
	font-size: 15px;
	border-bottom: 0.5px solid rgba(0, 0, 0, 0.267);
	box-sizing: border-box;
}

.answer:last-child {
	margin-bottom: 0;
}

.answerName {
	font-size: 13px;
}

.answer a:hover {
	color: red;
}

.answerText {
	margin: auto;
	width: 650px;
	height: 100%;
	white-space: pre-wrap;
	line-height: 15px;
	overflow-y: auto;
}

.answerText::-webkit-scrollbar {
	width: 10px;
}

.answerText::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, 0.090);
}

.modal {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
}

.modal_overlay {
	background-color: rgba(0, 0, 0, 0.090);
	width: 100%;
	height: 100%;
}

.modal_content {
	background-color: white;
	padding: 50px 100px;
	text-align: center;
	box-shadow: 0 10px 20px rgba(201, 169, 169, 0.998), 0 6px 6px
		rgba(201, 169, 169, 0.998);
	border-radius: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

h4 {
	margin: 50;
	margin-bottom: 50px;
}

.modal_content>button {
	background-color: red;
	color: white;
	border: none;
	margin-left: 10px;
	width: 60px;
	height: 30px;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div id="qnaMark">
		<p>Q & A</p>
	</div>

	<div id="qnaBox">

		<div id="titleBox">
			<p>${ qna.qnaTitle }</p>
		</div>

		<div id="dateBox">
			<label style="font-size: 12px;">작성일</label>
			<p>${ qna.createDate }</p>
		</div>

		<div id="qnaText">
			<p>${ qna.qnaContent }</p>
		</div>

		<div id="downloadBox">
			<c:choose>
				<c:when test="${ qna.qnaFile ne null }">
					<label>첨부파일 / </label>
					<a download="${ qna.qnaFile.changeName }"
						href="${ qna.qnaFile.filePath}"> ${ qna.qnaFile.originName } </a>
				</c:when>
				<c:otherwise>
					<label>첨부파일 / </label>
					<a> 존재하는 파일이 없습니다.</a>
				</c:otherwise>
			</c:choose>
		</div>

		<c:set var="qnaUserNo" value="${ Integer.parseInt(qna.qnaWriter) }"></c:set>

		<div id="buttonBox">
			<button class="btn btn-sm btn-secondary" id="backbutton">목록</button>
			<c:choose>
				<c:when
					test="${ (sessionScope.loginUser ne null) and (sessionScope.loginUser.userNo eq qnaUserNo) }">
					<button class="btn btn-sm btn-danger" id="deleteButton">삭제</button>
					<button class="btn btn-sm btn-success" onclick="updateQna();">수정</button>
				</c:when>
			</c:choose>
		</div>

		<div class="modal">
			<div class="modal_overlay">
				<div class="modal_content">
					<h4>삭제 하시겠습니까?</h4>
					<button id="cancel">취소</button>
					<button onclick="deleteQna();">확인</button>
				</div>
			</div>
		</div>

		<div id="replyText">
			<c:choose>
				<c:when test="${ sessionScope.loginUser ne null }">
					<textarea name="reply" id="reply" cols="90" rows="8"></textarea>
					<button id="replyInsert">작 성</button>
					<button id="replyUpdate" style="display: none;">수 정</button>
					<div id="counter">(0 / 150)</div>
				</c:when>
				<c:otherwise>
					<textarea name="reply" cols="90" rows="8"
						style="font-size: 20px; color: lightgray; text-align: center; line-height: 100px"
						readonly>로그인 후 이용해주세요</textarea>
					<button id="replyInsert">작 성</button>
					<div id="counter">(0 / 150)</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div id="replyLine"></div>

		<div id="replyBox">
			<div id="replySelect"></div>
		</div>

	</div>


	<form action="" method="post" id="updatePostForm">
		<input type="hidden" name="qnaNo" value="${ qna.qnaNo }" />
	</form>

	<form action="" method="post" id="deletePostForm">
		<input type="hidden" name="qnaNo" value="${ qna.qnaNo }" /> <input
			type="hidden" name="qnaFileNo"
			value="${ (qna.qnaFile ne null) ? qna.qnaNo : 0}" />
	</form>


	<script>
    
        // comment 글자수 표시
        $('#reply').keyup(() => {
            let content = $('#reply').val();
            $('#counter').html("("+ content.length +" / 150)");
        
            if (content.length > 150){
                alert("최대 150자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 150));
            }
        });
        
        // 특수문자 방지
        $('textarea').on('keyup', function(e) {
            let str = $(this).val();
            let regExp = /[<>+_\-@#&|\\;]/ig;
            
            if(regExp.test(str)){
                alert('사용할 수 없는 특수 문자입니다.');
                str = str.replace(regExp, '');
                $(this).val(str);
            }
        })
        
        // 목록버튼 클릭시 이동
        $('#backbutton').on('click', () => {
            location.href="qnaList?currentPage=${currentPage}"
        });
        // 수정버튼 클릭시 이동
        function updateQna(){
            $('#updatePostForm').attr('action','updateQnaView').submit();
        }
        // 삭제버튼 클릭시 모달창 
        $('#deleteButton').on('click', () => {
            $('.modal').css('display', 'block'); 
        });
        // 모달 취소버튼 클릭시 모달없애기
        $('#cancel').on('click', () => {
            $('.modal').css('display', 'none');
        })
        // 모달 삭제 버튼 클릭시
        function deleteQna(){
            $('#deletePostForm').attr('action','deleteQna').submit();
        }
        // 댓글 수정 함수
        $(document).on('click', '#replyUpdate', function(){
            replyUpdate();
        })

        $(() => {
            selectReplyList();
        });
        
        function selectReplyList(){
        	
	        let nickName = '${ sessionScope.loginUser.nickName }';
	        
            $.ajax({
                url: 'replys/' + ${ qna.qnaNo },
                success: result => {
                         let resultStr = result.map(list => {
                            if(nickName === null){
                            	return '<div class="answer">'
	                                  +'<span class="answerName"><label style="color:red;">Name</label>' + " " + list.nickName  + '</span>'
	                                  +'<div class="answerTextBox"><pre class="answerText">' + list.replyComment + '</pre></div>'
	                                  +'</div>'
                            }
                            else if(nickName === list.nickName){
                            	return '<div class="answer">'
	                                  +'<input type="hidden" class="replyNo" value="'+ list.replyNo+'">'
	                                  +'<span class="answerName"><label style="color:red;">Name</label>' + " " + list.nickName  + '</span>'
	                                  +'<div class="answerTextBox"><pre class="answerText">' + list.replyComment + '</pre></div>'
	                                  +'<a class="replyUpdate">수정</a>  <a class="replyDelete">삭제</a>'
	                                  +'</div>';
                            }
                            else{
                            	return '<div class="answer">'
	                                  +'<span class="answerName"><label style="color:red;">Name</label>' + " " + list.nickName  + '</span>'
	                                  +'<div class="answerTextBox"><pre class="answerText">' + list.replyComment + '</pre></div>'
	                                  +'</div>';
                            	}
                            });
                    $('#replySelect').html(resultStr);
                }
            });
        };
        
        // 댓글 작성 버튼 클릭시
        
        $('#replyInsert').click( () => {
        	
            let qnaNo = ${ qna.qnaNo };
            let replyComment = $('#reply').val();
            let userNo = '${ sessionScope.loginUser.userNo}';
            let qnaStatus = '${ qna.qnaStatus }';
            
            if($('#reply').val() !== ''){
                $.ajax({
                    url: 'replys',
                    type: 'post',
                    data: {
                            qnaNo : qnaNo,
                            replyComment : replyComment,
                            replyWriter : (userNo === '') ? null : userNo,
                            qnaStatus : qnaStatus
                          },
                 success : result => {
                                if(result == 'success'){
                                    $('#reply').val('');
                                    selectReplyList();
                                }
                                else{
                                    alert('작성실패')
                                }
                 }  
                });
            }
            else{
                alert('작성할 댓글을 입력해주세요');
            }
            
        })
        
        // 댓글 수정 a태그 클릭 시
        
        $(document).on('click', '.replyUpdate', function() {
                let update = $(this).siblings('.answerTextBox').children('.answerText').text();
                let replyNo = $(this).closest('.answer').find('.replyNo').val();
                $('#reply').val(update);
                $('#reply').text(replyNo);
                $('#replyInsert').css('display','none');
                $('#replyUpdate').css('display', 'block');
        })
        
        // 댓글 수정 함수
        
        function replyUpdate(){
            
            let replyNo = $('#reply').text();
    		let replyComment = $('#reply').val();
    		
            if($('#reply').val().trim() !== ''){
	            $.ajax({
	                url:'replyUpdate',
	                type: 'post',
	                data: {
	                      replyNo: replyNo,
	                      replyComment : replyComment
	                      },
	                success : result => {
	                            if(result === 'success'){
	                                $('#reply').val('')
	                                $('#replyInsert').css('display','block');
	                                $('#replyUpdate').css('display', 'none');
	                                selectReplyList();
	                            }
	                            else{
	                                alert('수정 실패');    
	                            }
	                }
	            })
            }
            else{
                alert('수정할 문자를 입력해주세요')
            }
        }
        
        // 댓글 삭제 a태그 클릭 시
        
        $(document).on('click', '.replyDelete', function() {
            
            const replyNo = $(this).siblings('.replyNo').val();
            if(confirm('삭제를 원하시면 확인을 눌러주세요')){
                
                $.ajax({
                    url:'replyDelete',
                    type:'post',
                    data:{
                         	replyNo : replyNo
                         },
                    success : result => {
                                if(result == 'success'){
                                    alert('삭제완료');
                                    $('#replyInsert').css('display','block');
                                    $('#replyUpdate').css('display', 'none');
                                    $('#reply').val('')
                                    selectReplyList();
                                }
                                else{
                                    alert('삭제실패')
                                }
                               }
                })
            }
            
        });
        
    </script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>