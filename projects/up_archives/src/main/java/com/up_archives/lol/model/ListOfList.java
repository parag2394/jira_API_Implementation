package com.up_archives.lol.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="tbl_list_of_list")
public class ListOfList {
	
	@Id
	@GenericGenerator(name="incgenerator" , strategy="increment")
	@GeneratedValue(generator="incgenerator")
	private int record_id;
	
	
	
	
	
	private int list_id;
	
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public Date getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(Date updated_on) {
		this.updated_on = updated_on;
	}
	private int dept_id;
	private int doc_year_from;
	private int doc_year_to;
	private Date doc_receive_date;
	private String remark;
	private String created_by;
	private Date created_on;
	private String updated_by;
	private Date updated_on;
	private String created_ip;
	private String updated_ip;
	private String mac_address;
	
	public int getRecord_id() {
		return record_id;
	}
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}
	public int getList_id() {
		return list_id;
	}
	public void setList_id(int list_id) {
		this.list_id = list_id;
	}
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public int getDoc_year_from() {
		return doc_year_from;
	}
	public void setDoc_year_from(int doc_year_from) {
		this.doc_year_from = doc_year_from;
	}
	public int getDoc_year_to() {
		return doc_year_to;
	}
	public void setDoc_year_to(int doc_year_to) {
		this.doc_year_to = doc_year_to;
	}
	public Date getDoc_receive_date() {
		return doc_receive_date;
	}
	public void setDoc_receive_date(Date doc_receive_date) {
		this.doc_receive_date = doc_receive_date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	
	public String getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
	}
	
	public String getCreated_ip() {
		return created_ip;
	}
	public void setCreated_ip(String created_ip) {
		this.created_ip = created_ip;
	}
	public String getUpdated_ip() {
		return updated_ip;
	}
	public void setUpdated_ip(String updated_ip) {
		this.updated_ip = updated_ip;
	}
	public String getMac_address() {
		return mac_address;
	}
	public void setMac_address(String mac_address) {
		this.mac_address = mac_address;
	}
	
	
	

}
