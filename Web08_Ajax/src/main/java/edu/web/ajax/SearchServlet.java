package edu.web.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static SearchDAOImple dao;   

    public SearchServlet() {
    	dao = SearchDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		
		List<String> list = dao.select(keyword);
		System.out.println(list.toString());
		
		JSONArray jsonArray = new JSONArray();
		for(String title : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("title", title);
			jsonArray.add(jsonObject);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(jsonArray.toString());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
