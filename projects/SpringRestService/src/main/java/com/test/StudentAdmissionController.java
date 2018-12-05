package com.test;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StudentAdmissionController {
	
	@ResponseBody
	@RequestMapping(value="/students",method=RequestMethod.GET)
	public ArrayList<Student> getStudentsList()
	

	{
		Student s1=new Student();
	    s1.setStudentName("Ravi");
	    
	    Student s2=new Student();
	    s2.setStudentName("Rahul");
	    
	    Student s3=new Student();
	    s3.setStudentName("Raghav");
	    
	    ArrayList<Student> studentList=new ArrayList<Student>();
	    
	    studentList.add(s1);
	    studentList.add(s2);
	    studentList.add(s3);
	    
		return studentList;
	}

}
