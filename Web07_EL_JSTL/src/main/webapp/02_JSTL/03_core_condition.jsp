<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL if</title>
</head>
<body>
     <%--
     * <c:if> 태그
     - 자바의 if문과 유사한 기능
     - <c:if test="조건">실행문</c:if>
      --%>
  
     <c:if test="true">
          <h2>항상 실행</h2>
     </c:if>
     <c:if test="false">
         <h2>실행 안됨</h2>
     </c:if>
     <c:if test="${param.name == 'test' }">
          <p>결과 값이 true</p>
     </c:if>
     
     <%--
     * <c:choose> 태그
     - 자바의 switch문과 if-else 문을 섞음    
      --%>
     
     <ul>
         <c:choose>
             <c:when test="${param.flag == 0}">
                 <li>파라미터 flag의 값은 0입니다.</li>
             </c:when>
             <c:when test="${param.flag == 1}">
                 <li>파라미터 flag의 값은 1입니다.</li>
             </c:when>
              <c:when test="${param.flag == 2}">
                 <li>파라미터 flag의 값은 2입니다.</li>
             </c:when>
             <c:otherwise>
                 <li>파라미터 flag의 값은 0, 1, 2 중에 입력하세요!</li>
             </c:otherwise>          
             </c:choose>  
     </ul> 
     
      
</body>
</html>