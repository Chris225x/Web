<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
   <!-- url 경로가 register인 servlet으로 데이터를 전송하는 JSP -->
   <!-- action="register" : 
        현재 jsp 파일의 위치는 ch15/member
        register 경로는 /ch15/member/register 경로로 인식
        -->
   <form action="register" method="POST">
      <p>아이디</p>
      <!-- input name : request parameter의 name -->
      <input type="text" name="userId" placeholder="아이디 입력"
         required="required">    
      <p>패스워드</p>
      <input type="password" name="password" placeholder="비밀번호 입력"
         required="required">    
      <p>이메일</p>
      <input type="email" name="email" placeholder="이메일 입력"
         required="required">    
      <p>이메일 수신여부</p>
      <input type="radio" name="emailAgree" value="yes">예     <input
         type="radio" name="emailAgree" value="no" checked="checked">아니오         
      <p>자기소개</p>

      <textarea rows="4" cols="30" name="introduce" placeholder="자기소개 입력"
         required="required"></textarea><br>
         <input type="submit" value="전송">
   </form>

</body>
</html>





