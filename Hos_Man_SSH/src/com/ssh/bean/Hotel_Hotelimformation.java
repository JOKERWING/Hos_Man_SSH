package com.ssh.bean;

public class Hotel_Hotelimformation {
	private String HId;
	private String HName;
	private Integer HArea;
	private Integer HFloor;
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
	public Hotel_Hotelimformation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Hotel_Hotelimformation(String hId, String hName, Integer hArea,
			Integer hFloor, Integer hiId, String hiName, Integer hiPrice,
			String hiType, String hiFloor, String hiArea, String hiImfor,
			String hiBed, String hiWifi, String hiAirt, String hiBreakf,
			Integer hiAddlevsco) {
		super();
		HId = hId;
		HName = hName;
		HArea = hArea;
		HFloor = hFloor;
		this.hiId = hiId;
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

	public String getHId() {
		return HId;
	}
	public void setHId(String hId) {
		HId = hId;
	}
	public String getHName() {
		return HName;
	}
	public void setHName(String hName) {
		HName = hName;
	}
	public Integer getHArea() {
		return HArea;
	}
	public void setHArea(Integer hArea) {
		HArea = hArea;
	}
	public Integer getHFloor() {
		return HFloor;
	}
	public void setHFloor(Integer hFloor) {
		HFloor = hFloor;
	}
	public Integer getHiId() {
		return hiId;
	}
	public void setHiId(Integer hiId) {
		this.hiId = hiId;
	}
	public String getHiName() {
		return hiName;
	}
	public void setHiName(String hiName) {
		this.hiName = hiName;
	}
	public Integer getHiPrice() {
		return hiPrice;
	}
	public void setHiPrice(Integer hiPrice) {
		this.hiPrice = hiPrice;
	}
	public String getHiType() {
		return hiType;
	}
	public void setHiType(String hiType) {
		this.hiType = hiType;
	}
	public String getHiFloor() {
		return hiFloor;
	}
	public void setHiFloor(String hiFloor) {
		this.hiFloor = hiFloor;
	}
	public String getHiArea() {
		return hiArea;
	}
	public void setHiArea(String hiArea) {
		this.hiArea = hiArea;
	}
	public String getHiImfor() {
		return hiImfor;
	}
	public void setHiImfor(String hiImfor) {
		this.hiImfor = hiImfor;
	}
	public String getHiBed() {
		return hiBed;
	}
	public void setHiBed(String hiBed) {
		this.hiBed = hiBed;
	}
	public String getHiWifi() {
		return hiWifi;
	}
	public void setHiWifi(String hiWifi) {
		this.hiWifi = hiWifi;
	}
	public String getHiAirt() {
		return hiAirt;
	}
	public void setHiAirt(String hiAirt) {
		this.hiAirt = hiAirt;
	}
	public String getHiBreakf() {
		return hiBreakf;
	}
	public void setHiBreakf(String hiBreakf) {
		this.hiBreakf = hiBreakf;
	}

	public Integer getHiAddlevsco() {
		return hiAddlevsco;
	}

	public void setHiAddlevsco(Integer hiAddlevsco) {
		this.hiAddlevsco = hiAddlevsco;
	}
	
}
