package com.soldesk.Sollind.company;

import java.math.BigDecimal;
import java.util.Date;

public class CompanyReview {
	private BigDecimal cr_no;
	private BigDecimal cr_score;
	private BigDecimal cr_c_no;
	private String cr_title;
	private String cr_advantage;
	private String cr_weakness;
	private String cr_m_id;
	private Date cr_date;

	public CompanyReview() {
		// TODO Auto-generated constructor stub
	}

	public CompanyReview(BigDecimal cr_no, BigDecimal cr_score, BigDecimal cr_c_no, String cr_title,
			String cr_advantage, String cr_weakness, String cr_m_id, Date cr_date) {
		super();
		this.cr_no = cr_no;
		this.cr_score = cr_score;
		this.cr_c_no = cr_c_no;
		this.cr_title = cr_title;
		this.cr_advantage = cr_advantage;
		this.cr_weakness = cr_weakness;
		this.cr_m_id = cr_m_id;
		this.cr_date = cr_date;
	}

	public BigDecimal getCr_no() {
		return cr_no;
	}

	public void setCr_no(BigDecimal cr_no) {
		this.cr_no = cr_no;
	}

	public BigDecimal getCr_score() {
		return cr_score;
	}

	public void setCr_score(BigDecimal cr_score) {
		this.cr_score = cr_score;
	}

	public BigDecimal getCr_c_no() {
		return cr_c_no;
	}

	public void setCr_c_no(BigDecimal cr_c_no) {
		this.cr_c_no = cr_c_no;
	}

	public String getCr_title() {
		return cr_title;
	}

	public void setCr_title(String cr_title) {
		this.cr_title = cr_title;
	}

	public String getCr_advantage() {
		return cr_advantage;
	}

	public void setCr_advantage(String cr_advantage) {
		this.cr_advantage = cr_advantage;
	}

	public String getCr_weakness() {
		return cr_weakness;
	}

	public void setCr_weakness(String cr_weakness) {
		this.cr_weakness = cr_weakness;
	}

	public String getCr_m_id() {
		return cr_m_id;
	}

	public void setCr_m_id(String cr_m_id) {
		this.cr_m_id = cr_m_id;
	}

	public Date getCr_date() {
		return cr_date;
	}

	public void setCr_date(Date cr_date) {
		this.cr_date = cr_date;
	}
	
}
