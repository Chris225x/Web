<%@page import="java.util.Date"%>
<%@page import="edu.web.homework.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	ArrayList<BoardVO> list = new ArrayList<>();
	
	// 게시글 데이터 5개를 list에 추가
	list.add(new BoardVO(1, "test1", "mok", new Date()));
	list.add(new BoardVO(2, "test1", "mok", new Date()));
	list.add(new BoardVO(3, "test1", "mok", new Date()));
	list.add(new BoardVO(4, "test1", "mok", new Date()));
	list.add(new BoardVO(5, "test1", "mok", new Date()));
	
	// 게시글 데이터 5개를 list에 추가
	%>

	<!-- table을 생성하여 5개의 게시글 출력 -->
	<table>
	   <thead>
	       <tr>
	          <th>번호</th>
	          <th>제목</th>
	          <th>작성자</th>
	          <th>작성일</th>
	       </tr>   
	   </thead>	   
	   <tbody>
	        <% for(int i = 0; i < list.size(); i++) {%>
	        <tr>
	            <td><%=list.get(i).getBoardId() %></td>
	            <td><%=list.get(i).getBoardTitle() %></td>
	            <td><%=list.get(i).getBoardid() %></td>
	            <td><%=list.get(i).getBoardRegDate() %></td>       
	               
	        </tr>	                
	        <% } %>
	   </tbody>  	
	</table>
</body>
</html>