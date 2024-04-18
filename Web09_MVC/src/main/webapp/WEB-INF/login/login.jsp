<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="login.go" method="POST">
		<input type="text" name="memberId" required autofocus><br>
		<input type="password" name="password" required><br>
		<input type="hidden" name="targetURL" value="${targetURL }">
		<input type="submit" value="로그인">
	</form>
</body>
</html>