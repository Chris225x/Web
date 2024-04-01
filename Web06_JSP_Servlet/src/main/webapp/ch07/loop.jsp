<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table {
    font-family : arial, sans-serif;
    border-collapse : collapse;
    width : 100%;
}
td, th {
    border : 1px solid #dddddd;
    text-align : left;
    padding : 8px;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
			</tr>
		</thead>
    <tbody>
      <%for(int i = 0; i < 2; i++) {%>
     <tr>
          <td>test<%=i+1 %></td>
          <td>010-1111-222<%=i+1 %></td>
          <td>test<%=i+1 %>@test.com</td>

     </tr>
     <%} %>
   </tbody>
    </table>
 </body>
</html>