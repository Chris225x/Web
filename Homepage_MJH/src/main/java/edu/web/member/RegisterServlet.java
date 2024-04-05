package edu.web.member;

import java.io.IOException;
import java.io.PrintWriter;

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
	private static final String CLASSNAME
 	= RegisterServlet.class.getName(); // 클래스 위치와 이름 참조
	private static MemberDAO dao; 
	
	
    public RegisterServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(CLASSNAME + " doGet()");
		// url로 접근할 경우(GET) 경로 변경
		response.sendRedirect("memberRegister.jsp");
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
	    MemberVO vo = new MemberVO(userid, password, email, emailAgree, interest, phone, introduce);
	    System.out.println(vo); // 로그 찍을때 택배오면 잘 왔나 확인
        int result = dao.insert(vo);
        System.out.println(result);
        
        // DB 저장에 성공하면 login.jsp 페이지에 데이터 전송
       
        //if(result == 1) {
        //	response.sendRedirect("login.jsp");
        	
       // }
        PrintWriter out = response.getWriter();
        if(result == 1) {
        	out.print("<script>alert('등록 성공! 로그인 해주세요.');</script>");
        	out.print("<script>location.href='login.jsp';</script>");
        }
	    	    
	}

}