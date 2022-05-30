package com.web.zoomIn.bean;

import java.io.Serializable;

public class BoardBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4785285432004146831L;
	int board_code;
	String user_id;
	String board_title;
	String board_content;
	String board_date;
	int board_view;
	String board_file;
	String board_rearFile;
	int board_reply_count;
	

	public int getBoard_reply_count() {
		return board_reply_count;
	}


	public void setBoard_reply_count(int board_reply_count) {
		this.board_reply_count = board_reply_count;
	}


	public int getBoard_code() {
		return board_code;
	}


	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public int getBoard_view() {
		return board_view;
	}
	public void setBoard_view(int board_view) {
		this.board_view = board_view;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public String getBoard_rearFile() {
		return board_rearFile;
	}
	public void setBoard_rearFile(String board_rearFile) {
		this.board_rearFile = board_rearFile;
	}

	
	

}
