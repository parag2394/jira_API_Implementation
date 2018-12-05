package test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class Test1 
{
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		empModel e=null;
		
		
	//	e.getId();
	//	e.getName();
		
		Configuration con=new Configuration().configure().addAnnotatedClass(empModel.class);
		
		ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		
		SessionFactory sf=con.buildSessionFactory(reg);
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		e=(empModel)session.get(empModel.class,2);
		System.out.println(e);
		//session.save(e);
		tx.commit();

	}
}
