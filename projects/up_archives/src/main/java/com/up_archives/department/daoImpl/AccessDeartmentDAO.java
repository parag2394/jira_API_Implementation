package com.up_archives.department.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import com.up_archives.department.dao.DepartmentDAO;
import com.up_archives.department.model.Dept;
import com.up_archives.util.HibernateUtil;


public class AccessDeartmentDAO implements DepartmentDAO
{
	
	  public int getDepartments()
	{
			
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session=sf.openSession();
			SQLQuery query = session.createSQLQuery("SELECT * FROM public.show_department1()");
			List<Object[]> l=query.list();
			for(Object[] obj : l)
			{
		
				Dept d=new Dept();
				d.setDept_id((Integer) obj[0]);
				d.setDept_name_E(String.valueOf(obj[1]));
				d.setDept_name_H(String.valueOf(obj[2]));
		
			}
			
	  
		session.close();
		return 0;
	}
	  
	  
	public List loadDept(String dept_name_H,String dept_name_E)
	{
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.set_department(:p_dept_name_e,:p_dept_name_h)").
				setParameter("p_dept_name_e", dept_name_E)
				.setParameter("p_dept_name_h", dept_name_H);
				
		System.out.println("Helooooooooooooghhghgh");
				
		List l=query.list();
		tx.commit();
		session.close();
	    return l;
		
	}
	public void setDepartment(int dept_id,String dept_name_H,String dept_name_E)
	{
		
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		try 
		{
			

			
			SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.set_department(:dept_id,:dept_name_e,:dept_name_h)")
					
					.setParameter("dept_id", dept_id)
					.setParameter("dept_name_e",dept_name_E)
					.setParameter("dept_name_h",dept_name_H);
			query.list();
			session.close();
			
	    	
		} catch (Exception e)
		{
			session.close();
			e.printStackTrace();
		}
		
		
	}

	public void updateDept(int dept_id,String dept_name_H,String dept_name_E)
	{
		
		Dept d=new Dept();
		d.setDept_id(dept_id);
		d.setDept_name_H(dept_name_H);
		d.setDept_name_E(dept_name_E);

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.update_department(:p_dept_id,:p_dept_name_e,:p_dept_name_h)")
				.setParameter("p_dept_id",d.getDept_id())
		        .setParameter("p_dept_name_e",d.getDept_name_E())
		       .setParameter("p_dept_name_h",d.getDept_name_H());
		       		
	           List l=query.list();
		       tx.commit();
		       session.close();
	}
	
	public List fetchDepartments()
	{
		Dept d=new Dept();
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = session.createSQLQuery("SELECT * FROM public.show_department1()");
				
		       		
		List<Object[]> l=query.list();
		       tx.commit();
		       session.close();
		return l;
	}
	
	public void deleteDept(int dept_id)
	{
		Dept d=new Dept();
		d.setDept_id(dept_id);
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.delete_department(:p_dept_id)")
				.setParameter("p_dept_id",d.getDept_id());   		
	           List l=query.list();
		       tx.commit();
		       session.close();
	}
}
