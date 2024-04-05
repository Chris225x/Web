package edu.web.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// TODO : loginResult.jsp에서 이동
// 로그인된 사용자의 정보를 DB에서 select
// select된 MemberVO 데이터를 memberResult.jsp로 전송
@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;   
	 
    public SelectServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request에서 파라미터 값을 읽어옵니다.
		// String userid = (String) session.getAttribute("userid");
	    
	   HttpSession session = request.getSession();
	   String userid = (String) session.getAttribute("userid"); 
	   // 이미 세션에 있는 것을 가지고 와야함 
	    if (userid != null) {
	        System.out.println("아이디 확인 성공!");
	        
	        // MemberDAO를 통해 DB에서 회원 정보를 가져옵니다.
	        MemberVO vo = dao.select(userid);
	        System.out.println(vo);
	        
	        RequestDispatcher dispatcher =
	        		request.getRequestDispatcher("memberResult.jsp");
	        request.setAttribute("vo", vo);
            dispatcher.forward(request, response);
	        } 
	    }
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
