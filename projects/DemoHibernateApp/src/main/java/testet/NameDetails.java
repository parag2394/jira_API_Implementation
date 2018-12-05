package testet;

import javax.persistence.Embeddable;

@Embeddable
public class NameDetails
{
private String firstName;
private String lastName;
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
@Override
public String toString() {
	return "NameDetails [firstName=" + firstName + ", lastName=" + lastName + "]";
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
}
