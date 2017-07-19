package entities;

import org.hibernate.validator.constraints.NotEmpty;

public class Team {
	private String id;
	@NotEmpty(message="Name is not null!")
	private String name;

	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
