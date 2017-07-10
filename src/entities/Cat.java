package entities;

import org.hibernate.validator.constraints.NotEmpty;

public class Cat {

	public int id;
	
	@NotEmpty(message="Name is not null!")
	public String  name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	 
	
}
