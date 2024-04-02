<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--  3. 로그인 결과 페이지(HW3_login_result.jsp)
   - 세션에서 id 값을 꺼내서 HTML 태그에 출력
   - 만약, 로그인을 하지 않고 url로 접속할 경우 '로그인 해주세요!!'라고 alert를 띄우고
     HW3.jsp 페이지로 이동
   - alert 띄우는 코드
     - out.print("<script>alert('로그인 해주세요!!');</script>");;      --%>
     
       <%
      
                     // 형 변환
      String id = (String) session.getAttribute("id"); // object 리턴
   
   
   
   if(id == null) {
      out.print("<script>alert('로그인 해주세요!!');</script>");
      out.print("<script>location.href='HW3.jsp'</script>");
   } else { %>
   <h2><%=id %>님, 환영합니다.</h2>
    <form action="HW3_logout.jsp" method="post">
    <input type="submit" value="로그아웃">
    </form>
   <% }    
   %> 
   
    



</body>
</html>