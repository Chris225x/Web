<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="point" class="edu.web.el01.Point" />
    <jsp:setProperty property="x" name="point" value="0.0"/>
    <jsp:setProperty property="y" name="point" value="0.0"/>
    <p>point의 x, y  좌표값 : ${point.x } ${point.y }</p>
    <p>point의 x, y  좌표값 : ${pageScope.point.x }, ${pageScope.point.y }</p>

    <%-- el 메소드 표기 --%>
    <p>좌표 거리 : ${point.distance(0, 2) }</p>
    <p>좌표 출력 : ${point.toString() }</p>

</body>
</html>