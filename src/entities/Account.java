package entities;

public class Account {
	private int id;
	private String username;
	private String password;
	private String role;
	private String id_Employee;
	private String name;
	private String picture;
	private int enabled;
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Account(int id, String username, String password, String role, String id_Employee, String name,
			String picture, int enabled) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.role = role;
		this.id_Employee = id_Employee;
		this.name = name;
		this.picture = picture;
		this.enabled = enabled;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getId_Employee() {
		return id_Employee;
	}
	public void setId_Employee(String id_Employee) {
		this.id_Employee = id_Employee;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	
}
