package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Level entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "level", catalog = "hos_man")
public class Level implements java.io.Serializable {

	// Fields

	private Integer lid;
	private String llevel;
	private Integer llevscomax;
	private Double lsale;

	// Constructors

	/** default constructor */
	public Level() {
	}

	/** full constructor */
	public Level(String llevel, Integer llevscomax, Double lsale) {
		this.llevel = llevel;
		this.llevscomax = llevscomax;
		this.lsale = lsale;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "lid", unique = true, nullable = false)
	public Integer getLid() {
		return this.lid;
	}

	public void setLid(Integer lid) {
		this.lid = lid;
	}

	@Column(name = "llevel", nullable = false)
	public String getLlevel() {
		return this.llevel;
	}

	public void setLlevel(String llevel) {
		this.llevel = llevel;
	}

	@Column(name = "llevscomax", nullable = false)
	public Integer getLlevscomax() {
		return this.llevscomax;
	}

	public void setLlevscomax(Integer llevscomax) {
		this.llevscomax = llevscomax;
	}

	@Column(name = "lsale", nullable = false, precision = 22, scale = 0)
	public Double getLsale() {
		return this.lsale;
	}

	public void setLsale(Double lsale) {
		this.lsale = lsale;
	}

}