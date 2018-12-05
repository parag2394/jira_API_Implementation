package com.up_archives.metadata.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.up_archives.metadata.dao.MetaDataDAO;
import com.up_archives.util.HibernateUtil;


public class AccessMetaDataDAO implements MetaDataDAO {
	
	public List show_documnet_metadata()
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.show_document_meta_data()");
		List l=query.list();
		tx.commit();
        session.close();
		 return l;
	}

	public List get_metadata_list_details(int deptid) {
	
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.fun_show_list_details_metadata(:p_department_code)")
				.setParameter("p_department_code", deptid);
		List l=query.list();
		tx.commit();
        session.close();
		 return l;
		
	}
	
	public List set_doc_status(int record_id)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.set_document_status(:p_record_id)")
				.setParameter("p_record_id", record_id);
		List l=query.list();
		tx.commit();
        session.close();
		 return l;	
	}
	
	
	public List get_metadata_list_details_by_id(int record_id)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.fun_show_list_details_metadatabyid(:p_record_id)")
				.setParameter("p_record_id", record_id);
		List l=query.list();
		tx.commit();
        session.close();
		 return l;
	}
	
	public List set_meta_data(
			
			    int p_list_id,
				String p_sub_list_id,
				int p_room_no,
				int p_dept_id,
				int p_sub_dept_id,
				int p_rack_no,
			    String p_shelf_no,
			    String p_box_no,
			    String p_file_no,
			    int p_total_cover_no,
			    int p_doc_year_from,
			    int p_doc_year_to,
			    String p_doc_path,
			    String p_doc_subject,
			    String p_remark,
			    String p_file_name
			    
			
			)
	
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery)
				session.createSQLQuery("SELECT * FROM public.set_document_meta_data(:p_list_id,:p_sub_list_id,"
						+ ":p_room_no,:p_dept_id,:p_sub_dept_id,:p_rack_no,:p_shelf_no,:p_box_no,:p_file_no,:p_total_cover_no,"
						+ ":p_doc_year_from,:p_doc_year_to,:p_doc_path,:p_doc_subject,:p_remark,:p_file_name)")
				.setParameter("p_list_id",p_list_id)
				.setParameter("p_sub_list_id",p_sub_list_id)
				.setParameter("p_room_no",p_room_no)
				.setParameter("p_dept_id",p_dept_id)
				.setParameter("p_sub_dept_id",p_sub_dept_id)
				.setParameter("p_rack_no",p_rack_no)
				.setParameter("p_shelf_no",p_shelf_no)
				.setParameter("p_box_no",p_box_no)
				.setParameter("p_file_no",p_file_no)
				.setParameter("p_total_cover_no",p_total_cover_no)
				.setParameter("p_doc_year_from",p_doc_year_from)
				.setParameter("p_doc_year_to",p_doc_year_to)
				.setParameter("p_doc_path",p_doc_path)
				.setParameter("p_doc_subject",p_doc_subject)
				.setParameter("p_remark",p_remark)
				.setParameter("p_file_name",p_file_name)
				;
		List l=query.list();
		tx.commit();
        session.close();
		 return l;
	}
	
	
	
	
	public List update_metadata(
			int p_record_id,
			int p_list_id,
			String p_sub_list_id,
			String p_file_no,
		    int p_total_cover_no,
		    String p_doc_path
			
			)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.update_metadata(:p_record_id,"
				+ ":p_list_id,:p_sub_list_id,:p_file_no,:p_total_cover_no,:p_doc_path)")
				.setParameter("p_record_id", p_record_id)
				.setParameter("p_list_id", p_list_id)
				.setParameter("p_sub_list_id", p_sub_list_id)
				.setParameter("p_file_no", p_file_no)
				.setParameter("p_total_cover_no", p_total_cover_no)
				.setParameter("p_doc_path", p_doc_path);
		List l=query.list();
		tx.commit();
        session.close();
		 return l;
	}

	
	

}
