package com.web.zoomIn.bean;

import java.io.Serializable;

public class PlaceKeywordBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9152130012503947052L;
	private int place_keyword_code;
	private int place_code;
	private String keyword_content;
	
	public int getPlace_code() {
		return place_code;
	}
	public void setPlace_code(int place_code) {
		this.place_code = place_code;
	}
	public String getKeyword_content() {
		return keyword_content;
	}
	public void setKeyword_content(String keyword_content) {
		this.keyword_content = keyword_content;
	}
	public int getPlace_keyword_code() {
		return place_keyword_code;
	}
	public void setPlace_keyword_code(int place_keyword_code) {
		this.place_keyword_code = place_keyword_code;
	}
	

}
