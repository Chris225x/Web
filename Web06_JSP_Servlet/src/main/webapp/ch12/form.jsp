<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
</head>
<body>
     <h2>이름/나이 입력</h2>
     <!-- GET 방식으로 result.jsp에 데이터를 전송 -->
     <form action="result.jsp" method="get">
         <p>이름</p>
         <input type="text" name="name" placeholder="이름 입력">
         <p>나이</p>
         <input type="number"  name="age" placeholder="나이 입력">
         <br><br>
         <input type="submit" value="전송">
     </form>
     <!-- 
     input name="parameter 이름" : 전송할 데이터를 인식하는 parameter 이름
     input value="값" : 전송할 값
     -->
     
     
</body>
</html>