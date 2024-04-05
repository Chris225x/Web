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
		// TODO : 회원 가입 form 생성. action="register.do" method="post"
	%>
	
	<h2>회원 가입하기</h2>
  	<form action="register.do" method="post">
    	<p>아이디</p>
	    <input type="text" name="userid" placeholder="아이디 입력" required="required">
	    <p>패스워드</p>
	    <input type="password" name="password" placeholder="비밀번호 입력" required="required">
	    <p>이메일</p>
	    <input type="email" name="email" placeholder="이메일 입력" required="required">
	    <p>이메일 수신여부</p>
	    <input type="radio" name="emailAgree" value="y">예
	    <input type="radio" name="emailAgree" value="n" checked="checked">아니오
	    
	    <p>관심사항</p>
	    <input type="checkbox" name="interest" value="IT">IT/인터넷
	    <input type="checkbox" name="interest" value="movie">영화
	    <input type="checkbox" name="interest" value="music">음악
	    <input type="checkbox" name="interest" value="book">책
	    <input type="checkbox" name="interest" value="food">음식    
	    
	    <p>핸드폰</p>
	    <input type="text" name="phone" placeholder="번호 입력" required="required">
	    
	    <p>자기소개</p>
	    <textarea rows="4" cols="30" name="introduce" placeholder="자기소개 입력" required="required"></textarea>
	    <br>
	    <input type="submit" value="전송" >
  	</form>

</body>
</html>