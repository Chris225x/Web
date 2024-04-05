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

@WebFilter("/CharFilter")
public class CharFilter extends HttpFilter implements Filter {
       
    public CharFilter() {

    }


	public void destroy() {

	}

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) 
			throws IOException, ServletException {
         req.setCharacterEncoding("UTF-8");
         res.setCharacterEncoding("UTF-8");
         res.setContentType("text/html; charset=UTF-8");
         
         chain.doFilter(req, res);
		
		
		//super.doFilter(req, res, chain);
	}


	public void init(FilterConfig fConfig) throws ServletException {

	}

}
