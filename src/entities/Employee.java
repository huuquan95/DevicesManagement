package entities;

import java.util.Date;

public class Employee {
	private String id;
	private String name;
	private Date birthday;
	private String address;
	private String phone;
	private String picture;
	private String id_Position;
	private String postion;
	private String id_Team;
	private String nameTeam;

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

	public String getPostion() {
		return postion;
	}

	public void setPostion(String postion) {
		this.postion = postion;
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
