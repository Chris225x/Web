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
   1. 로그인 정보 전송 페이지(HW3.jsp)
   - <form action="HW4_login_auth.jsp" method="post">
   - id, pw input 태그 생성
   
   2. 로그인 인증 페이지(HW3_login_auth.jsp)
   - 전송받은 id, pw를 확인하며 id는 "test", pw는 "1234"일 경우
     id 세션을 생성(만료 시간은 자유롭게 설정)
   - 세션을 생성한 이후에 HW3_login_result.jsp 페이지로 이동
   - 페이지 이동 코드
   - out.print("<script>location.href="HW3_login_result.jsp'</script>");
   - 전송받은 id, pw가 "test", "1234"가 아닌 경우, HW3.jsp 페이지로 이동

   3. 로그인 결과 페이지(HW3_login_result.jsp)
   - 세션에서 id 값을 꺼내서 HTML 태그에 출력
   - 만약, 로그인을 하지 않고 url로 접속할 경우 '로그인 해주세요!!'라고 alert를 띄우고
     HW3.jsp 페이지로 이동
   - alert 띄우는 코드
     - out.print("<script>alert('로그인 해주세요!!");</script>");      
   
   --%>
  <h2>로그인 정보 전송 페이지</h2>
    
    <form action="HW3_login_auth.jsp" method="POST" >
     
      Id : <input type="text" name="id" placeholder="아이디 입력"> <br>    
      Pw : <input type="password" name="pw" placeholder="패스워드 입력"> <br><br>
       <input type="submit" value="전송"><br>
    </form>



</body>
</html>