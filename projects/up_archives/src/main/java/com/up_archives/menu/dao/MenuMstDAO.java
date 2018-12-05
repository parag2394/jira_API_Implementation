package com.up_archives.menu.dao;

import java.util.List;

import com.up_archives.menu.model.MenuMst;



public interface MenuMstDAO {
//	public void updateMenuMst(MenuMst m);
	
	public void updateMenuMst(int menuid,String text,String descriptoin,int parentid,String navurl,char showinmenu,char showtoall,int orderby,char enable);

	public void setMenuMst(MenuMst menuMst);

	public void loadMenuMst(MenuMst menuMst);

	public int getMenuMst();

	public List fetchMenuMst();
}