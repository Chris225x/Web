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
       String fileName = (String) session.getAttribute("fileName");
    %>
            
    <img alt="이미지" src="../images/<%=fileName %>" width="200" height="200">
    <a href="../images/<%=fileName %>">링크</a>


</body>
</html>