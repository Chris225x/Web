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

       <h2>로그인 페이지</h2>
    
    <form action="loginAuth.do" method="POST" >
     
      Id : <input type="text" name="userid" placeholder="아이디 입력"> <br>    
      Pw : <input type="password" name="password" placeholder="패스워드 입력"> <br><br>
       <input type="submit" value="로그인"><br>
    </form>

     <!-- memberRegister.jsp로 이동하는 링크 -->
     <br><br>
    <a href="memberRegister.jsp">회원가입</a>
</body>
</html>