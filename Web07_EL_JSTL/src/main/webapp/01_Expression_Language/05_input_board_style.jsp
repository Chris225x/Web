<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
p {
  font-size: 150%;
}
select {
  font-size: 100%;
  width : 250px;
  height: 50px;
}
</style>
<meta charset="UTF-8">
<title>EL 예제</title>
</head>
<body>
  <h1>게시판 생성기</h1>
  <form action="05_result.jsp">
    <p>타이틀 입력</p>
    <input type="text" name="title">
    <hr>
    <p>게시판 글자색</p>
    <select name="fontColor">
      <option>글자색 선택</option>
      <option value="lightgreen" style="color : lightgreen;">lightgreen</option>
      <option value="lightblue" style="color : lightblue;">lightblue</option>
      <option value="purple" style="color : purple;">purple</option>
    </select>
    
    <hr>
    <p>게시판 글자 크기</p>
    <select name="fontSize">
      <option>글자 크기 선택</option>
      <option value="100%" style="font-size: 100%">100%</option>
      <option value="150%" style="font-size: 150%">150%</option>
      <option value="200%" style="font-size: 200%">200%</option>
    </select>
    
    <hr>
    <p>게시판 경계선 모양</p>
    <select name="boardStyle">
      <option>경계선 모양 선택</option>
      <option value="double">double</option>
      <option value="dashed">dashed</option>
      <option value="dotted">dotted</option>
    </select>
    
    <hr> 
    <p>게시판 경계선 색</p>
    <select name="boardColor">
      <option>경계선 색 선택</option>
      <option value="red" style="font-size: 300%; color : red">------ (red)</option>
      <option value="blue" style="font-size: 300%; color : blue">------ (blue)</option>
      <option value="green" style="font-size: 300%; color : green">------ (green)</option>
    </select>
    
    <hr>
    <p>링크</p>
    <input type="checkbox" name="link" value="01_basic.jsp">basic.jsp
    <input type="checkbox" name="link" value="02_operator.jsp">operator.jsp
    <input type="checkbox" name="link" value="03_parameter.jsp">parameter.jsp
    
    <hr>
    <input type="submit" value="전송">
  </form>
</body>
</html>














