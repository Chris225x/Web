package edu.web.persistence;

public interface BoardQuery {
   public static final String TABLE_NAME = "BOARD";
   public static final String COL_BOARD_ID = "BOARD_ID";
   public static final String COL_BOARD_TITLE = "BOARD_TITLE";
   public static final String COL_BOARD_CONTENT = "BOARD_CONTENT";
   public static final String COL_MEMBER_ID = "MEMBER_ID";
   public static final String COL_BOARD_DATE_CREATED = "BOARD_DATE_CREATED";
   

	 // 게시글 등록
//   INSERT INTO BOARD VALUES
//   (BOARD_SEQ.NEXTVAL, 'TEST', 'TEST', 'TEST', SYSDATE)
   public static final String SQL_INSERT = 
		   "INSERT INTO " + TABLE_NAME + " VALUES "          
            + "(BOARD_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
    
   
    // 전체 게시글 조회
   // SELECT * FROM BOARD ORDER BY BOARD_ID DESC;
    public static final String SQL_SELECT_ALL = 
    		"SELECT * FROM " + TABLE_NAME +
    		" ORDER BY " + COL_BOARD_ID + " DESC";
    
    // 상세 게시글 조회
//    SELECT * FROM BOARD
//    WHERE BOARD_ID = 1;
    public static final String SQL_SELECT_BY_BOARD_ID = 
            "SELECT * FROM " + TABLE_NAME + " WHERE " 
             + COL_BOARD_ID + " = ?";
    
    // 상세 게시글 수정
//    UPDATE BOARD
//    SET
//    BOARD_TITLE = 'TEST1',
//    BOARD_CONTENT = 'TEST1',
//    BOARD_DATE_CREATED = SYSDATE
//    WHERE BOARD_ID = 1;
    public static final String SQL_UPDATE = 
    		"UPDATE " + TABLE_NAME + " SET "
            + COL_BOARD_TITLE + " = ?, " 
    		+ COL_BOARD_CONTENT + " = ?, "
    		+ COL_BOARD_DATE_CREATED + " = SYSDATE "
            + " WHERE " + COL_BOARD_ID + " = ?";
    
    // 상세 게시글 삭제
    // DELETE BOARD WHERE BOARD_ID = ?;
    public static final String SQL_DELETE = 
    		"DELETE " + TABLE_NAME +
            " WHERE " + COL_BOARD_ID + " = ?";
}
	
   
   

