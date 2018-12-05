package com.up_archives.menu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "tbl_menumst")

public class MenuMst {
	public MenuMst() {

	}

	@Id
	@GenericGenerator(name = "incgenerator", strategy = "increment")
	@GeneratedValue(generator = "incgenerator")
	@Column(name = "menuId")
	private int menuId;

	@Column(name = "text")
	private String text;

	@Column(name = "description")
	private String description;

	@Column(name = "parentId")
	private int parentId;

	@Column(name = "navurl")
	private String navurl;

	@Column(name = "showtoall")
	private char showtoall;

	@Column(name = "showinmenu")
	private char showinmenu;

	@Column(name = "orderby")
	private int orderby;

	@Column(name = "enable")
	private char enable;

//	@Column(name = "createdon")
//	private Date createdon;

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getNavurl() {
		return navurl;
	}

	public void setNavurl(String navurl) {
		this.navurl = navurl;
	}

	public char getShowtoall() {
		return showtoall;
	}

	public void setShowtoall(char showtoall) {
		this.showtoall = showtoall;
	}

	public char getShowinmenu() {
		return showinmenu;
	}

	public void setShowinmenu(char showinmenu) {
		this.showinmenu = showinmenu;
	}

	public int getOrderby() {
		return orderby;
	}

	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}

	public char getEnable() {
		return enable;
	}

	public void setEnable(char enable) {
		this.enable = enable;
	}
}