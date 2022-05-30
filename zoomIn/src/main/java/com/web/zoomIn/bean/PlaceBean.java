package com.web.zoomIn.bean;

import java.io.Serializable;

public class PlaceBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7415526957070137505L;
	private int place_code;
	private String place_name;
	private String place_address;
	private String place_tell;
	private String place_business_hours;
	private String category_name;
	private int place_view;
	private double place_grade_avg;
	private int place_reply_count;
	private String place_description;
	
	
	


	public String getPlace_description() {
		return place_description;
	}

	public void setPlace_description(String place_description) {
		this.place_description = place_description;
	}

	public int getPlace_reply_count() {
		return place_reply_count;
	}

	public void setPlace_reply_count(int place_reply_count) {
		this.place_reply_count = place_reply_count;
	}

	public double getPlace_grade_avg() {
		return place_grade_avg;
	}

	public void setPlace_grade_avg(double place_grade_avg) {
		this.place_grade_avg = place_grade_avg;
	}

	public int getPlace_view() {
		return place_view;
	}

	public void setPlace_view(int place_view) {
		this.place_view = place_view;
	}

	public int getPlace_code() {
		return place_code;
	}

	public void setPlace_code(int place_code) {
		this.place_code = place_code;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getPlace_address() {
		return place_address;
	}

	public void setPlace_address(String place_address) {
		this.place_address = place_address;
	}

	public String getPlace_tell() {
		return place_tell;
	}

	public void setPlace_tell(String place_tell) {
		this.place_tell = place_tell;
	}

	public String getPlace_business_hours() {
		return place_business_hours;
	}

	public void setPlace_business_hours(String place_business_hours) {
		this.place_business_hours = place_business_hours;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	
}
