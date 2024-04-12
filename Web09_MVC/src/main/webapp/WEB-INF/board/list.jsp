<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.web.domain.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
</head>
<body>
    <h1>게시판 목록</h1>
    <table border="1">
        <tr>
            <th>글 번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <!-- 게시물 목록을 가져와서 테이블에 표시 -->
        <% 
            // BoardVO 객체인 vo에서 게시물 목록을 가져옵니다.
            List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
            
            if(boardList != null) {
            // 가져온 게시물 목록을 테이블에 출력
            for (BoardVO vo : boardList) {
        %>
            <tr>
                <td><%= vo.getBoardId() %></td>
                <td><a href="detail.do?boardId=<%= vo.getBoardId() %>"><%= vo.getBoardTitle() %></a></td>
                <td><%= vo.getBoardContent() %></td>
                <td><%= vo.getMemberId() %></td>
                <td><%= vo.getBoardDateCreated() %></td>
            </tr>
        <% }
            }
        %>
    </table>
    <!-- 등록 버튼 추가 -->
    <a href="register.do">등록</a>
</body>
</html>
