package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Hotelimformation entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "hotelimformation", catalog = "hos_man")
public class Hotelimformation implements java.io.Serializable {

	// Fields

	private Integer hiId;
	private String hiName;
	private Integer hiPrice;
	private String hiType;
	private String hiFloor;
	private String hiArea;
	private String hiImfor;
	private String hiBed;
	private String hiWifi;
	private String hiAirt;
	private String hiBreakf;
	private Integer hiAddlevsco;

	// Constructors

	/** default constructor */
	public Hotelimformation() {
	}

	/** full constructor */
	public Hotelimformation(String hiName, Integer hiPrice, String hiType,
			String hiFloor, String hiArea, String hiImfor, String hiBed,
			String hiWifi, String hiAirt, String hiBreakf, Integer hiAddlevsco) {
		this.hiName = hiName;
		this.hiPrice = hiPrice;
		this.hiType = hiType;
		this.hiFloor = hiFloor;
		this.hiArea = hiArea;
		this.hiImfor = hiImfor;
		this.hiBed = hiBed;
		this.hiWifi = hiWifi;
		this.hiAirt = hiAirt;
		this.hiBreakf = hiBreakf;
		this.hiAddlevsco = hiAddlevsco;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "hi_id", unique = true, nullable = false)
	public Integer getHiId() {
		return this.hiId;
	}

	public void setHiId(Integer hiId) {
		this.hiId = hiId;
	}

	@Column(name = "hi_name", nullable = false)
	public String getHiName() {
		return this.hiName;
	}

	public void setHiName(String hiName) {
		this.hiName = hiName;
	}

	@Column(name = "hi_price", nullable = false)
	public Integer getHiPrice() {
		return this.hiPrice;
	}

	public void setHiPrice(Integer hiPrice) {
		this.hiPrice = hiPrice;
	}

	@Column(name = "hi_type", nullable = false)
	public String getHiType() {
		return this.hiType;
	}

	public void setHiType(String hiType) {
		this.hiType = hiType;
	}

	@Column(name = "hi_floor", nullable = false)
	public String getHiFloor() {
		return this.hiFloor;
	}

	public void setHiFloor(String hiFloor) {
		this.hiFloor = hiFloor;
	}

	@Column(name = "hi_area", nullable = false)
	public String getHiArea() {
		return this.hiArea;
	}

	public void setHiArea(String hiArea) {
		this.hiArea = hiArea;
	}

	@Column(name = "hi_imfor", nullable = false)
	public String getHiImfor() {
		return this.hiImfor;
	}

	public void setHiImfor(String hiImfor) {
		this.hiImfor = hiImfor;
	}

	@Column(name = "hi_bed", nullable = false)
	public String getHiBed() {
		return this.hiBed;
	}

	public void setHiBed(String hiBed) {
		this.hiBed = hiBed;
	}

	@Column(name = "hi_wifi", nullable = false)
	public String getHiWifi() {
		return this.hiWifi;
	}

	public void setHiWifi(String hiWifi) {
		this.hiWifi = hiWifi;
	}

	@Column(name = "hi_airt", nullable = false)
	public String getHiAirt() {
		return this.hiAirt;
	}

	public void setHiAirt(String hiAirt) {
		this.hiAirt = hiAirt;
	}

	@Column(name = "hi_breakf", nullable = false)
	public String getHiBreakf() {
		return this.hiBreakf;
	}

	public void setHiBreakf(String hiBreakf) {
		this.hiBreakf = hiBreakf;
	}

	@Column(name = "hi_addlevsco", nullable = false)
	public Integer getHiAddlevsco() {
		return this.hiAddlevsco;
	}

	public void setHiAddlevsco(Integer hiAddlevsco) {
		this.hiAddlevsco = hiAddlevsco;
	}

}