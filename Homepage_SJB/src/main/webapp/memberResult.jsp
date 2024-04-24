<%@ page import="edu.web.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
     // TODO : 회원 정보 출력
     // TODO : 회원 수정 버튼 생성(경로 : memberUpdate.jsp)
     // TODO : 회원 탈퇴 버튼 생성(경로 : delete.do)
     // Ctrl + shift : import생성
     // 멤버 객체 가져옴
     
     String id = (String) session.getAttribute("userid");
     MemberVO member = (MemberVO) session.getAttribute("member");
     // String[] interests = (String[]) session.getAttribute("interest");
     
     if (id == null) {
    	   out.print("<script>alert('회원 정보 검색에 실패했습니다!!');</script>");
           response.sendRedirect("login.jsp");
     } else {
    	 
     
  %>

 <h2>회원 정보</h2>
    <label for="userid">사용자 ID:</label>
    <input type="text" id="userid" name="userid" value="<%=member.getUserid() %>" required><br><br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" value="<%=member.getPassword() %>" required><br><br>
    
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" value="<%=member.getEmail() %>" required><br><br>
    
    <label for="emailAgree">이메일 수신 동의:</label>
    <input type="checkbox" id="emailAgree" name="emailAgree" <%= member.getEmailAgree().equals("agree") ? "checked" : "" %> checked disabled value="agree"><br><br>
    
    <label for="interest">관심 분야:</label><br>
<%
    // 관심 분야 텍스트 입력란 생성
    if (member.getInterest() != null) {
        for (String interest : member.getInterest()) {
%>
       <input type="checkbox" id="interest1" name="interest" <%= interest.equals("서버 개발") ? "checked" : "" %>  disabled value="서버 개발">
       <label for="interest1">서버 개발</label><br>
       <input type="checkbox" id="interest2" name="interest" <%= interest.equals("서버 폭발") ? "checked" : "" %>  disabled value="서버 폭발">
       <label for="interest2">서버 폭팔</label><br>
       
        
<%
        }
    }
%>
    <!-- 관심 분야가 여러 개일 경우에는 반복문을 사용하여 동적으로 생성할 수도 있습니다. --><br>
    
    <label for="phone">전화번호:</label>
    <input type="tel" id="phone" name="phone" value="<%=member.getPhone() %>"><br><br>
    
    <label for="introduce">자기 소개:</label><br>
    <input id="introduce" name="introduce" value="<%=member.getIntroduce() %>"><br><br>
    
    <button onclick="location.href='update.do'">회원정보수정</button>
	<button onclick="location.href='delete.do'">회원탈퇴</button>
    <% } %>
  
</body>
</html>