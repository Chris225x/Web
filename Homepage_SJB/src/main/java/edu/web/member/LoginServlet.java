package edu.web.member;

import java.io.IOException;
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
		response.sendRedirect("/Homepage_MJH/loginResult.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request에서 파라미터 값을 읽어옵니다.
	    String userid = request.getParameter("userid");
	    String password = request.getParameter("password");
		
	 // MemberVO 객체를 생성하고 파라미터 값을 설정합니다.
	    MemberVO member = new MemberVO(userid, password);
	    
	 // 이후에 MemberVO 객체를 이용하여 원하는 작업을 수행합니다.
	    boolean result = dao.login(userid, password);
	    System.out.println(userid);
	    System.out.println(password);
	    
	    HttpSession session = request.getSession();
	    
	    if (result == true) {
			System.out.println("로그인 성공");
			session.setMaxInactiveInterval(60); // 시간 선언 먼저 60초
			session.setAttribute("userid", userid);
			//request.getSession().setAttribute("userid", userid);
			response.sendRedirect("/Homepage_MJH/loginResult.jsp");
			
		} else {
			System.out.println("로그인 실패");
			response.sendRedirect("/Homepage_MJH/login.jsp");
		}
	    
		
	}

}
