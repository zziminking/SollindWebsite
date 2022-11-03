package com.soldesk.Sollind.home;

import java.math.BigDecimal;
import java.util.Date;

public class HomeBoard {
	private BigDecimal b_no;
	private String b_type;
	private String b_title;
	private String b_txt;
	private String b_m_id;
	private String b_date;
	private String b_img;
	private BigDecimal b_ddabong;
	
	public HomeBoard() {
		// TODO Auto-generated constructor stub
	}

	public HomeBoard(BigDecimal b_no, String b_type, String b_title, String b_txt, String b_m_id, String b_date,
			String b_img, BigDecimal b_ddabong) {
		super();
		this.b_no = b_no;
		this.b_type = b_type;
		this.b_title = b_title;
		this.b_txt = b_txt;
		this.b_m_id = b_m_id;
		this.b_date = b_date;
		this.b_img = b_img;
		this.b_ddabong = b_ddabong;
	}

	public BigDecimal getB_no() {
		return b_no;
	}

	public void setB_no(BigDecimal b_no) {
		this.b_no = b_no;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_txt() {
		return b_txt;
	}

	public void setB_txt(String b_txt) {
		this.b_txt = b_txt;
	}

	public String getB_m_id() {
		return b_m_id;
	}

	public void setB_m_id(String b_m_id) {
		this.b_m_id = b_m_id;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = Time.calculateTime(b_date);
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}

	public BigDecimal getB_ddabong() {
		return b_ddabong;
	}

	public void setB_ddabong(BigDecimal b_ddabong) {
		this.b_ddabong = b_ddabong;
	}
	
	
}
