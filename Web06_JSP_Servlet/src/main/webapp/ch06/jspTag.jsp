<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspTag</title>
</head>
<body>
	<%-- Declaration(선언문) --%>
	<%!
	    public int add(int x, int y) {
		     return x + y;
	    }
	%>
	
	<%-- Scriptlet --%>
	<% 
	   // 지역 변수 선언 메소드 안에 for문안에만 쓸 수 있는 것
	   int result = add(20, 30);
	   
	   // JSP에서 출력 방법
	   // 1) 로그
       System.out.println("result = " + result);
	   
	   // 2) JspWriter 객체를 사용하여 응답(response)으로 출력
       out.write("<p>result = " + result + "</p>\r\n");
	   
	   // 3) Expression 사용
	%>
	
	<p>결과 = <%=result %></p>
	
	<%
	   Date date = new Date();
	%>
	
	<p><%=date %></p>
	
	
</body>
</html>