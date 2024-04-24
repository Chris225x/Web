package edu.web.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleDriver;

public class MemberDAOImple implements MemberDAO, DBConnection {
	private static MemberDAOImple instance = null;

	public static MemberDAOImple getInstance() {
		if (instance == null) {
			instance = new MemberDAOImple();
		}
		return instance;
	}

	@Override
	public int insert(MemberVO vo) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			DriverManager.registerDriver(new OracleDriver());
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");
			pstmt = conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getEmailAgree());
			pstmt.setString(5, vo.getInterestJoin());
			pstmt.setString(6, vo.getPhone());
			pstmt.setString(7, vo.getIntroduce());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	@Override
	public boolean login(String userid, String password) {
		boolean loggedIn = false; // 로그인 상태를 나타내는 boolean 변수
		// 사용자가 로그인하지 않았기 때문에 false로 초기화
		// 로그인에 성공하면 true로 바뀜

		Connection conn = null; // 데이터베이스 연결을 위한 Connection 객체
		PreparedStatement pstmt = null; // SQL 문을 실행하기 위한 PreparedStatement 객체
		ResultSet rs = null; // 쿼리 결과를 저장하기 위한 ResultSet 객체

		try {
        // 3. Oracle JDBC 드라이버를 메모리에 로드
			DriverManager.registerDriver(new OracleDriver());
			System.out.println("드라이버 로드 성공");

         // 4. DB와 Connection(연결)을 맺음
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");

         // 5. Connection 객체를 사용하여 PreparedStatement 객체를 생성
			pstmt = conn.prepareStatement(SQL_LOGIN);
        // SQL 문을 실행할 PreparedStatement 객체 생성 이미 생성함

         // 6. PreparedStatement 객체 생성 및 값 설정
			pstmt.setString(1, userid);
			pstmt.setString(2, password);

         // 7. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery(); // SQL 문을 실행하고 결과를 ResultSet에 저장
			loggedIn = rs.next(); // 결과가 있으면 로그인 성공
			boolean result = loggedIn;

			if (result == true) {
				System.out.println("로그인 성공");
			} else {
				System.out.println("로그인 실패");
			}

		} catch (SQLException e) { // SQL 예외 처리
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
		} finally {
			try {
        // 8. 자원 해제
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) { // 자원 해제 중 예외 처리
				e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			}
		}

		return loggedIn; // 로그인 상태를 반환
	}

	@Override
	public MemberVO select(String userid) {
		MemberVO vo = new MemberVO();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 드라이버 로드
			DriverManager.registerDriver(new OracleDriver());
			System.out.println("드라이버 로드 성공");

			// DB 연결
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");

			// 5. Connection 객체를 사용하여 Statement 객체를 생성
			pstmt = conn.prepareStatement(SQL_SELECT_BY_USERID);

			// 6. SQL 문장 작성 ?가 하나이고 검색할 것만 하면 되니 하나만 있으면 됨
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			// 결과 처리
			if (rs.next()) {
			    userid = rs.getString(1);
				String password = rs.getString(2);
				String email = rs.getString(3);
				String emailAgree = rs.getString(4);
				String[] interests = rs.getString(5).split(","); // 예를 들어, 쉼표(,)로 구분된 문자열을 배열로 분할
				String phone = rs.getString(6);
				String introduce = rs.getString(7);
				vo = new MemberVO(userid, password, email, emailAgree, interests, phone, introduce);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return vo;
	}

	@Override
	public int delete(String userid) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		// PreparedStatement : 매개변수를 갖고 있는 SQL 문장을 활용하기 위한 클래스
//		Statement와 상속 관계
		try {
			// 3. Oracle JDBC 드라이버를 메모리에 로드
			DriverManager.registerDriver(new OracleDriver());
			System.out.println("드라이버 로드 성공");

			// 4. DB와 Connection(연결)을 맺음
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");

			// 5. Connection 객체를 사용하여 PreparedStatement 객체를 생성
			pstmt = conn.prepareStatement(SQL_DELETE);

			// 6. SQL 문장 완성 - SQL_INSERT 쿼리의 ?를 채워주는 코드
			pstmt.setString(1, userid);

			// 7. SQL 문장 실행(DB 서버로 SQL 전송)
			result = pstmt.executeUpdate();

			// 8. DB 서버가 보낸 결과 확인/처리
			System.out.println(result + "행이 삭제됐습니다.");

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result; // 성공 : 1 , 실패 : 0
	}

	@Override
	public int update(String userid, MemberVO vo) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		// PreparedStatement : 매개변수를 갖고 있는 SQL 문장을 활용하기 위한 클래스
		// Statement와 상속 관계
		try {
			// 3. Oracle JDBC 드라이버를 메모리에 로드
			DriverManager.registerDriver(new OracleDriver());
			System.out.println("드라이버 로드 성공");

			// 4. DB와 Connection(연결)을 맺음
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("DB 연결 성공");

			// 5. Connection 객체를 사용하여 PreparedStatement 객체를 생성

			System.out.println("정보 수정 중");

			pstmt = conn.prepareStatement(SQL_UPDATE);

			// 6. SQL 문장 완성 - SQL_INSERT 쿼리의 ?를 채워주는 코드
			// 업데이트된 데이터를 기반으로 평균값 다시 계산
			// insert 메서드와 update 메서드에서 데이터를 데이터베이스에 삽입하거나 업데이트하기 전에
//			평균값을 다시 계산하고 GradeVO 객체에 설정합니다.
//			 그리고 쿼리 실행 전에 vo.getAvg()를 사용하여 계산된 평균값을 데이터베이스에 저장합니다.

			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getEmailAgree());
			pstmt.setString(4, vo.getInterestJoin());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getIntroduce());
			pstmt.setString(7, userid);
			// 7. SQL 문장 실행(DB 서버로 SQL 전송)
			result = pstmt.executeUpdate();
					
			// 8. DB 서버가 보낸 결과 확인/처리
			System.out.println(result + "행이 수정됐습니다.");

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result; // 그냥 변환이 되었는지 아닌지만 판단하기 때문에 성공했으면 1 아니면 0
	}
}
