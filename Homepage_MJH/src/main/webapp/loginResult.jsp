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
	// TODO : 세션을 이용 "userid, 환영합니다."라고 화면에 출력
    
    // TODO : 회원 정보 보기 버튼 생성
    // TODO : 로그아웃 버튼 생성
    // 세션을 이용하여 userid를 가져옴
        
	String userid = (String) session.getAttribute("userid");
	
	
	if (userid != null) {
	    // 로그인 되었을 때
	%>
	    <p><%=userid%>님, 환영합니다.</p>
	    <% out.print("<script>alert('로그인되었습니다!!');</script>"); %>
	    <button onclick="location.href='select.do'">회원정보</button>
	    <button onclick="location.href='logout.do'">로그아웃</button>
	    
	<%
	} else { 
	    // 로그인에 실패했을 때
		out.print("<script>alert('로그인에 실패했습니다!!');</script>");
		out.print("<script>location.href='login.jsp'</script>");
	}
	%>


	<!-- location.href로 이동하면 servlet에서 doGet()을 호출 
         ㄴ GET 방식으로 동작
         
      -->


</body>
</html>