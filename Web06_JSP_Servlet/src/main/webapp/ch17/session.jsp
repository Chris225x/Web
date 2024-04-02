<%@page import="java.util.Date"%>
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
        // session 객체 : session 범위에 존재하는 객체

        // 세션 생성 시간
        Date createTime = new Date(session.getCreationTime());
     
       // 이 웹페이지의 마지막 접속 시간
        Date lastAccessTime = new Date(session.getLastAccessedTime());
       
       // 세션 유지 시간 설정 방법1
       session.setMaxInactiveInterval(10); // 10초
       
       // 세션 유지 시간 설정 방법2
       // - web.xml 설정
       
       /* 
          <session-config>
          <session-timeout>10</session-timeout> // 분 단위
          </session-config>
          
       */
       
       // 세션에 키-값 저장하기
       session.setAttribute("userId", "운영자");
       
       %>
   
      <%--
      * HTTP 특성
      - stateless protocol : 통신이 끝나면 상태를 유지하지 않는 특성
      - 쿠키와 세션은 HTTP 특성이 아닌 연결 상태를 유지하기 위해 사용
      
      * 세션(session)
      - 쿠키를 기반으로 사용
      - 서버 측에서 테이터를 관리
      - 세션 ID를 부여하여 브라우저를 종료할 때까지 데이터를 유지
      - 세션 객체 : 사용자를 식별할 수 있는 방법을 제공
        ㄴ 사용자에 대한 정보 저장
      - 주의사항 : 세션을 현재 프로젝트에 실행되는 모든 웹 페이지에 적용됨
        따라서, 하나의 클라이언트에 세션을 많이 사용하면 충돌이 발생할 수 있음.
      - session 객체는 session의 메소드를 사용하면 생성됨.
        (예. session.setAttribute())
       --%>
   
    <h2>세션 아이디 : <%=session.getId() %></h2>
    <h2>세션 생성 시간 : <%=createTime %></h2>
    <h2>마지막 접속 시간 : <%=lastAccessTime %></h2>  
    <a href="sessionTest.jsp">sessionTest.jsp 페이지로 이동</a>

</body>
</html>