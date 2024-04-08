<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Date date = new Date();%>
<p>오늘 날짜 : <%=date.toString() %></p>
<p>${param.method }</p>
<p>${param.content }</p>