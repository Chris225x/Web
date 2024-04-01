package edu.web.homework;

import java.util.Date;

public class BoardVO {
     private int boardId;
     private String boardTitle;
     private String boardid;
     private Date boardRegDate;
     
     
     public BoardVO() {
    	 super();
    	 // TODO Auto-generated constructor stub
     }


	public BoardVO(int boardId, String boardTitle, String boardid2, Date boardRegDate) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		boardid = boardid2;
		this.boardRegDate = boardRegDate;
	}


	public int getBoardId() {
		return boardId;
	}


	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardid() {
		return boardid;
	}


	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}


	public Date getBoardRegDate() {
		return boardRegDate;
	}


	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}


	@Override
	public String toString() {
		return "BoardVO [boardId=" + boardId + ", boardTitle=" + boardTitle + ", boardid=" + boardid + ", boardRegDate="
				+ boardRegDate + "]";
	}
     
}


