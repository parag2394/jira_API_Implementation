package com.up_archives.subDepartment.dao;

import java.util.List;

public interface SubDepartmentDAO {
	
	public List loadSubDept(int dept_id,String sub_dept_name_h,String sub_dept_name_e);
    public void updateSubDepartment(int sub_dept_id,String sub_dept_name_h,String sub_dept_name_e);
    public void deleteSubDepartment(int sub_dept_id);
    public List show_subDepartmens();
}
