package edu.web.ajax;

import java.util.Arrays;

public class SearchVO {
	private String userid;
	private String title;
	
	public SearchVO() {

	}

	public SearchVO(String userid, String title) {
		super();
		this.userid = userid;
		this.title = title;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTktle() {
		return title;
	}

	public void setTktle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "SearchVO [userid=" + userid + ", title=" + title + "]";
	}
}
