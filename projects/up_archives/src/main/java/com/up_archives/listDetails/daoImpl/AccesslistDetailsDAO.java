package com.up_archives.listDetails.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.up_archives.listDetails.dao.ListDetailsDAO;
import com.up_archives.lol.model.ListOfList;
import com.up_archives.util.HibernateUtil;


public class AccesslistDetailsDAO implements ListDetailsDAO {
	
	public List getListDeptName(int list_id)
	{

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_listdeptname(:p_list_id)")
				.setParameter("p_list_id",list_id);
		List l=query.list();
		tx.commit();
		session.close();
		 return l;
	}
	
	public List getRackCodes()
	{

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_rackcode()");
				
		List l=query.list();
		session.close();
		return l;
	}
	
	public List getAllRacksInRoom(int roomnum)
	{

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_racks_in_room(:room_num_p)").
				setParameter("room_num_p",roomnum);
				
		List l=query.list();
		session.close();
		return l;
	}
	
	public List getLocationCode(String loactionCode)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_specified_rackcode(:p_rack_code_exp)").
				setParameter("p_rack_code_exp",loactionCode);
				
		List l=query.list();
		session.close();
		return l;
	}
	
	public List getAllListDetails()
	{
		ListOfList d=new ListOfList();

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_list_detail()");
			
		        List l=query.list();
		        tx.commit();
		       session.close();
			return l;
	}
	
	public List updateListDetails(
			int record_id,
			int dept_id,
			int list_id,
			String doc_subject,
			int doc_year_from,
			int doc_year_to,
			int room_no,
			int rack_no,
			String location_code,
			String box_no,
			String file_no,
			int total_cover_no,
			String remark,
			String shelf_no
				)
	{
		ListOfList d=new ListOfList();

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.update_list_details(:p_record_id,"
				+ ":p_list_id,"
				+ ":p_dept_id,"
				+ ":p_doc_subject,"
				+ ":p_doc_year_from,"
				+ ":p_doc_year_to,"
				+ ":p_room_no,"
				+ ":p_rack_no,"
				+ ":p_location_code,"
				+ ":p_box_no,"
				+ ":p_file_no,"
				+ ":p_total_cover_no,"
				+ ":p_remark,"
				+ ":p_shelf_no)")
				.setParameter("p_record_id",record_id )
				.setParameter("p_list_id",list_id )
				.setParameter("p_dept_id", dept_id)
				.setParameter("p_doc_subject", doc_subject)
				.setParameter("p_doc_year_from", doc_year_from)
				.setParameter("p_doc_year_to",doc_year_to )
				.setParameter("p_room_no", room_no)
				.setParameter("p_rack_no",rack_no )
				.setParameter("p_location_code", location_code)
				.setParameter("p_box_no", box_no)
				.setParameter("p_file_no",file_no )
				.setParameter("p_total_cover_no",total_cover_no )
				.setParameter("p_remark", remark)
				.setParameter("p_shelf_no", shelf_no);
			
		        List l=query.list();
		        tx.commit();
		       session.close();
			return l;
	}
	
	public List removeListDetailsEntry(int record_id)
	{
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.delete_list_details(:p_record_id)")
				.setParameter("p_record_id",record_id);
			
		        List l=query.list();
		        tx.commit();
		       session.close();
			return l;
	}
	
	public List getAllListDetailsBySubDept(int dept_id)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_list_detail_by_dept(:p_dept_id)")
				.setParameter("p_dept_id",dept_id);
			
		        List l=query.list();
		        tx.commit();
		       session.close();
			return l;
	}

}
