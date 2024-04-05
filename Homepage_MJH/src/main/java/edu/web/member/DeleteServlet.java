package edu.web.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// TODO : memberResult.jsp에서 이동
//        로그인된 사용자 아이디를 가져와서 DB에 회원 정보 삭제
//        삭제 성공 후에 login.jsp 페이지로 이동

@WebServlet("/delete.do")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;  
	
 
    public DeleteServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		PrintWriter out = response.getWriter();
		
		if(userid != null) {
			int result = dao.delete(userid);		
			if(result == 1) {
				 // 삭제된 회원 정보를 세션에서 제거합니다.
		        session.removeAttribute("userid");
		        response.sendRedirect("login.jsp");
				//response.sendRedirect("/Homepage_MJH/login.jsp");			
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
