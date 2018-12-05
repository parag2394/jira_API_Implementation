package oneToOne;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import test.empModel;

public class AppTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		laptop l=new laptop();
		l.setLid(101);
		l.setLname("dell");
		
		Student s=new Student();
		s.setRollno(1);
		s.setName("ravi");
		s.setMarks("70");
		s.setLaptop(l);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(laptop.class).addAnnotatedClass(Student.class);
		
		ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		
		SessionFactory sf=con.buildSessionFactory(reg);
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		session.save(l);
		session.save(s);
		tx.commit();

	}
	
}
