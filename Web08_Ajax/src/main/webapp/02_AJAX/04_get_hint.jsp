
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	전송된 데이터가 
	만약 'a'로 시작하면 "apple"
	    'b'로 시작하면 "banana"
	    'c'로 시작하면 "coconut"
	그게 아니면 "not fruits"를 출력해라!

--%>
<%
	String str = request.getParameter("str");
	System.out.println(str);
	
	String result;
	
	if(str.charAt(0) == 'a') {
		result = "apple";
	} else if(str.charAt(0) == 'b') {
		result = "banana";
	} else if(str.charAt(0) == 'c') {
		result = "coconut";
	} else {
		result = "not fruits";
	}
	
%>
<%=result %>
<%--=result --%>


<%-- 
   <ul>
         <c:choose>
             <c:when test="${param.method == 'a'}">
                 <li>apple</li>
             </c:when>
             <c:when test="${param.method == 'b'}">
                 <li>banana</li>
             </c:when>
              <c:when test="${param.method == 'c'}">
                 <li>coconut</li>
             </c:when>
             <c:otherwise>
                 <li>not fruits</li>
             </c:otherwise>          
             </c:choose>  
     </ul> 
     --%>
