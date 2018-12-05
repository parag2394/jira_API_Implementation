package com.up_archives.lol.daoImpl;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import com.up_archives.lol.dao.ListOfListDAO;
import com.up_archives.lol.model.ListOfList;
import com.up_archives.util.HibernateUtil;

public class AccessListOfListDao implements ListOfListDAO {
	int list_id;
public int get_List_id()
{
	System.out.println("List id is....ssssssssssssss.");
	ListOfList d=new ListOfList();

	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session1=sf.openSession();
	Transaction tx=session1.beginTransaction();
	SQLQuery query = session1.createSQLQuery("SELECT * FROM public.show_list_id_new()");
	List l=query.list();
	
	
	list_id=(Integer) l.get(0);
	System.out.println("List id is...."+list_id);
	session1.close();
	
		return list_id;
	
	
	
	 
}

public List update_list(int listid,int deptid,int doc_from,int doc_to,String remark_new,String sublist)
{
	ListOfList d=new ListOfList();

	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.update_list_of_list(:p_list_id,:p_dept_id,:p_doc_year_from,:p_doc_year_to,:p_remark,:p_sublist)")
			.setParameter("p_list_id",listid)
			.setParameter("p_dept_id",deptid)
			.setParameter("p_doc_year_from",doc_from)
			.setParameter("p_doc_year_to",doc_to)
			.setParameter("p_remark", remark_new)
			.setParameter("p_sublist",sublist);
	        List l=query.list();
	        tx.commit();
	       session.close();
		return l;
}
/*
public List get_List_All_Ids()
{
	ListOfList d=new ListOfList();
	Configuration con=new Configuration().configure().addAnnotatedClass(ListOfList.class);

	ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();

	SessionFactory sf=con.buildSessionFactory(reg);
	Session session1=sf.openSession();
	Transaction tx=session1.beginTransaction();
	SQLQuery query = session1.createSQLQuery("SELECT * FROM public.show_all_list_id()");
	List l=query.list();
	//list_id=(Integer) l.get(0);
	
	 return l;
}
*/

public List get_List_All_Ids()
{
	ListOfList d=new ListOfList();

	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	SQLQuery query = session.createSQLQuery("SELECT * FROM public.show_listid_deptname()");
//	SQLQuery query = session.createSQLQuery("SELECT * FROM public.show_listids()");
	System.out.println("Functon called");
	List l=query.list();
	session.close();
	 return l;
}



public List show_list_dept_id(int list_id)
{
	ListOfList d=new ListOfList();

	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_list_dept_id(:p_list_id)")
			.setParameter("p_list_id",list_id);
	List l=query.list();
	
	session.close();
	 return l;
}

public List getListSubSept(int dept_id)
{
	

	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_subdept_in_dept(:p_dept_id)")
			.setParameter("p_dept_id",dept_id);
	List l=query.list();
	
	session.close();
	 return l;	
}

public List show_list_dept_name(int dept_id)
{
	ListOfList d=new ListOfList();

	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_list_deptname(:p_dept_id)")
			.setParameter("p_dept_id",dept_id);
	List l=query.list();
	
	session.close();
	 return l;
}

public List set_list_of_list(int dept_id,int list_id,int doc_year_from,int doc_year_to,String date_doc_recieve,String remark,String sublist)
{
	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.set_list_of_list(:p_list_id,:p_dept_id,:p_doc_year_from,"
			+ ":p_doc_year_to,:p_date_doc_recieve,:p_remark,:p_sublist)").
			setParameter("p_list_id", list_id)
			.setParameter("p_dept_id", dept_id)
			.setParameter("p_doc_year_from", doc_year_from)
			.setParameter("p_doc_year_to", doc_year_to)
			.setParameter("p_date_doc_recieve", date_doc_recieve)
			.setParameter("p_remark", remark)
			.setParameter("p_sublist", sublist);
			
	System.out.println("Helooooooooooooghhghgh");
			
	List l=query.list();
	tx.commit();
	session.close();
    return l;
	
}

public List del_list_of_list(int dept_id,int list_id,int doc_year_from,int doc_year_to,String sublist)
{
	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.delete_list_of_list(:p_list_id,:p_dept_id,:p_doc_year_from,"
			+ ":p_doc_year_to,:p_sublist)").
			setParameter("p_list_id", list_id)
			.setParameter("p_dept_id", dept_id)
			.setParameter("p_doc_year_from", doc_year_from)
			.setParameter("p_doc_year_to", doc_year_to)
			.setParameter("p_sublist", sublist);
			
	System.out.println("Helooooooooooooghhghgh");
			
	List l=query.list();
	tx.commit();
	session.close();
    return l;
}

}
