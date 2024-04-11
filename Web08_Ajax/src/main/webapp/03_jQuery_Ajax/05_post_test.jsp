<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String name = request.getParameter("name");
   String city = request.getParameter("city");
   
   out.write("name : " + name + ", city : " + city);

%>