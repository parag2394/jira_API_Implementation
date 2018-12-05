package com.test;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties({"sid"})
@JsonPropertyOrder({"studentName","age","address","sid"})
public class Student {
	
	
	private int sid;
	
	@JsonProperty("name")
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private int age;
	private String address;
	
	
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", studentName=" + studentName + ", age=" + age + ", address=" + address + "]";
	}

}
