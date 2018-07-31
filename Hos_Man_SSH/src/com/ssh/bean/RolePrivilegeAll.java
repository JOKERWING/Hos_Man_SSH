package com.ssh.bean;

import javax.persistence.Id;

public class RolePrivilegeAll implements java.io.Serializable {
	
	private Integer rid;
	private String rname;
	private String rnamec;
	private String rimformation;
	private Integer rmaxnum;
	private Integer pid;
	private String pfunction;
	private String pimformation;
	private Integer rid1;
	private Integer pid1;
	
	public RolePrivilegeAll() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RolePrivilegeAll(Integer rid, String rname, String rnamec,
			String rimformation, Integer rmaxnum, Integer pid,
			String pfunction, String pimformation, Integer rid1, Integer pid1) {
		super();
		this.rid = rid;
		this.rname = rname;
		this.rnamec = rnamec;
		this.rimformation = rimformation;
		this.rmaxnum = rmaxnum;
		this.pid = pid;
		this.pfunction = pfunction;
		this.pimformation = pimformation;
		this.rid1 = rid1;
		this.pid1 = pid1;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRnamec() {
		return rnamec;
	}

	public void setRnamec(String rnamec) {
		this.rnamec = rnamec;
	}

	public String getRimformation() {
		return rimformation;
	}

	public void setRimformation(String rimformation) {
		this.rimformation = rimformation;
	}

	public Integer getRmaxnum() {
		return rmaxnum;
	}

	public void setRmaxnum(Integer rmaxnum) {
		this.rmaxnum = rmaxnum;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPfunction() {
		return pfunction;
	}

	public void setPfunction(String pfunction) {
		this.pfunction = pfunction;
	}

	public String getPimformation() {
		return pimformation;
	}

	public void setPimformation(String pimformation) {
		this.pimformation = pimformation;
	}

	public Integer getRid1() {
		return rid1;
	}

	public void setRid1(Integer rid1) {
		this.rid1 = rid1;
	}

	public Integer getPid1() {
		return pid1;
	}

	public void setPid1(Integer pid1) {
		this.pid1 = pid1;
	}

	
	
	
}
