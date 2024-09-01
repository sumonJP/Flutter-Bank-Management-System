package com.example.demo;

public class Createaccount {

	double a_number;
	String password;
	double nid;
	String acctype;
	String name;
	String gender;
	String mobile;
	String email;
	String address;
	String date;
	String mar_status;
	String occupation;
	double balance;
	String img;
	String msg=null;
	
	public Createaccount() {
		super();
	}

	public Createaccount(double a_number, String password, double nid, String acctype, String name, String gender,
			String mobile, String email, String address, String date, String mar_status, String occupation,
			double balance) {
		super();
		this.a_number = a_number;
		this.password = password;
		this.nid = nid;
		this.acctype = acctype;
		this.name = name;
		this.gender = gender;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.date = date;
		this.mar_status = mar_status;
		this.occupation = occupation;
		this.balance = balance;
	}

	public double getA_number() {
		return a_number;
	}

	public void setA_number(double a_number) {
		this.a_number = a_number;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getNid() {
		return nid;
	}

	public void setNid(double nid) {
		this.nid = nid;
	}

	public String getAcctype() {
		return acctype;
	}

	public void setAcctype(String acctype) {
		this.acctype = acctype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMar_status() {
		return mar_status;
	}

	public void setMar_status(String mar_status) {
		this.mar_status = mar_status;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Createaccount [a_number=" + a_number + ", password=" + password + ", nid=" + nid + ", acctype="
				+ acctype + ", name=" + name + ", gender=" + gender + ", mobile=" + mobile + ", email=" + email
				+ ", address=" + address + ", date=" + date + ", mar_status=" + mar_status + ", occupation="
				+ occupation + ", balance=" + balance + ", getA_number()=" + getA_number() + ", getPassword()="
				+ getPassword() + ", getNid()=" + getNid() + ", getAcctype()=" + getAcctype() + ", getName()="
				+ getName() + ", getGender()=" + getGender() + ", getMobile()=" + getMobile() + ", getEmail()="
				+ getEmail() + ", getAddress()=" + getAddress() + ", getDate()=" + getDate() + ", getMar_status()="
				+ getMar_status() + ", getOccupation()=" + getOccupation() + ", getBalance()=" + getBalance()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
	
}
