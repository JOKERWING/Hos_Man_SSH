package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Hotel entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "hotel", catalog = "hos_man")
public class Hotel implements java.io.Serializable {

	// Fields

	private String HId;
	private String HName;
	private Integer HArea;
	private Integer HFloor;
	private Integer hiId;

	// Constructors

	/** default constructor */
	public Hotel() {
	}

	/** full constructor */
	public Hotel(String HId, String HName, Integer HArea, Integer HFloor,
			Integer hiId) {
		this.HId = HId;
		this.HName = HName;
		this.HArea = HArea;
		this.HFloor = HFloor;
		this.hiId = hiId;
	}

	// Property accessors
	@Id
	@Column(name = "h_id", unique = true, nullable = false)
	public String getHId() {
		return this.HId;
	}

	public void setHId(String HId) {
		this.HId = HId;
	}

	@Column(name = "h_name", nullable = false)
	public String getHName() {
		return this.HName;
	}

	public void setHName(String HName) {
		this.HName = HName;
	}

	@Column(name = "h_area", nullable = false)
	public Integer getHArea() {
		return this.HArea;
	}

	public void setHArea(Integer HArea) {
		this.HArea = HArea;
	}

	@Column(name = "h_floor", nullable = false)
	public Integer getHFloor() {
		return this.HFloor;
	}

	public void setHFloor(Integer HFloor) {
		this.HFloor = HFloor;
	}

	@Column(name = "hi_id", nullable = false)
	public Integer getHiId() {
		return this.hiId;
	}

	public void setHiId(Integer hiId) {
		this.hiId = hiId;
	}

}