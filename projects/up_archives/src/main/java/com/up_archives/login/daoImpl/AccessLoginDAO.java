package com.up_archives.login.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.up_archives.login.dao.LoginDAO;
import com.up_archives.login.model.Login;
import com.up_archives.util.HibernateUtil;



public class AccessLoginDAO implements LoginDAO {

	public List authenticate_user(String username,String password)
	{
		Login l=new Login();

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM public.authenticate_user(:p_username,:p_password)")
				.setParameter("p_username", username)
				.setParameter("p_password", password);
		List<Object[]> list=query.list();
		
		session.close();
		 return list;
		
	}
	
}
