package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TblTest1 entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tbl_test1", catalog = "hos_man")
public class TblTest1 implements java.io.Serializable {

	// Fields

	private Integer testId;
	private Integer studentId;
	private String score;

	// Constructors

	/** default constructor */
	public TblTest1() {
	}

	/** full constructor */
	public TblTest1(Integer studentId, String score) {
		this.studentId = studentId;
		this.score = score;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "TestID", unique = true, nullable = false)
	public Integer getTestId() {
		return this.testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	@Column(name = "Student_id")
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "Score")
	public String getScore() {
		return this.score;
	}

	public void setScore(String score) {
		this.score = score;
	}

}