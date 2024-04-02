<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    // 만약 id가 "test"이고 pw가 "1234"이면 세션을 생성하고 HW3_login_result.jsp로 이동
    if ("test".equals(id) && "1234".equals(pw)) {

        session.setMaxInactiveInterval(60); // 세션 만료 시간 설정 (초 단위)
        session.setAttribute("id", id); // id 세션 생성
        session.setAttribute("pw", pw);
        out.print("<script>location.href='HW3_login_result.jsp'</script>");
    } else {
        // 아이디 또는 비밀번호가 일치하지 않을 경우 다시 로그인 페이지로 이동
    	out.print("<script>location.href='HW3.jsp'</script>");
    }
%>

  
</body>
</html>