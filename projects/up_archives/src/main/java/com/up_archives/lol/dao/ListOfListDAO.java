package com.up_archives.lol.dao;

import java.util.List;

public interface ListOfListDAO {
	
	public int get_List_id();
	public List update_list(int listid,int deptid,int doc_from,int doc_to,String remark,String sublist);
	public List get_List_All_Ids();
	public List show_list_dept_id(int list_id);
    public List show_list_dept_name(int dept_id);
    public List set_list_of_list(int dept_id,int list_id,int doc_year_from,int doc_year_to,String date_doc_recieve,String remark,String sublist);
    public List del_list_of_list(int dept_id,int list_id,int doc_year_from,int doc_year_to,String sublist);
    public List getListSubSept(int dept_id);
  
}
