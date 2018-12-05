package com.test;

import java.util.ArrayList;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@RestController
public class StrudentRestController {
	
	
	@RequestMapping(value="/studentsRest",method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
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
	
	

	@RequestMapping(value="/students/{name}",method=RequestMethod.PUT,consumes = MediaType.APPLICATION_JSON_VALUE)
	public boolean updateStudentsList(@PathVariable("name")String studentName,@RequestBody Student std)
	{
		
		System.out.println("Student name is "+studentName);
		System.out.println("updated Student name is "+std.getStudentName()+"updated age is "+std.getAge());
		
	    	    
		return true;
	}
	
	@RequestMapping(value="/studentsUpdate/{name}",method=RequestMethod.PUT,consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean>updateStudentsListConsumesDemo(@PathVariable("name")String studentName,@RequestBody Student std)
	{
		
		System.out.println("Student name is "+studentName);
		System.out.println("updated Student name is "+std.getStudentName()+"updated age is "+std.getAge());
		
		HttpHeaders http=new HttpHeaders();
		http.add("Key1","value1");
		http.add("key2","Value2");
	    	    
		return new ResponseEntity<Boolean>(true,http,HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/students",method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean>updateStudentsListConsumesDemo(@RequestBody Student std)
	{
		
	
		System.out.println("updated Student name is "+std.getStudentName()+"updated age is "+std.getAge());
		
		HttpHeaders http=new HttpHeaders();
		http.add("Location",ServletUriComponentsBuilder.fromCurrentRequest()
				.path("/{name}")
				.buildAndExpand(std.getStudentName())
				.toUri()
				.toString());
				
	
	    	    
		return new ResponseEntity<Boolean>(true,http,HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/students/{name}",method=RequestMethod.DELETE,consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean>deleteStudent(@PathVariable("name")String studentName,@RequestBody Student std)
	{
		
		System.out.println("Student name is "+studentName);
		System.out.println("updated Student name is "+std.getStudentName()+"updated age is "+std.getAge());
		
		HttpHeaders http=new HttpHeaders();
		http.add("Key1","value1");
		http.add("key2","Value2");
	    	    
		return new ResponseEntity<Boolean>(true,http,HttpStatus.OK);
	}
	

}
