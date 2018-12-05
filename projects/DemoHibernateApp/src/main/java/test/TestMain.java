package test;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		empModel e=new empModel();
		e.setId(3);
		e.setName("Rahul");
		
		Configuration con=new Configuration().configure().addAnnotatedClass(empModel.class);
		
		ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		
		SessionFactory sf=con.buildSessionFactory(reg);
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		session.save(e);
		tx.commit();

	}

}
