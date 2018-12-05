package com.up_archives.RRS.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="tbl_m_rack_master")
public class RoomRackShelfs {
	
	@Id
	@GenericGenerator(name="incgenerator" , strategy="increment")
	@GeneratedValue(generator="incgenerator")
	private int r_id;
	   public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	
	@Column(name="room_no")
	    private int roomnum;
	    
	   @Column(name="rack_no")
	    private int racknum;
	    
	   @Column(name="total_shelf")
	    private int totalshelf;
	    
	   @Column(name="total_box_in_single_shelf")
	    private int totalbook;
	   
	   @Column(name="Total_subselfInself")
	   private int total_subselfInself;
	   
	   public int getTotal_subselfInself() {
		return total_subselfInself;
	}
	public void setTotal_subselfInself(int total_subselfInself) {
		this.total_subselfInself = total_subselfInself;
	}
	public int getTotal_boxinSubself() {
		return total_boxinSubself;
	}
	public void setTotal_boxinSubself(int total_boxinSubself) {
		this.total_boxinSubself = total_boxinSubself;
	}
	public int getTotalSubselfinRack() {
		return totalSubselfinRack;
	}
	public void setTotalSubselfinRack(int totalSubselfinRack) {
		this.totalSubselfinRack = totalSubselfinRack;
	}
	public int getTotalBoxesinRack() {
		return totalBoxesinRack;
	}
	public void setTotalBoxesinRack(int totalBoxesinRack) {
		this.totalBoxesinRack = totalBoxesinRack;
	}
	@Column(name="Total_boxinSubself")
	   private int total_boxinSubself;
	   
	   @Column(name="TotalSubselfinRack")
	   private int totalSubselfinRack;
	   
	   @Column(name="TotalBoxesinRack")
	   private int totalBoxesinRack;
	   
	  
	   
	   
	    
		public int getRoomnum() {
			return roomnum;
		}
		public void setRoomnum(int roomnum) {
			this.roomnum = roomnum;
		}
		public int getRacknum() {
			return racknum;
		}
		public void setRacknum(int racknum) {
			this.racknum = racknum;
		}
		public int getTotalshelf() {
			return totalshelf;
		}
		public void setTotalshelf(int totalshelf) {
			this.totalshelf = totalshelf;
		}
		public int getTotalbook() {
			return totalbook;
		}
		public void setTotalbook(int totalbook) {
			this.totalbook = totalbook;
		}
	    

}
