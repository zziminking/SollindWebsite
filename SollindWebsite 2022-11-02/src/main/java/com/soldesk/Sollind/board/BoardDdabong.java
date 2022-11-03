package com.soldesk.Sollind.board;

import java.math.BigDecimal;

public class BoardDdabong {
	private BigDecimal bd_no;
	private BigDecimal bd_ddabong;
	private BigDecimal bd_b_no;
	private String bd_m_id;
	public BoardDdabong() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardDdabong(BigDecimal bd_no, BigDecimal bd_ddabong, BigDecimal bd_b_no, String bd_m_id) {
		super();
		this.bd_no = bd_no;
		this.bd_ddabong = bd_ddabong;
		this.bd_b_no = bd_b_no;
		this.bd_m_id = bd_m_id;
	}

	public BigDecimal getBd_no() {
		return bd_no;
	}
	public void setBd_no(BigDecimal bd_no) {
		this.bd_no = bd_no;
	}
	public BigDecimal getBd_ddabong() {
		return bd_ddabong;
	}
	public void setBd_ddabong(BigDecimal bd_ddabong) {
		this.bd_ddabong = bd_ddabong;
	}
	public BigDecimal getBd_b_no() {
		return bd_b_no;
	}
	public void setBd_b_no(BigDecimal bd_b_no) {
		this.bd_b_no = bd_b_no;
	}
	public String getBd_m_id() {
		return bd_m_id;
	}
	public void setBd_m_id(String bd_m_id) {
		this.bd_m_id = bd_m_id;
	}
	
}
