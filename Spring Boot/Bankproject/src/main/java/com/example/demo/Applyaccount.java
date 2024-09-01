package com.example.demo;

public class Applyaccount {
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

	public Applyaccount() {
		super();
	}

	public Applyaccount(double nid, String acctype, String name, String gender, String mobile, String email,
			String address, String date, String mar_status, String occupation) {
		super();
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

	@Override
	public String toString() {
		return "Applyaccount [nid=" + nid + ", acctype=" + acctype + ", name=" + name + ", gender=" + gender
				+ ", mobile=" + mobile + ", email=" + email + ", address=" + address + ", date=" + date
				+ ", mar_status=" + mar_status + ", occupation=" + occupation + ", getNid()=" + getNid()
				+ ", getAcctype()=" + getAcctype() + ", getName()=" + getName() + ", getGender()=" + getGender()
				+ ", getMobile()=" + getMobile() + ", getEmail()=" + getEmail() + ", getAddress()=" + getAddress()
				+ ", getDate()=" + getDate() + ", getMar_status()=" + getMar_status() + ", getOccupation()="
				+ getOccupation() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	

}
