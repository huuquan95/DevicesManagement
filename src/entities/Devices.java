package entities;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Value;

public class Devices {

	@NotEmpty(message="ID is required!")
	private String id;
	
	@NotEmpty(message="Seri_number is required!")
	private String seri_number;
	
//	@NotEmpty(message="You have to choose it!")
	
	//@Pattern(regexp = "[1-9]", message = "You have to choose it!")
	@NotNull(message="You have to choose it!")
	@Value("#{new Integer.parseInt('${api.orders.idAccount}')}")
	
	private int idAccount;
	
	//@NotEmpty(message="You have to choose it!")
	//@NotNull(message="You have to choose it!")
	private int idCat;
	
	@NotEmpty(message="Name is required!")
	private String name;
	
	@NotEmpty(message="Made in is required!")
	private String made_in;
	
	@NotEmpty(message="Price is required!")
	private String price;
	
	@NotEmpty(message="Warranty is required!")
	private String warranty;
	
	@NotNull(message="You have to choose it!")
	private int isnew;
	
	@NotEmpty(message="Status is required!")
	private String status;
	
	private String picture;
	
	private String date_start;
	
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSeri_number() {
		return seri_number;
	}
	public void setSeri_number(String seri_number) {
		this.seri_number = seri_number;
	}
	public int getIdAccount() {
		return idAccount;
	}
	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}
	public int getIdCat() {
		return idCat;
	}
	public void setIdCat(int idCat) {
		this.idCat = idCat;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMade_in() {
		return made_in;
	}
	public void setMade_in(String made_in) {
		this.made_in = made_in;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getWarranty() {
		return warranty;
	}
	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}
	public int getIsnew() {
		return isnew;
	}
	public void setIsnew(int isnew) {
		this.isnew = isnew;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	private String cname;
	private String username;


	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
