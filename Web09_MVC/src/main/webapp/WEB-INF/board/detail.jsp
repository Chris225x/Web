<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="edu.web.domain.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js">
	
</script>
<title>Insert title here</title>
</head>
<body>
	<%
	BoardVO vo = (BoardVO) request.getAttribute("vo");
	%>
	<h2>게시판</h2>
	<a href="index.jsp"><input type="button" value="글 목록"></a>
    
                            
	<p>
		작성자 : <input type="text" name="memberId" value="<%=vo.getMemberId()%>"
			size=10 maxlength=5 required>
	</p>
	<p>게시글 제목 :</p>
	<input type="text" name="boardTitle" value="<%=vo.getBoardTitle()%>"
		required>
	<p>게시글 내용 :</p>
	<textarea rows="4" cols="30" name="boardContent" required><%=vo.getBoardContent()%></textarea>
	<br>

    <c:if test="${sessionScope.memberId == vo.memberId }"> <!-- if 문 쓰기 위해 import로 라이브러리(taglib) 해줘야 함 -->
        <%-- 수정 및 삭제 버튼을 나란히 배치하기 위해 div 요소로 묶습니다. --%>
	    <div>
		<%-- 수정 버튼 --%>
		<form action="update.do" method="get" style="display: inline;">
			<%-- 수정할 게시글의 ID를 hidden input 태그로 전송 --%>
			<input type="hidden" name="boardId" value="<%=vo.getBoardId()%>">
			<%-- 수정 버튼 --%>
			<input type="submit" value="수정">
		</form>

		<%-- 삭제 버튼 --%>
		<form action="delete.do" method="post" style="display: inline;">
			<%-- 삭제할 게시글의 ID를 hidden input 태그로 전송 --%>
			<input type="hidden" id="boardId" name="boardId"
				value="<%=vo.getBoardId()%>">
			<%-- 삭제 버튼 --%>
			<input type="submit" value="글 삭제">
		</form>
	</div>
    </c:if>
	
    <c:if test="${empty sessionScope.memberId }">
            * 댓글은 로그인이 필요한 서비스입니다.
            <a href="login.go">로그인하기</a>
    </c:if>

    <input type="hidden" id="boardId" name="boardId" value="<%=vo.getBoardId()%>">
    
    <c:if test="${not empty sessionScope.memberId }">
    ${sessionScope.memberId }님, 이제 댓글을 작성할 수 있어요!
	<div style="text-align: center;">
		<input type="text" id="memberId" value="${sessionScope.memberId }" readonly > 
		<input type="text" id="replyContent">
		<button id="btnAdd">작성</button>
	</div>
	<hr>
	<div style="text-align: center;">
		<div id="replies"></div>
	</div>
    </c:if>
    
	<div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			getAllReplies(); // 함수 호출 코드 추가
			
			$('#btnAdd').click(function(){
				let boardId = $('#boardId').val(); // 게시판 번호 데이터
				let memberId = $('#memberId').val(); // 작성자 데이터
				let replyContent = $('#replyContent').val(); // 댓글 내용
				let obj = {
						'boardId' : boardId,
						'memberId' : memberId,
						'replyContent' : replyContent
				};
				console.log(obj);
				
				// $.ajax로 송수신
				$.ajax({
					type : 'POST', 
					url : 'replies/add', 
					data : {'obj' : JSON.stringify(obj)}, // JSON으로 변환
					success : function(result) {
						console.log(result);
						if(result == 'success') {
							alert('댓글 입력 성공');
							getAllReplies(); // 함수 호출 코드 추가
						}
					}
				}); // end ajax()
			}); // end btnAdd.click()
			
			
			// 게시판 댓글 전체 가져오기
			function getAllReplies() {
				// 댓글을 가져오기 위해 boardId 필요
				let boardId = $('#boardId').val();
				
				// url에 boardId 전송
				let url = 'replies/all?boardId=' + boardId;
				
				// 가져올 데이터가 JSON이므로
				// getJSON으로 파싱하는게 편리함
				$.getJSON(
					url, 
					function(data) {
						// data : 서버에서 전송받은 list 데이터가 저장되어 있음.
						// getJSON()에서 json 데이터는
						// javascript object로 자동 parsing됨
						console.log(data); 
						
					    let memberId = $('#memberId').val();
					    console.log(memberId);
						// let memberId = "${sessionScope.memberId }"; // string 타입으로 변환 + 값을 가져오는 방식
						let list = ''; // 댓글 데이터를 HTML에 표현할 문자열 변수
						// $(컬렉션).each() : 컬렉션 데이터를 반복문으로 꺼내는 함수
						$(data).each(function(){
							// this : 컬렉션의 각 인덱스 데이터를 의미
							console.log(this); 
							
							// string을 date 타입으로 변경
							var replyDateCreated = new Date(this.replyDateCreated);
							let disabled = '';
							let readonly = '';
													
							if(memberId != this.memberId){
								// memberId == this.memberId
								// disabled = '';
								// readonly = '';
								disabled = 'disabled';
								readonly = 'readonly';
							}
							
							list += '<div class="reply_item">'
								+ '<pre>'
								+ '<input type="hidden" id="replyId" value="'+ this.replyId +'">' 
								+ this.memberId
								+ '&nbsp;&nbsp;' // 공백
								+ '<input type="text" id="replyContent" '+ readonly +' value="'+ this.replyContent +'">'
								+ '&nbsp;&nbsp;' // 공백
								+ replyDateCreated
								+ '&nbsp;&nbsp;' // 공백
								+ '<button class="btn_update" '+ disabled +'>수정</button>'
								+ '<button class="btn_delete" '+ disabled +'>삭제</button>'
								+ '</pre>'
								+ '</div>';
								
							 // 공백 열고 닫아줘야 if문으로 넘어갈 수 있음
							    
							//	if(memberId == this.memberId) {
								//  list += '<button class="btn_update" ' + disabled + '>수정</button>'
								//	+ '<button class="btn_delete" ' + disabled + '>삭제</button>';
								// }
											
							//	list += '</pre>'
							//	+ '</div>';
								
															
						}); // end each()
						
						$('#replies').html(list);
					}
				); // end getJSON
				
			} // end getAllReplies()
			
			// 수정 버튼을 클릭하면 선택된 댓글 수정
			// 댓글 수정
			$('#replies').on('click', '.reply_item .btn_update', function(){
				console.log(this);
				
				// 선택된 댓글의 replyId, replyContent 값을 저장
				// prevAll() : 선택된 노드 이전에 있는 모든 형제 노드를 접근
				var replyId = $(this).prevAll('#replyId').val();
				var replyContent = $(this).prevAll('#replyContent').val();
				console.log("선택된 댓글 번호 : " + replyId + ", 댓글 내용 : " + replyContent);
				
				// ajax로 데이터 전송하여
				// 댓글 수정 기능 수행하고
				// 수행 결과를 리턴하는 코드

				// ajax 요청
				$.ajax({
					type : 'POST', 
					url : 'replies/update', 
					data : {
						'replyId' : replyId,
						'replyContent' : replyContent
					}, 
					success : function(result) {
						console.log(result);
						if(result == 'success') {
							alert('댓글 수정 성공');
							getAllReplies(); // 함수 호출 코드 추가
						}
					}
				}); // end ajax()
				
			}); // end replies.on()
			
			// 댓글 삭제
			$('#replies').on('click', '.reply_item .btn_delete', function(){
				console.log(this);
				
				// 선택된 댓글의 replyId 값을 저장
				// prevAll() : 선택된 노드 이전에 있는 모든 형제 노드를 접근
				var replyId = $(this).prevAll('#replyId').val();
				console.log("선택된 댓글 번호 : " + replyId);
				
				// ajax로 데이터 전송하여
				// 댓글 삭제 기능 수행하고
				// 수행 결과를 리턴하는 코드

				// ajax 요청
				$.ajax({
					type : 'POST', 
					url : 'replies/delete', 
					data : {
						'replyId' : replyId,					
					}, 
					success : function(result) {
						console.log(result);
						if(result == 'success') {
							alert('댓글 삭제 성공');
							getAllReplies(); // 함수 호출 코드 추가
						}
					}
				}); // end ajax()
				
			}); // end replies.on()
			
		}); // end document 
	</script>

</body>
</html>