<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입하기</title>
</head>
<body>
   <h2>회원 가입하기</h2>
   <form action="../register.do" method="post">
    <label for="userid">사용자 ID:</label>
    <input type="text" id="userid" name="userid" required><br><br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="emailAgree">이메일 수신 동의:</label>
    <input type="checkbox" id="emailAgree" name="emailAgree" value="agree"><br><br>
    
    <label for="interest">관심 분야:</label><br>
    <input type="checkbox" id="interest1" name="interest" value="서버 개발">
    <label for="interest1">서버 개발</label><br>
    <input type="checkbox" id="interest2" name="interest" value="서버 폭팔">
    <label for="interest2">서버 폭팔</label><br>
    <!-- 관심 분야가 여러 개일 경우에는 반복문을 사용하여 동적으로 생성할 수도 있습니다. --><br>
    
    <label for="phone">전화번호:</label>
    <input type="tel" id="phone" name="phone"><br><br>
    
    <label for="introduce">자기 소개:</label><br>
    <textarea id="introduce" name="introduce" rows="4" cols="50"></textarea><br><br>
    
    <input type="submit" value="제출">
</form>
   
   
   
</body>
</html>