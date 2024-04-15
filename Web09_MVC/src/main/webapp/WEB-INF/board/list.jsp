<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="edu.web.domain.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, th, td {
	border-style: solid;
	border-width: 1px;
	text-align: center;
}

ul {
	list-style-type: none;
}

li {
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<h1>게시판 목록</h1>
	<table border="1">
		<tr>


			<th style="width: 60px">글 번호</th>
			<th style="width: 700px">제목</th>
			<th style="width: 700px">내용</th>
			<th style="width: 120px">작성자</th>
			<th style="width: 100px">작성일</th>
		</tr>
		<!-- 게시물 목록을 가져와서 테이블에 표시 -->
		<%
		// BoardVO 객체인 vo에서 게시물 목록을 가져옵니다.
		List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");

		if (boardList != null) {
			// 가져온 게시물 목록을 테이블에 출력
			for (BoardVO vo : boardList) {
		%>
		<tr>
			<td><%=vo.getBoardId()%></td>
			<td><a href="detail.do?boardId=<%=vo.getBoardId()%>"><%=vo.getBoardTitle()%></a></td>
			<td><%=vo.getBoardContent()%></td>
			<td><%=vo.getMemberId()%></td>
			<td><%=vo.getBoardDateCreated()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<!-- 등록 버튼 추가 -->
	<a href="register.do"><input type="button" value="글 작성"></a>

	<ul>
	     <c:if test="${pageMaker.hasPrev }">
	        <li><a href="list.do?page=${pageMaker.startPageNo-1 }">이전</a></li>
	     </c:if>
	    
		<c:forEach begin="${pageMaker.startPageNo }" end="${pageMaker.endPageNo }"
		var="num">
			<li><a href="list.do?page=${num }">${num }</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.hasNext }">
	        <li><a href="list.do?page=${pageMaker.endPageNo+1 }">다음</a></li>
	     </c:if>
	</ul>

</body>
</html>
