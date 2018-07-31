package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Roleprivilege entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "roleprivilege", catalog = "hos_man")
public class Roleprivilege implements java.io.Serializable {

	// Fields

	private Integer rpid;
	private Integer rid;
	private Integer pid;

	// Constructors

	/** default constructor */
	public Roleprivilege() {
	}

	/** full constructor */
	public Roleprivilege(Integer rid, Integer pid) {
		this.rid = rid;
		this.pid = pid;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "rpid", unique = true, nullable = false)
	public Integer getRpid() {
		return this.rpid;
	}

	public void setRpid(Integer rpid) {
		this.rpid = rpid;
	}

	@Column(name = "rid", nullable = false)
	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	@Column(name = "pid", nullable = false)
	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

}