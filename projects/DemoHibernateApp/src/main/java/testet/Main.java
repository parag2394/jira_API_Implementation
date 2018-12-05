package testet;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import test.empModel;

public class Main {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		NameDetails n=new NameDetails();
		n.setFirstName("ravi");
		n.setLastName("yadav");
		eModel e=new eModel();
	
		e.setId(1);
		e.setAname(n);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(eModel.class);
		
		ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		
		SessionFactory sf=con.buildSessionFactory(reg);
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		session.save(e);
		tx.commit();

	}

}
