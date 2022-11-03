package com.soldesk.Sollind.board;

import java.math.BigDecimal;
import java.util.Date;

public class BoardReply {
	private BigDecimal br_no;
	private String br_txt;
	private String br_m_id;
	private Date br_date;
	private BigDecimal br_b_no;
	public BoardReply() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardReply(BigDecimal br_no, String br_txt, String br_m_id, Date br_date, BigDecimal br_b_no) {
		super();
		this.br_no = br_no;
		this.br_txt = br_txt;
		this.br_m_id = br_m_id;
		this.br_date = br_date;
		this.br_b_no = br_b_no;
	}

	public BigDecimal getBr_no() {
		return br_no;
	}
	public void setBr_no(BigDecimal br_no) {
		this.br_no = br_no;
	}
	public String getBr_txt() {
		return br_txt;
	}
	public void setBr_txt(String br_txt) {
		this.br_txt = br_txt;
	}
	public String getBr_m_id() {
		return br_m_id;
	}
	public void setBr_m_id(String br_m_id) {
		this.br_m_id = br_m_id;
	}
	public Date getBr_date() {
		return br_date;
	}
	public void setBr_date(Date br_date) {
		this.br_date = br_date;
	}
	public BigDecimal getBr_b_no() {
		return br_b_no;
	}
	public void setBr_b_no(BigDecimal br_b_no) {
		this.br_b_no = br_b_no;
	}
	
}
