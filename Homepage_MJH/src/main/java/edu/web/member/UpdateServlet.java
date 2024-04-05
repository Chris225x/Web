package edu.web.member;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// TODO : memberUpdate.jsp에서 전송된 데이터로 DB 회원 정보 수정
//        회원 정보 수정에 성공하면 memberResult.jsp에 MemberVO 데이터 전송하여 출력
@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;    

    public UpdateServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.sendRedirect("/Homepage_MJH/memberUpdate.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // request에서 파라미터 값을 읽어옵니다.
		 HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid"); 	   
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String emailAgree = request.getParameter("emailAgree");
        String[] interest = request.getParameterValues("interest");
        String phone = request.getParameter("phone");
        String introduce = request.getParameter("introduce");

        // DB에서 기존 회원 정보를 가져옵니다.

        // DB에서 가져온 기존 회원 정보를 이용하여 새로운 MemberVO 객체를 생성합니다.
        MemberVO vo = new MemberVO(userid, password, email, emailAgree, interest, phone, introduce);
        System.out.println(vo);
        
        // MemberDAO를 통해 회원 정보를 업데이트합니다.
        int result = dao.update(vo);
        System.out.println(result);
        if (result == 1) {
             RequestDispatcher dispatcher =
        	        request.getRequestDispatcher("memberResult.jsp");
             request.setAttribute("vo", vo);
             dispatcher.forward(request, response);
          
        }
    }
}