package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Applyforloan {
	
	@Id
	int nid;
	String loantype;
	String name;
	String gender;
	String mobile;
	String email;
	String address;
	String date;
	String mar_status;
	String occupation;
	double amount;
	String duration;
	
	public Applyforloan() {
		super();
	}

	public Applyforloan(int nid, String loantype, String name, String gender, String mobile, String email,
			String address, String date, String mar_status, String occupation, double amount, String duration) {
		super();
		this.nid = nid;
		this.loantype = loantype;
		this.name = name;
		this.gender = gender;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.date = date;
		this.mar_status = mar_status;
		this.occupation = occupation;
		this.amount = amount;
		this.duration = duration;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getLoantype() {
		return loantype;
	}

	public void setLoantype(String loantype) {
		this.loantype = loantype;
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

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "Applyforloan [nid=" + nid + ", loantype=" + loantype + ", name=" + name + ", gender=" + gender
				+ ", mobile=" + mobile + ", email=" + email + ", address=" + address + ", date=" + date
				+ ", mar_status=" + mar_status + ", occupation=" + occupation + ", amount=" + amount + ", duration="
				+ duration + ", getNid()=" + getNid() + ", getLoantype()=" + getLoantype() + ", getName()=" + getName()
				+ ", getGender()=" + getGender() + ", getMobile()=" + getMobile() + ", getEmail()=" + getEmail()
				+ ", getAddress()=" + getAddress() + ", getDate()=" + getDate() + ", getMar_status()=" + getMar_status()
				+ ", getOccupation()=" + getOccupation() + ", getAmount()=" + getAmount() + ", getDuration()="
				+ getDuration() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
		

}
