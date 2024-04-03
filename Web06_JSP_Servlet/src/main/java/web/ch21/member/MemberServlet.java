package web.ch21.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/register.do") 
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;
    
    public MemberServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  // sendRedirect() : 특정 경로로 이동
	  // request는 소멸되기 때문에 데이터를 전송할 수 없음
	  // 데이터 이동할때 ch15 detailServlet 참고
	  response.sendRedirect("/Web06_JSP_Servlet/ch21/register.jsp");
	  // url 이동할때만 사용함
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
	    
	}


}
