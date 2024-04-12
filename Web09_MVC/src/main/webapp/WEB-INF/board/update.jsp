<%@page import="edu.web.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>

		<%
		BoardVO vo = (BoardVO) request.getAttribute("detailSelect");
		%>
	<h2>게시글 수정</h2>
	<form action="update.do" method="post">
		<p>
			글 번호 : <input type="text" name="boardId" readonly
				value="<%=vo.getBoardId()%>" size=10 maxlength=5 required>
		</p>
		<p>게시글 제목 :</p>
		<input type="text" name="boardTitle" placeholder="제목 입력"
			required="required">
		<p>게시글 내용 :</p>
		<textarea rows="4" cols="30" name="boardContent" placeholder="내용 입력"
			required="required"></textarea>
		<br> <input type="submit" value="수정">
	</form>


</body>
</html>