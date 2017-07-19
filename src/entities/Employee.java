package entities;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
	@NotEmpty(message = "Do not be empty")
	private String id;
	
	@NotEmpty(message = "Do not be empty")
	private String name;
	
	@NotNull(message = "Do not be empty")
	 @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	
	@NotEmpty(message = "Do not be empty")
	private String address;
	
	@NotEmpty(message = "Do not be empty")
	@Pattern(regexp="(^$|[0-9]{10}|[0-9]{11})",message = "Wrong.Please enter format phonenumber")
	private String phone;
	
	private String picture;
	private String id_Position;
	private String namePos;
	private String id_Team;
	private String nameTeam;
	
	@NotEmpty(message = "Do not be empty")
	@Email
	private String email;
	
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getId_Position() {
		return id_Position;
	}

	public void setId_Position(String id_Position) {
		this.id_Position = id_Position;
	}

	

	public String getNamePos() {
		return namePos;
	}

	public void setNamePos(String namePos) {
		this.namePos = namePos;
	}

	public String getId_Team() {
		return id_Team;
	}

	public void setId_Team(String id_Team) {
		this.id_Team = id_Team;
	}

	public String getNameTeam() {
		return nameTeam;
	}

	public void setNameTeam(String nameTeam) {
		this.nameTeam = nameTeam;
	}


}
