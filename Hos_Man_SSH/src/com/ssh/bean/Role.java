package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role", catalog = "hos_man")
public class Role implements java.io.Serializable {

	// Fields

	private Integer rid;
	private String rname;
	private String rnamec;
	private String rimformation;
	private Integer rmaxnum;

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** full constructor */
	public Role(Integer rid, String rname, String rnamec, String rimformation,
			Integer rmaxnum) {
		this.rid = rid;
		this.rname = rname;
		this.rnamec = rnamec;
		this.rimformation = rimformation;
		this.rmaxnum = rmaxnum;
	}

	// Property accessors
	@Id
	@Column(name = "rid", unique = true, nullable = false)
	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	@Column(name = "rname", nullable = false)
	public String getRname() {
		return this.rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	@Column(name = "rnamec", nullable = false)
	public String getRnamec() {
		return this.rnamec;
	}

	public void setRnamec(String rnamec) {
		this.rnamec = rnamec;
	}

	@Column(name = "rimformation", nullable = false)
	public String getRimformation() {
		return this.rimformation;
	}

	public void setRimformation(String rimformation) {
		this.rimformation = rimformation;
	}

	@Column(name = "rmaxnum", nullable = false)
	public Integer getRmaxnum() {
		return this.rmaxnum;
	}

	public void setRmaxnum(Integer rmaxnum) {
		this.rmaxnum = rmaxnum;
	}

}