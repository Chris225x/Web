<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="edu.web.domain.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	BoardVO vo = (BoardVO) request.getAttribute("detailSelect");
	%>
	<h2>게시판</h2>

	<p>
		작성자 : <input type="text" name="memberId" value="<%=vo.getMemberId() %>" size=10
			maxlength=5 required>
	</p>
	<p>게시글 제목 :</p>
	<input type="text" name="boardTitle" value="<%=vo.getBoardTitle() %>"
		required>
	<p>게시글 내용 :</p>
	<textarea rows="4" cols="30" name="boardContent"
		required><%=vo.getBoardContent() %></textarea>

     <%-- 수정 및 삭제 버튼을 나란히 배치하기 위해 div 요소로 묶습니다. --%>
    <div>
        <%-- 수정 버튼 --%>
        <form action="update.do" method="get" style="display: inline;">
            <%-- 수정할 게시글의 ID를 hidden input 태그로 전송 --%>
            <input type="hidden" name="boardId" value="<%= vo.getBoardId() %>">
            <%-- 수정 버튼 --%>
            <input type="submit" value="수정">
        </form>

        <%-- 삭제 버튼 --%>
        <form action="delete.do" method="post" style="display: inline;">
            <%-- 삭제할 게시글의 ID를 hidden input 태그로 전송 --%>
            <input type="hidden" name="boardId" value="<%= vo.getBoardId() %>">
            <%-- 삭제 버튼 --%>
            <input type="submit" value="삭제">
        </form>
    </div>

</body>
</html>