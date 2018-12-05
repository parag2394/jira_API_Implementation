package com.up_archives.subDepartment.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="tbl_m_subdepartment_master")
public class SubDept implements Serializable
{

	@Id
	private int dept_id;
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public int getSub_dept_id() {
		return sub_dept_id;
	}
	public void setSub_dept_id(int sub_dept_id) {
		this.sub_dept_id = sub_dept_id;
	}
	public String getSub_dept_name_H() {
		return sub_dept_name_H;
	}
	public void setSub_dept_name_H(String sub_dept_name_H) {
		this.sub_dept_name_H = sub_dept_name_H;
	}
	public String getSub_dept_name_E() {
		return sub_dept_name_E;
	}
	public void setSub_dept_name_E(String sub_dept_name_E) {
		this.sub_dept_name_E = sub_dept_name_E;
	}
	@Id
	@GenericGenerator(name="incgenerator" , strategy="increment")
	@GeneratedValue(generator="incgenerator")
	private int sub_dept_id;
	private String sub_dept_name_H;
	private String sub_dept_name_E;
	
	@Override
	 	public int hashCode()
	 	{
     		return 0;
     		
     	}
     	@Override
     	    public boolean equals(Object obj)
     	    {
     			return true;
     	    }	 
     	    }