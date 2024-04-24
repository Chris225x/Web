package edu.web.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



// TODO : memberRegister.jsp에서 전송된 데이터를 DB에 저장
// DB 저장 후에 login.jsp로 이동(심심하면 alert도 띄우기)

@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;   
 
    public RegisterServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/Homepage_MJH/memberRegister.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request에서 파라미터 값을 읽어옵니다.
	    String userid = request.getParameter("userid");
	    String password = request.getParameter("password");
	    String email = request.getParameter("email");
	    String emailAgree = request.getParameter("emailAgree");
	    String[] interest = request.getParameterValues("interest");
	    String phone = request.getParameter("phone");
	    String introduce = request.getParameter("introduce");
	    
	    // MemberVO 객체를 생성하고 파라미터 값을 설정합니다.
	    MemberVO member = new MemberVO(userid, password, email, emailAgree, interest, phone, introduce);
	    
	    // 이후에 MemberVO 객체를 이용하여 원하는 작업을 수행합니다.
	    int result = dao.insert(member);
	    System.out.println(result);
	    
	    response.sendRedirect("/Homepage_MJH/login.jsp");
	}

}
