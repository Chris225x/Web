<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 등록 확인</title>
</head>
<body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="member" class="edu.web.homework.MemberVO" />
    <jsp:setProperty property="*" name="member" />
    <%-- 
    <%
       String interest = null;
       if(member.getInterest() == null) {
    	   interest = "";
       } else {
    	   interest = String.join(",", member.getInterest());
       }
    
    %>
    --%>
    
    
    <p>아이디 : <%=member.getUserid() %> </p>
    <p>패스워드 : <%=member.getPassword() %> </p>
    <p>이메일 : <%=member.getEmail() %> </p>
    <p>이메일 수신여부 : <%=member.getEmailAgree() %> </p>
    <p>관심사항 : </p>
    <%-- <%= interest %> --%>
       <% String[] interest = member.getInterest(); 
         if (interest == null) {
    	 %>      
    	  <p> 관심 없음 </p>     
    	 <% 
    	} else {  %>     
        <% for (int i = 0; i < member.getInterest().length; i++) { %>
            <p><%= member.getInterest()[i] %></p>
        <% } %>
       <% }
         %>
       
    <%-- <%= member.getInterest() == null ? "관심없음" : "관심사항 : " + String.join("<br> 관심사항 : ", member.getInterest()) %><br> --%>
   
   <%-- 관심사항 : <%
   for(String interest: member.getInterest()) {
      out.println("[" + interest + "] ");
   } %> <br> --%>
   
   <%-- <% String[] interests = member.getInterest();
         if(interests == null){    %>
         <p>관심사항 :<%= " 관심없음 "  %></p>
      <%} else {
      for(String interest: interests){ %>
      <p>관심사항 : <%= interest %></p>
            <%}} %> --%>
            
   <%-- 관심사항 : <%
   String interests[] = member.getInterest();
   for(String interest: interests) {
      out.println("[" + interest + "] ");
   } %> <br> --%>
       
    <p>핸드폰 : <%=member.getPhone() %> </p>
    <p>자기소개 : <%=member.getIntroduce() %> </p>
    
</body>
</html>