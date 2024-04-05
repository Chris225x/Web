package edu.web.member;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/LoginSessionFilter")
public class LoginSessionFilter extends HttpFilter implements Filter {
       
 
    public LoginSessionFilter() {
       
    }

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request; 
        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("userid");
        if(userid == null) {
        	HttpServletResponse res = (HttpServletResponse) response;
        	res.sendRedirect("login.jsp");
        	return; // 필터 종료
        }
		
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
