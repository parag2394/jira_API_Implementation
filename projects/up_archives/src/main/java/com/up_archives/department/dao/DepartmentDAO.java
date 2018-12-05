package com.up_archives.department.dao;

import java.util.List;

public interface DepartmentDAO {
	
	public List loadDept(String dept_name_H,String dept_name_E);
	public void setDepartment(int dept_id,String dept_name_H,String dept_name_E);
	public int getDepartments();
	public void updateDept(int dept_id,String dept_name_H,String dept_name_E);
	public List fetchDepartments();
	public void deleteDept(int dept_id);

}
