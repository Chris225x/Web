<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session test</title>
</head>
<body>
   <%
      
                     // 형 변환
      String userId = (String) session.getAttribute("userId"); // object 리턴
   
   %>
   
   <h2><%=userId %>님, 환영합니다.</h2>

</body>
</html>