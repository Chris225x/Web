package edu.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.domain.BoardVO;
import edu.web.persistence.BoardDAO;
import edu.web.persistence.BoardDAOImple;

@WebServlet("*.do") // *.do : ~.do로 선언된 HTTP 호출에 대한 반응
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String BOARD_URL = "WEB-INF/board/";
	private static final String MAIN = "index";
	private static final String LIST = "list";
	private static final String REGISTER = "register";
	private static final String DETAIL = "detail";
	private static final String UPDATE = "update";
	private static final String DELETE = "delete";
	private static final String EXTENSION = ".jsp";
	private static final String SERVER_EXTENSION = ".do";
	private static BoardDAO dao;
	// 유지보수 때문에 함

	public BoardController() {
		dao = BoardDAOImple.getInstance();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String requestMethod = request.getMethod();
		System.out.println("호출 경로 : " + requestURI);
		System.out.println("호출 방식 : " + requestMethod);

		if (requestURI.contains(LIST + SERVER_EXTENSION)) {
			System.out.println("list 호출 확인");
			list(request, response);
		} else if (requestURI.contains(REGISTER + SERVER_EXTENSION)) {
			System.out.println("register 호출 확인");
			if (requestMethod.equals("GET")) { // GET 방식(페이지 불러오기)
				registerGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST 방식(DB에 저장)
				registerPOST(request, response);
			}
		} else if (requestURI.contains(DETAIL + SERVER_EXTENSION)) {
			System.out.println("detail 호출 확인");
			detail(request, response);
		} else if (requestURI.contains(UPDATE + SERVER_EXTENSION)) {
			System.out.println("update 호출 확인");
			if (requestMethod.equals("GET")) {
				updateGET(request, response);
			} else if (requestMethod.equals("POST")) {
				updatePOST(request, response);
			}
		} else if (requestURI.contains(DELETE + SERVER_EXTENSION)) {
			System.out.println("delete 호출 확인");
			if (requestMethod.equals("POST")) {
				deletePOST(request, response);
			}
		}

	} // end service()

	// TODO : 전체 게시판 내용(list)을 DB에서 가져오고, 그 데이터를 list.jsp 페이지에 전송
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("list()");
		try {
			// BoardDAO를 사용하여 데이터베이스에서 게시물 목록을 가져옴
			List<BoardVO> boardList = dao.select();

			// 가져온 게시물 목록을 request에 속성으로 설정하여 list.jsp 페이지로 전송
			request.setAttribute("boardList", boardList);

			// list.jsp 페이지로 포워딩
			String path = BOARD_URL + LIST + EXTENSION;
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			// 예외 처리 코드 추가
			// 예외 발생 시 오류 페이지로 이동 또는 메시지 출력 등의 처리를 추가할 수 있습니다.
		}
	} // end list()

	// TODO : register.jsp 페이지 호출
	private void registerGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("registerGET()");
		String path = BOARD_URL + REGISTER + EXTENSION;
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	} // end registerGET()

	// TODO : register.jsp form으로 전송된 데이터를 DB 테이블에 등록
	// TODO : index.jsp로 이동
	private void registerPOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("registerPOST()");

		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String memberId = request.getParameter("memberId");

		BoardVO vo = new BoardVO(boardTitle, boardContent, memberId);
		System.out.println(vo);
		int result = dao.insert(vo);
		System.out.println(result);

		PrintWriter out = response.getWriter();
		if (result == 1) {

			String path = MAIN + EXTENSION; // 그리고 index는 board안에 없음
											// index로 보내줘야함 왜냐하면 index를 거치고 list.do로 가기 때문
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
	} // end registerPOST()

	// 게시글 상세 조회
	// TODO : DB 테이블에서 상세 조회 데이터를 가져와서, detail.jsp 페이지로 전송
	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("detail()");

		int boardId = Integer.parseInt(request.getParameter("boardId"));

		BoardVO detailSelect = dao.select(boardId);
		
		 System.out.println(detailSelect);

		if(detailSelect != null) {
		request.setAttribute("detailSelect", detailSelect);

		String path = BOARD_URL + DETAIL + EXTENSION;
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		}
	} // end detail()

	// TODO : DB 테이블에서 상세 조회한 게시글 데이터를 전송하고, update.jsp 페이지로 호출
	private void updateGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));

		BoardVO detailSelect = dao.select(boardId);

		System.out.println("updateGET()");
		request.setAttribute("detailSelect", detailSelect);
		String path = BOARD_URL + UPDATE + EXTENSION;
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	} // end updateGET()

	// TODO : update.jsp에서 전송된 수정할 데이터를 DB로 전송하여 테이블 수정 수행
	// TODO : 수정이 완료되면, detail.jsp로 이동(이동할 때 어떤 값을 전송해야 할 걸?)
	private void updatePOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("updatePOST()");
			
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		// 수정할 게시글의 ID를 요청 파라미터에서 가져옵니다.
	    int boardId = Integer.parseInt(request.getParameter("boardId"));
	       
		BoardVO vo = new BoardVO(boardId, boardTitle, boardContent);
		System.out.println(vo);
		
		int result = dao.update(vo);
		System.out.println(result);
		
		if (result == 1) {	
		String path = MAIN + EXTENSION; // 그리고 index는 board안에 없음
		// index로 보내줘야함 왜냐하면 index를 거치고 list.do로 가기 때문
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
		}
	} // end updatePOST()

	// TODO : 게시글 번호를 전송받아서, DB 테이블에서 데이터 삭제
	// TODO : 삭제가 완료되면, index.jsp로 이동
	private void deletePOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("deletePOST()");
		PrintWriter out = response.getWriter();
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		BoardVO delete = dao.select(boardId);
		if(delete != null) {
			int result = dao.delete(boardId);
			if(result == 1) {
				out.print("<script>alert('삭제 완료되었습니다!!'); location.href='index.jsp' </script>");
			}
		}

	} // end deletePOST()
}
