package com.up_archives.subDepartment.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.up_archives.subDepartment.dao.SubDepartmentDAO;
import com.up_archives.subDepartment.model.SubDept;
import com.up_archives.util.HibernateUtil;


public class AccessSubDeptDAO implements SubDepartmentDAO
{
	
	public List show_subDepartmens()
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_sub_department()");
				
				
		System.out.println("show sub department called");
				
		List l=query.list();
		tx.commit();
		session.close();
	    return l;	
	}

	public List loadSubDept(int dept_id,String sub_dept_name_h,String sub_dept_name_e)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.set_sub_department(:p_dept_id,"
				+ ":p_sub_dept_name_h,"
				+ ":p_sub_dept_name_e)").
				setParameter("p_dept_id", dept_id)
				.setParameter("p_sub_dept_name_h",sub_dept_name_h)
				.setParameter("p_sub_dept_name_e",sub_dept_name_e);
				
				
		System.out.println("Helooooooooooooghhghgh");
				
		List l=query.list();
		tx.commit();
		session.close();
	    return l;

	}
	
	public void updateSubDepartment(int sub_dept_id,String sub_dept_name_h,String sub_dept_name_e)
	{
		SubDept d=new SubDept();
	
		d.setSub_dept_id(sub_dept_id);
		d.setSub_dept_name_H(sub_dept_name_h);
		d.setSub_dept_name_E(sub_dept_name_e);

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.update_sub_department(:p_sub_dept_id,:p_sub_dept_name_e,:p_sub_dept_name_h)")
				//.setParameter("p_dept_id",d.getDept_id())
		        .setParameter("p_sub_dept_id",d.getSub_dept_id())
		       .setParameter("p_sub_dept_name_e",d.getSub_dept_name_E())
		       .setParameter("p_sub_dept_name_h",d.getSub_dept_name_H());
		       		
	           List l=query.list();
		       tx.commit();
		       session.close();
	}
	
	  public void deleteSubDepartment(int sub_dept_id)
	  {
		  SubDept d=new SubDept();
			
			d.setSub_dept_id(sub_dept_id);
			

			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.delete_sub_department(:p_sub_dept_id)")
					
			        .setParameter("p_sub_dept_id",d.getSub_dept_id());
			       
			       		
		           List l=query.list();
			       tx.commit();
			       session.close(); 
	  }
}
