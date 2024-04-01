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
    // 저장된 id, pw 쿠키를 꺼내서
    // input 태그(id, pw)에 값 보여주기
    
    Cookie[] cookies =  request.getCookies(); // 데이터가 없으면 null값
    
    if(cookies != null) { // 쿠키가 존재하는 경우
 	   out.println("<h2>모든 쿠키의 이름과 값 찾기</h2>");
        for(Cookie cookie : cookies) {
     	    String id = request.getParameter("id");
     	    String pw = request.getParameter("pw");
        }
    } else {
 	   out.println("<h2>쿠키를 찾지 못했습니다.</h2>");
    }
  
  %>



   <form action="practiceResult.jsp" method="post">
     아이디<br>
     <input type="text" name="id"><br>
     비밀번호<br>
     <input type="password" name="pw"><br>
     <input type="checkbox" name="saveAgreed" value="agreed">
     아이디 저장<br><br>
     <input type="submit" value="로그인">
     </form>


</body>
</html>