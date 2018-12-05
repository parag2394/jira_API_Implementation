package com.up_archives.department.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="tbl_m_department_master")
public class Dept  implements Serializable
{

	//
	@Id
	@GenericGenerator(name="incgenerator" , strategy="increment")
	@GeneratedValue(generator="incgenerator")
	@Column(name="dept_id")
	private int dept_id;
	
	
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	@Column(name="dept_name_h")
	private String dept_name_H;
	
	@Column(name="dept_name_e")
    private String dept_name_E;
	
    public String getDept_name_H() {
		return dept_name_H;
	}
	public void setDept_name_H(String dept_name_H) {
		this.dept_name_H = dept_name_H;
	}
	public String getDept_name_E() {
		return dept_name_E;
	}
	public void setDept_name_E(String dept_name_E) {
		this.dept_name_E = dept_name_E;
	}
    
}
