package oneToOne;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Student {

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
	
	@OneToOne
	private laptop laptop;

	public laptop getLaptop() {
		return laptop;
	}
	public void setLaptop(laptop laptop) {
		this.laptop = laptop;
	}
	
}
