<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, th, td{
  border-style : ${param.boardStyle};
  border-style : ${param.boardColor};
  border-width : 1px;
  font-size : ${param.fontSize}
  color : ${param.fontColor};

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2>${param.title }</h2>
  <table>
      <thead>
          <tr>
             <th>번호</th>
             <th>링크 주소</th>
             <th>비고</th>          
          </tr>
      </thead>
      <tbody>
            <% 
               String[] linkList = request.getParameterValues("link");     
            %>
            
            <% 
                for(int i = 0; i < linkList.length; i++) { 
            %>
               <tr>
                   <td><%=i + 1 %></td>
                   <td><a href="<%=linkList[i] %>"><%=linkList[i] %></a></td>
                   <td>-</td>
                   
               </tr>
               
            <%
                }
            %>
            
            
            
      </tbody>  
  </table>


</body>
</html>