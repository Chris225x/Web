package web.ch15.board;

import java.util.Date;

// 게시글 데이터(번호, 제목, 작성자, 작성일)를 전송하기 위한 Bean 클래스
public class BoardBean {
    private int no; // 번호
    private String title; // 제목
    private String writer; // 작성자
    private String content; // 내용
    private Date regDate; // 작성일
    
    // 기본 생성자
    public BoardBean() {}

	// getter/setter
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
    
    
  
}
