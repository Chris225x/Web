<%@ page import="web.ch15.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
</head>
<body>
     <%
        // request 객체에서 getAttribute를 이용하여 board 데이터 참조
        // object로 보내는 이유 모든 class(부모) 다 모임 그리고 너네 맞게끔 변환하게 하기 위해서 다형성도 마찬가지
        // 그리고 형변환 해주면 됨
        BoardBean board = (BoardBean) request.getAttribute("board");
     %>

     <p>번호 : <%=board.getNo() %></p>
     <p>제목 : <%=board.getTitle() %></p>
     <p>제목 : <%=board.getWriter() %></p>
     <p>제목 : <%=board.getContent() %></p>
     <p>제목 : <%=board.getRegDate() %></p>
     
</body>
</html>