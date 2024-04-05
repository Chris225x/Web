<%@ page import="edu.web.member.MemberVO"%>
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
        // TODO : 로그인된 사용자 아이디를 저장
        // TODO : form action="update.do" method="post" 생성
        // TODO : userid를 제외한 모든 정보 수정 가능하게 input 태그 작성
        //        userid는 읽기만 가능하도록 input 태그 생성
        
        String userid = (String) session.getAttribute("userid");
     
        
      
    %>
    
     <h2>회원 정보 수정</h2>
      <form action="update.do" method="post">
    	<p>아이디</p>
	    <input type="text" name="userid" value="<%=userid %>" readonly="readonly">
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