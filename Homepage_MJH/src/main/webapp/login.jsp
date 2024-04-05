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
        // TODO : <a> 태그를 이용하여 memberRegister.jsp 이동 링크 생성
        // TODO : 로그인 form 생성. action="/loginAuth.do" method="post"
     %>

    <a href="memberRegister.jsp">회원가입</a>
    <h1>로그인</h1>
    <form action="loginAuth.do" method="post">
        아이디<br><input type="text" name="userid" required="required"><br>
        비밀번호<br><input type="password" name="password" required="required"> <br>
        <input type="submit" value="로그인">
    </form>
    
    
</body>
</html>