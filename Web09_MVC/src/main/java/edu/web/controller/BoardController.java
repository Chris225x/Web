package edu.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do") // *.do : ~.do로 선언된 HTTP 호출에 대한 반응
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardController() {
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String requestMethod = request.getMethod();
		System.out.println("호출 경로 : " + requestURI);
		System.out.println("호출 방식 : " + requestMethod);
		
		if(requestURI.contains("list.do")) {
			System.out.println("list 호출 확인");
		}
		
	}

}
