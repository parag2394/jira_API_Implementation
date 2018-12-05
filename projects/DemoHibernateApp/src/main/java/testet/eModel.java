package testet;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Name")
public class eModel 
{
@Id
private int id;

private NameDetails aname;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public NameDetails getAname() {
	return aname;
}
public void setAname(NameDetails aname) {
	this.aname = aname;
}

}
