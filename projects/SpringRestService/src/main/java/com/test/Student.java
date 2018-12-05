package com.test;

public class Student {
	private int sid;
	private String studentName;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getAddress() {
		return address;
	}
	public void setAddress(int address) {
		this.address = address;
	}
	private int age;
	private int address;
	
	
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", studentName=" + studentName + ", age=" + age + ", address=" + address + "]";
	}

}
