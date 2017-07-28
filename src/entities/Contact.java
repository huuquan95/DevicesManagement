package entities;

import org.hibernate.validator.constraints.NotEmpty;

public class Contact {

	int id;
	int id_Account;
	String status;
	@NotEmpty(message = "Please input")
	String description;
	String userName;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Contact() {
	}

	public Contact(int id_Account, String description) {
		this.id_Account = id_Account;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_Account() {
		return id_Account;
	}

	public void setId_Account(int id_Account) {
		this.id_Account = id_Account;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
