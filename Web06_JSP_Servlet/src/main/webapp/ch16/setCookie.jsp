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
      // * 쿠키(Cookies)
      // - 웹 브라우저가 저장하는 데이터
      // - 필요한 정보를 클라이언트(웹 브라우저)에서 저장
      // - 다양한 정보 추적을 목적으로 데이터가 유지됨
      // - 주로 브라우저에서 사용자가 선택한 내용들을 저장
      // 쿠키는 내가 쿠폰을 들고있다 세션은 커피숍이 쿠폰을 들고 있다
      request.setCharacterEncoding("UTF-8");
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");
    
      // 피라미터 값으로 쿠키 생성
      Cookie firstNameCookie = new Cookie("firstName", firstName);
      Cookie lastNameCookie = new Cookie("lastName", lastName);
      
      // 만료 시간 설정(초단위) : 24시간
      firstNameCookie.setMaxAge(60 * 60 * 24); //60초 * 60 * 24
      lastNameCookie.setMaxAge(60 * 60 * 24);
      
      // response.header에 쿠키를 추가
      response.addCookie(firstNameCookie);
      response.addCookie(lastNameCookie);
      // Context Root에서 생성된 쿠키는
      // 이 프로젝트에서만 사용 됨
    	  
    
    %>


</body>
</html>