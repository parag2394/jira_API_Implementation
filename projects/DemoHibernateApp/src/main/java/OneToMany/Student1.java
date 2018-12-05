package OneToMany;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Student1 {
	@Id
	private int rollno;
	
	public int getRollno() {
		return rollno;
	}
	public void setRollno(int rollno) {
		this.rollno = rollno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMarks() {
		return marks;
	}
	public void setMarks(String marks) {
		this.marks = marks;
	}
	private String name;
	private String marks;
	
	@OneToMany
	private List<Laptop1> laptop1=new ArrayList<Laptop1>();

	public List<Laptop1> getLaptop1() {
		return laptop1;
	}
	public void setLaptop1(List<Laptop1> laptop1) {
		this.laptop1 = laptop1;
	}

	
}
