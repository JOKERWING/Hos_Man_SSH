package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Privilege entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "privilege", catalog = "hos_man")
public class Privilege implements java.io.Serializable {

	// Fields

	private Integer pid;
	private String pfunction;
	private String pimformation;

	// Constructors

	/** default constructor */
	public Privilege() {
	}

	/** full constructor */
	public Privilege(String pfunction, String pimformation) {
		this.pfunction = pfunction;
		this.pimformation = pimformation;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "pid", unique = true, nullable = false)
	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Column(name = "pfunction", nullable = false)
	public String getPfunction() {
		return this.pfunction;
	}

	public void setPfunction(String pfunction) {
		this.pfunction = pfunction;
	}

	@Column(name = "pimformation", nullable = false)
	public String getPimformation() {
		return this.pimformation;
	}

	public void setPimformation(String pimformation) {
		this.pimformation = pimformation;
	}

}