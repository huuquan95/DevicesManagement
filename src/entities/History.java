package entities;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class History {
	private int id;
	private int id_Account;
	private String id_Equipment;
	
	@NotNull(message = "Do not be empty")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date timeStart;
	
	private String action;
	private String seri_number;
	
	private String name;
	private String username;
	
	@NotNull(message = "Do not be empty")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date_start = new Date();
	
	private String picture = "";
	private int idCat = 0;
	private String nameCat = "";
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
	public String getId_Equipment() {
		return id_Equipment;
	}
	public void setId_Equipment(String id_Equipment) {
		this.id_Equipment = id_Equipment;
	}
	public Date getTimeStart() {
		return timeStart;
	}
	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getSeri_number() {
		return seri_number;
	}
	public void setSeri_number(String seri_number) {
		this.seri_number = seri_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getDate_start() {
		return date_start;
	}
	public void setDate_start(Date date_start) {
		this.date_start = date_start;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getIdCat() {
		return idCat;
	}
	public void setIdCat(int idCat) {
		this.idCat = idCat;
	}
	public String getNameCat() {
		return nameCat;
	}
	public void setNameCat(String nameCat) {
		this.nameCat = nameCat;
	}
	

	
	
}