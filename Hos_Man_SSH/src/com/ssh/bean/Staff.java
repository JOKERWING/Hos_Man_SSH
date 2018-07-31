package com.ssh.bean;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Staff entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "staff", catalog = "hos_man")
public class Staff implements java.io.Serializable {

	// Fields

	private String slogid;
	private String spwd;
	private String sname;
	private String ssex;
	private Date sbirth;
	private String semail;
	private String stele;
	private String sidcard;
	private String saddress;
	private String rname;

	// Constructors

	/** default constructor */
	public Staff() {
	}

	/** full constructor */
	public Staff(String slogid, String spwd, String sname, String ssex,
			Date sbirth, String semail, String stele, String sidcard,
			String saddress, String rname) {
		this.slogid = slogid;
		this.spwd = spwd;
		this.sname = sname;
		this.ssex = ssex;
		this.sbirth = sbirth;
		this.semail = semail;
		this.stele = stele;
		this.sidcard = sidcard;
		this.saddress = saddress;
		this.rname = rname;
	}

	// Property accessors
	@Id
	@Column(name = "slogid", unique = true, nullable = false)
	public String getSlogid() {
		return this.slogid;
	}

	public void setSlogid(String slogid) {
		this.slogid = slogid;
	}

	@Column(name = "spwd", nullable = false)
	public String getSpwd() {
		return this.spwd;
	}

	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}

	@Column(name = "sname", nullable = false)
	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	@Column(name = "ssex", nullable = false)
	public String getSsex() {
		return this.ssex;
	}

	public void setSsex(String ssex) {
		this.ssex = ssex;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "sbirth", nullable = false, length = 10)
	public Date getSbirth() {
		return this.sbirth;
	}

	public void setSbirth(Date sbirth) {
		this.sbirth = sbirth;
	}

	@Column(name = "semail", nullable = false)
	public String getSemail() {
		return this.semail;
	}

	public void setSemail(String semail) {
		this.semail = semail;
	}

	@Column(name = "stele", nullable = false)
	public String getStele() {
		return this.stele;
	}

	public void setStele(String stele) {
		this.stele = stele;
	}

	@Column(name = "sidcard", nullable = false)
	public String getSidcard() {
		return this.sidcard;
	}

	public void setSidcard(String sidcard) {
		this.sidcard = sidcard;
	}

	@Column(name = "saddress", nullable = false)
	public String getSaddress() {
		return this.saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	@Column(name = "rname", nullable = false)
	public String getRname() {
		return this.rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

}