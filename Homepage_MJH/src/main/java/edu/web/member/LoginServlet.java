package edu.web.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * TODO : login.jsp에서 입력받은 아이디, 패스워드를 DB의 데이터와 비교해서
 * 데이터가 일치하면 - 로그인 세션 생성 및 로그인 성공(loginResult.jsp)로 이동
 * (아이디 값에 대한 세션 생성, 세션 만료 시간 60초)
 * 데이터가 일치하지 않으면 - login.jsp로 이동(심심하면 실패 alert 띄우기)
 */

@WebServlet("/loginAuth.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;
	
    public LoginServlet() {
    	dao = MemberDAOImple.getInstance();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request에서 파라미터 값을 읽어옵니다. // servlet에서 세션 생성 그리고 웬만하면 post방식일때
	    String userid = request.getParameter("userid");
	    String password = request.getParameter("password");
		
	 // MemberVO 객체를 생성하고 파라미터 값을 설정합니다.
	    String confirmUserid = dao.select(userid, password);
	    System.out.println(confirmUserid);
	   	    
	    PrintWriter out = response.getWriter();
	    if (confirmUserid != null) {
	    	HttpSession session = request.getSession();
			System.out.println("로그인 성공");
			session.setAttribute("userid", confirmUserid);
			session.setMaxInactiveInterval(60); // 시간 선언 먼저 60초
			//request.getSession().setAttribute("userid", userid);
			out.print("<script>alert('로그인 성공.');</script>");
        	out.print("<script>location.href='loginResult.jsp';</script>");
			
		} else {
			out.print("<script>alert('아이디 비밀번호 확인해!');</script>");
        	out.print("<script>location.href='login.jsp';</script>");
		}
	    
		
	}

}
