package com.web.zoomIn.bean;

import java.io.Serializable;
import java.util.Date;

public class BoardReplyBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -893371184959863000L;
	int reply_code;
	int board_code;
	String user_id;
	String reply_content;
	Date reply_date;
	String reply_date_toString;


	

	public int getReply_code() {
		return reply_code;
	}

	public void setReply_code(int reply_code) {
		this.reply_code = reply_code;
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

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	public String getReply_date_toString() {
		return reply_date_toString;
	}

	public void setReply_date_toString(String reply_date_toString) {
		this.reply_date_toString = reply_date_toString;
	}
}
