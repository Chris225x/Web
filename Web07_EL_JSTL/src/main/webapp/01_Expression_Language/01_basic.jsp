<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%--
       EL(Expression Language)
       - page, request, session, application 관련 데이터 출력 코드를
           간략하게 사용할 수 있는 표기법
       - 자바빈 컴퍼넌트를 쉽게 접근하게 도와줌
       - 집합 객체(list, String[])에 대한 접근 방법을 제공
       - 수치 연산, 관계 연산, 논리 연산자 제공
       - 표현 언어만의 기본 객체 제공(범위 객체)
       
       EL 기본 객체
       - pageContext : JSP의 page 기본 객체와 동일
       - pageScope : page 기본 객체에 저장된 속성의 <속성, 값>
           매핑을 저장한 Map 객체
       - requestScope : request 기본 객체에 저장된 속성의 <속성, 값>
         매핑을 저장한 Map 객체
       - sessionScope : session 기본 객체에 저장된 속성의 <속성, 값>
          매핑을 저장한 Map 객체
       - applicationScope : application 기본 객체에 저장된 <속성, 값>
          매핑을 저장한 Map 객체
       - param : 요청 파라미터의 <파라미터이름, 값> 매핑을 저장한 Map 객체,
            타입은 String (request.getParameterValues("파라미터이름")과 동일)
       - cookie : <쿠키이름, 쿠키값> 매핑을 저장한 Map 객체
            (request.getCookies()와 동일)
       - initParam : 초기화된 파라미터의 <파라미터이름, 값> 매핑을 저장한 Map 객체
           (application.getInitParameter("파라미터이름")과 동일)  

     --%>
     
     <%
        pageContext.setAttribute("num1", 1);
        request.setAttribute("num2", 2);
        session.setAttribute("num3", 3);
        application.setAttribute("num4", 4);
        
        // 기존 방식으로 값 출력
        int number1 = (Integer) pageContext.getAttribute("num1");
        int number2 = (Integer) request.getAttribute("num2");
        
        pageContext.setAttribute("scopeNum", 1);
        request.setAttribute("scopeNum", 1);
        session.setAttribute("scopeNum", 3);
        application.setAttribute("scopeNum", 4);
        
     %>
     <h1>변수 사용</h1>
     <p>JSP 변수의 합 : <%=number1 + number2 %></p>
     <p>page num1 : ${num1 }</p><%-- pageContext.getAttribute("num1") --%>
     <p>request num2 : ${num2 }</p> <%-- request.getAttribute("num2") --%>
     <p>session num3 : ${num3 }</p> <%-- session.getAttribute("num3") --%>
     <p>application num4 : ${num4 }</p> <%-- application.getAttribute("num4") --%>

      <h1>EL 범위 테스트</h1>
      <p>page scopeNum : ${scopeNum }</p>
      <p>request scopeNum : ${scopeNum }</p>
      <p>session scopeNum : ${scopeNum }</p>
      <p>application scopeNum : ${scopeNum }</p>


</body>
</html>