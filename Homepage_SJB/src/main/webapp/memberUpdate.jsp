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
        // TODO : 로그인된 사용자 아이디를 저장
        // TODO : form action="update.do" method="post" 생성
        // TODO : userid를 제외한 모든 정보 수정 가능하게 input 태그 작성
        //        userid는 읽기만 가능하도록 input 태그 생성
        
        String id = (String) session.getAttribute("userid");
        MemberVO member = (MemberVO) session.getAttribute("member");
        
        if (id == null) {
     	   out.print("<script>alert('회원 정보 검색에 실패했습니다!!');</script>");
            response.sendRedirect("memberUpdate.jsp");
      } else {
    %>
     <h2>회원 정보 수정하기</h2>
   <form action="update.do" method="post">
    <label for="userid">사용자 ID:</label>
    <input type="text" id="userid" name="userid" disabled value="<%=member.getUserid() %>" required><br><br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="emailAgree">이메일 수신 동의:</label>
    <input type="checkbox" id="emailAgree" name="emailAgree" value="agree"><br><br>
    
    <label for="interest">관심 분야:</label><br>
    <input type="checkbox" id="interest1" name="interest" value="서버 개발">
    <label for="interest1">서버 개발</label><br>
    <input type="checkbox" id="interest2" name="interest" value="서버 폭팔">
    <label for="interest2">서버 폭팔</label><br>
    <!-- 관심 분야가 여러 개일 경우에는 반복문을 사용하여 동적으로 생성할 수도 있습니다. --><br>
    
    <label for="phone">전화번호:</label>
    <input type="tel" id="phone" name="phone"><br><br>
    
    <label for="introduce">자기 소개:</label><br>
    <textarea id="introduce" name="introduce" rows="4" cols="50"></textarea><br><br>
    
    <input type="submit" value="회원정보 수정">
</form>

 <% } %>

</body>
</html>