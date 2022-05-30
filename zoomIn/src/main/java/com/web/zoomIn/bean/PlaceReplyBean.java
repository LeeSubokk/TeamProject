package com.web.zoomIn.bean;

import java.io.Serializable;
import java.util.Date;

public class PlaceReplyBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6854034291714884942L;
	int reply_code;
	int place_code;
	String user_id;
	String reply_content;
	Date reply_date;
	int reply_grade;
	String reply_date_toString;
	public int getReply_code() {
		return reply_code;
	}
	public void setReply_code(int reply_code) {
		this.reply_code = reply_code;
	}
	public int getPlace_code() {
		return place_code;
	}
	public void setPlace_code(int place_code) {
		this.place_code = place_code;
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
	public int getReply_grade() {
		return reply_grade;
	}
	public void setReply_grade(int reply_grade) {
		this.reply_grade = reply_grade;
	}
	public String getReply_date_toString() {
		return reply_date_toString;
	}
	public void setReply_date_toString(String reply_date_toString) {
		this.reply_date_toString = reply_date_toString;
	}
	
	
	
}
