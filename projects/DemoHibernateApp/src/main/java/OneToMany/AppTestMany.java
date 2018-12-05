package OneToMany;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


public class AppTestMany {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Laptop1 l=new Laptop1();
		l.setLid(102);
		l.setLname("HP");
		
		Student1 s=new Student1();
		s.setRollno(2);
		s.setName("rahul");
		s.setMarks("60");
		s.getLaptop1().add(l);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Laptop1.class).addAnnotatedClass(Student1.class);
		
		ServiceRegistry reg=new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		
		SessionFactory sf=con.buildSessionFactory(reg);
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		session.save(l);
		session.save(s);
		tx.commit();

	}

	
	
}
