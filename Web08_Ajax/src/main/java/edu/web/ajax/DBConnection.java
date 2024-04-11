package edu.web.ajax;

public interface DBConnection {
	// DB 접속에 필요한 상수 정의
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String USER = "scott";
	public static final String PASSWORD = "tiger";
	
	// DB 테이블 컬럼 상수 정의
	public static final String TABLE_NAME = "SEARCH";
	public static final String COL_SNO = "SNO";
	public static final String COL_TITLE = "TITLE";
	
	// select * from SEARCH where title like ?
	public static final String SQL_SELECT_BY_TITLE = 
			"select " + COL_TITLE + " from " + TABLE_NAME +
			" where " + COL_TITLE + " like ?";
}