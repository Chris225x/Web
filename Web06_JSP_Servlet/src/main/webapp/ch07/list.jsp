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
         ArrayList<String> list = new ArrayList<>();
         list.add("둘리");
         list.add("도우너");
         list.add("고길동");
         list.add("토지");
      %>
      
      <ul>
           <li><%=list.get(0) %></li>
           <li><%=list.get(1) %></li>
           <li><%=list.get(2) %></li>
           <li><%=list.get(3) %></li>   
      </ul>

</body>
</html>