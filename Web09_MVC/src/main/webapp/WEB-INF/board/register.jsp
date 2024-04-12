<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>
    <h3>게시글 작성</h3>
    <form action="register.do" method="post">
        <p>작성자 : <input type="text" name="memberId" placeholder="이름 입력" size=10 maxlength=5 required="required"></p>
        <p>게시글 제목 :</p>
	    <input type="text" name="boardTitle" placeholder="제목 입력" required="required">
        <p>게시글 내용 :</p>
        <textarea rows="4" cols="30" name="boardContent" placeholder="내용 입력" required="required"></textarea>
        <br>
        <input type="submit" value="등록">
    </form>
</body>
</html>
