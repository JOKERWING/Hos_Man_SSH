package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "customer", catalog = "hos_man")
public class Customer implements java.io.Serializable {

	// Fields

	private Integer CId;
	private String CLogid;
	private String CPwd;
	private String CName;
	private String CSex;
	private String CTele;
	private String CIdcard;
	private String CEmail;
	private String CLevel;
	private Integer CLevsco;

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** full constructor */
	public Customer(String CLogid, String CPwd, String CName, String CSex,
			String CTele, String CIdcard, String CEmail, String CLevel,
			Integer CLevsco) {
		this.CLogid = CLogid;
		this.CPwd = CPwd;
		this.CName = CName;
		this.CSex = CSex;
		this.CTele = CTele;
		this.CIdcard = CIdcard;
		this.CEmail = CEmail;
		this.CLevel = CLevel;
		this.CLevsco = CLevsco;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "c_id", unique = true, nullable = false)
	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

	@Column(name = "c_logid", nullable = false)
	public String getCLogid() {
		return this.CLogid;
	}

	public void setCLogid(String CLogid) {
		this.CLogid = CLogid;
	}

	@Column(name = "c_pwd", nullable = false)
	public String getCPwd() {
		return this.CPwd;
	}

	public void setCPwd(String CPwd) {
		this.CPwd = CPwd;
	}

	@Column(name = "c_name", nullable = false)
	public String getCName() {
		return this.CName;
	}

	public void setCName(String CName) {
		this.CName = CName;
	}

	@Column(name = "c_sex", nullable = false)
	public String getCSex() {
		return this.CSex;
	}

	public void setCSex(String CSex) {
		this.CSex = CSex;
	}

	@Column(name = "c_tele", nullable = false)
	public String getCTele() {
		return this.CTele;
	}

	public void setCTele(String CTele) {
		this.CTele = CTele;
	}

	@Column(name = "c_idcard", nullable = false)
	public String getCIdcard() {
		return this.CIdcard;
	}

	public void setCIdcard(String CIdcard) {
		this.CIdcard = CIdcard;
	}

	@Column(name = "c_email", nullable = false)
	public String getCEmail() {
		return this.CEmail;
	}

	public void setCEmail(String CEmail) {
		this.CEmail = CEmail;
	}

	@Column(name = "c_level", nullable = false)
	public String getCLevel() {
		return this.CLevel;
	}

	public void setCLevel(String CLevel) {
		this.CLevel = CLevel;
	}

	@Column(name = "c_levsco", nullable = false)
	public Integer getCLevsco() {
		return this.CLevsco;
	}

	public void setCLevsco(Integer CLevsco) {
		this.CLevsco = CLevsco;
	}

}