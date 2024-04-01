<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directive</title>
</head>
<body>
     <%-- header.jspf 파일을 include --%>
     
     <h1>include directive(지시자)</h1>
     <%@ include file="header.jspf" %>
     
     <div>
         <p>본문입니다.</p>   
     </div>
     
     <%@ include file="footer.jspf" %>
     <p><%=header %></p><%-- header.jspf 변수를 사용할 수 있음 --%>
     
     <%--
     * directive include 특징
     1. JSP 파일이 자바 파일로 바뀔 때 문서에 통합되어 컴파일(정적)
     2. 다수의 JSP 파일에서 선언한 변수들을,
     3. 포함되는 JSP 파일에서 선언한 변수들을,
         포함하는 JSP 파일에서 사용할 수 있음
      --%>

</body>
</html>