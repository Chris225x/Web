package edu.web.ajax;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.OracleDriver;

public class SearchDAOImple implements DBConnection {
	private static SearchDAOImple instance = null;
	
	private SearchDAOImple() {

	}
	
	public static SearchDAOImple getInstance() {
		if (instance == null) {
			instance = new SearchDAOImple();
		}
		return instance;
	}
	
	public List<String> select(String keyword) {
		System.out.println("select() 호출");
		List<String> list = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			DriverManager.registerDriver(new OracleDriver());
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_SELECT_BY_TITLE);
			pstmt.setString(1, "%" + keyword + "%");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString(COL_TITLE);
				System.out.println(title);
				list.add(title);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
}













