package com.ssh.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TblStudent entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tbl_student", catalog = "hos_man")
public class TblStudent implements java.io.Serializable {

	// Fields

	private Integer studentId;
	private String name;
	private String gender;

	// Constructors

	/** default constructor */
	public TblStudent() {
	}

	/** full constructor */
	public TblStudent(String name, String gender) {
		this.name = name;
		this.gender = gender;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "StudentID", unique = true, nullable = false)
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "Name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Gender")
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}