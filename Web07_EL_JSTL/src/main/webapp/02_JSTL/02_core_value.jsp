<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core</title>
</head>
<body>
      <h2>JSTL Core 연습</h2>
      <c:set var="name1" value="도우너"></c:set>
      <p>name1의 값 : ${name1 }</p>
      <c:set var="name2" value="${name1 }" />
      <p>name2의 값 : ${name2 }</p>

      <c:out value="<script>alert('test');</script>"></c:out>       
      <p>name1의 값 : ${name1 }</p>
</body>
</html>