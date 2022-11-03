package com.soldesk.Sollind.member;

import java.math.BigDecimal;

public class join {
	private String m_id;
	private String m_pw;
	private String m_pwcheck;
	private String m_name;
	private String m_addr1;
	private String m_addr2;
	private String m_addr3;
	private BigDecimal m_birth;
	public join() {
		// TODO Auto-generated constructor stub
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_pwcheck() {
		return m_pwcheck;
	}
	public void setM_pwcheck(String m_pwcheck) {
		this.m_pwcheck = m_pwcheck;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_addr3() {
		return m_addr3;
	}
	public void setM_addr3(String m_addr3) {
		this.m_addr3 = m_addr3;
	}
	public BigDecimal getM_birth() {
		return m_birth;
	}
	public void setM_birth(BigDecimal m_birth) {
		this.m_birth = m_birth;
	}
	public join(String m_id, String m_pw, String m_pwcheck, String m_name, String m_addr1, String m_addr2,
			String m_addr3, BigDecimal m_birth) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_pwcheck = m_pwcheck;
		this.m_name = m_name;
		this.m_addr1 = m_addr1;
		this.m_addr2 = m_addr2;
		this.m_addr3 = m_addr3;
		this.m_birth = m_birth;
	}
	
}