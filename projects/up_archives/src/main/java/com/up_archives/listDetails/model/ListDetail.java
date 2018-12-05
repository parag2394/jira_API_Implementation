package com.up_archives.listDetails.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="tbl_list_detail")
public class ListDetail 
{
	@Id
	@GenericGenerator(name="incgenerator" , strategy="increment")
	@GeneratedValue(generator="incgenerator")
	private int record_id;
	
	private int list_id ;
    private int dept_id ;
    private String doc_subject;
    private int doc_year_from;
    private int doc_year_to;
    private int room_no;
    private int rack_no;
    private String location_code;
    public String getLocation_code() {
		return location_code;
	}
	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}
	private int box_no;
    private String file_no;
    private int total_cover_no;
    private String remark;
    private String created_by;
    private Date created_on;
    private String updated_by;
    private Date updated_on;
    private String created_ip;
    private String updated_ip;
    private String mac_address;
    private String shelf_no;
    private String sub_list_id;
    private int status;
    
    public String getShelf_no() {
		return shelf_no;
	}
	public void setShelf_no(String shelf_no) {
		this.shelf_no = shelf_no;
	}
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
	public String getDoc_subject() {
		return doc_subject;
	}
	public void setDoc_subject(String doc_subject) {
		this.doc_subject = doc_subject;
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
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getRack_no() {
		return rack_no;
	}
	public void setRack_no(int rack_no) {
		this.rack_no = rack_no;
	}

	public int getBox_no() {
		return box_no;
	}
	public void setBox_no(int box_no) {
		this.box_no = box_no;
	}
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public int getTotal_cover_no() {
		return total_cover_no;
	}
	public void setTotal_cover_no(int total_cover_no) {
		this.total_cover_no = total_cover_no;
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
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public String getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
	}
	public Date getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(Date updated_on) {
		this.updated_on = updated_on;
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
	public String getSub_list_id() {
		return sub_list_id;
	}
	public void setSub_list_id(String sub_list_id) {
		this.sub_list_id = sub_list_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
		
	
}
