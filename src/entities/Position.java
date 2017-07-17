package entities;

import org.hibernate.validator.constraints.NotEmpty;

public class Position {
public int id;
	
	@NotEmpty(message="Name is not null!")
	public String  namePos;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNamePos() {
		return namePos;
	}
	public void setNamePos(String namePos) {
		this.namePos = namePos;
	}
	
}
