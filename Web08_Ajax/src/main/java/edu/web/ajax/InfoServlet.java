package edu.web.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


// 클라이언트로 JSON 데이터 전송
@WebServlet("/info.do")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InfoServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// * json 라이브러리 다운로드
		// https://code.google.com/archive/p/json-simple/downloads
		
		String userid = "test";
		String password = "1234";
		String email = "test@test.com";
		
		// JSON Array 객체 생성
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < 4; i++) {
			// JSON 객체 생성
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("userid", userid);
			jsonObject.put("password", password);
			jsonObject.put("email", email);	
			jsonArray.add(jsonObject);
		}
		
		// JSON 객체 전송
		response.getWriter().append(jsonArray.toString());
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
