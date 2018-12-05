package com.test.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student_info student=new Student_info();
		student.setName("ravi");
		student.setRollNo(1);

		
		
	}
	 public int saveStudent(String firstName, String lastName, String section) {
	       	 
		 Student_info student=new Student_info();
			student.setName("ravi");
			student.setRollNo(1);
			
	        Session session = HivernateUtil.getSessionFactory().openSession();
	        session.beginTransaction();
	 
	         session.save(student);
	        session.getTransaction().commit();
	        session.close();
	        return 1;
	    }
	 

}
