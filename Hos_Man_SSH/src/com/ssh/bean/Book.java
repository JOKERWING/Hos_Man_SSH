package com.ssh.bean;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "book", catalog = "hos_man")
public class Book implements java.io.Serializable {

	// Fields

	private Integer BId;
	private Integer HId;
	private String HName;
	private Date BIndate;
	private Date BOutdate;
	private Integer BPnum;
	private Double BPrice;
	private String CLogid;
	private Double BPrepay;

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(Integer HId, String HName, Date BIndate, Date BOutdate,
			Integer BPnum, Double BPrice, String CLogid, Double BPrepay) {
		this.HId = HId;
		this.HName = HName;
		this.BIndate = BIndate;
		this.BOutdate = BOutdate;
		this.BPnum = BPnum;
		this.BPrice = BPrice;
		this.CLogid = CLogid;
		this.BPrepay = BPrepay;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "b_id", unique = true, nullable = false)
	public Integer getBId() {
		return this.BId;
	}

	public void setBId(Integer BId) {
		this.BId = BId;
	}

	@Column(name = "h_id", nullable = false)
	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

	@Column(name = "h_name", nullable = false)
	public String getHName() {
		return this.HName;
	}

	public void setHName(String HName) {
		this.HName = HName;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "b_indate", nullable = false, length = 10)
	public Date getBIndate() {
		return this.BIndate;
	}

	public void setBIndate(Date BIndate) {
		this.BIndate = BIndate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "b_outdate", nullable = false, length = 10)
	public Date getBOutdate() {
		return this.BOutdate;
	}

	public void setBOutdate(Date BOutdate) {
		this.BOutdate = BOutdate;
	}

	@Column(name = "b_pnum", nullable = false)
	public Integer getBPnum() {
		return this.BPnum;
	}

	public void setBPnum(Integer BPnum) {
		this.BPnum = BPnum;
	}

	@Column(name = "b_price", nullable = false, precision = 22, scale = 0)
	public Double getBPrice() {
		return this.BPrice;
	}

	public void setBPrice(Double BPrice) {
		this.BPrice = BPrice;
	}

	@Column(name = "c_logid", nullable = false)
	public String getCLogid() {
		return this.CLogid;
	}

	public void setCLogid(String CLogid) {
		this.CLogid = CLogid;
	}

	@Column(name = "b_prepay", nullable = false, precision = 22, scale = 0)
	public Double getBPrepay() {
		return this.BPrepay;
	}

	public void setBPrepay(Double BPrepay) {
		this.BPrepay = BPrepay;
	}

}