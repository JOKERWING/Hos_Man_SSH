package com.ssh.bean;

public class Student_Test {
	
	private Integer studentId;
	private String name;
	private String gender;
	private Integer testId;
	private String score;
	public Student_Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student_Test(Integer studentId, String name, String gender,
			Integer testId, String score) {
		super();
		this.studentId = studentId;
		this.name = name;
		this.gender = gender;
		this.testId = testId;
		this.score = score;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getTestId() {
		return testId;
	}
	public void setTestId(Integer testId) {
		this.testId = testId;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	
}
