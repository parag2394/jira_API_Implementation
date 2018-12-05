package OneToMany;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Laptop1 {

	@Id
	private int lid;
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	private String lname;
}
