package com.example.demo;

public class Loanapproval {

	int accnumber;
	String password;
	int nid;
	String loantype;
	double req_amount;
	String duration;
	double cash;
	String interest_rate;
	double total_amount;
	int installment;
	int paid_installment;
	double monthlypaid;
	double paid_amount;
	double due;
	String name;
	String gender;
	String mobile;
	String email;
	String address;
	String date;
	String mar_status;
	String occupation;
	String msg = null;

	public Loanapproval() {
		super();
	}

	public Loanapproval(int accnumber, String password, int nid, String loantype, double req_amount, String duration,
			double cash, String interest_rate, double total_amount, int installment, int paid_installment,
			double monthlypaid, double paid_amount, double due, String name, String gender, String mobile, String email,
			String address, String date, String mar_status, String occupation) {
		super();
		this.accnumber = accnumber;
		this.password = password;
		this.nid = nid;
		this.loantype = loantype;
		this.req_amount = req_amount;
		this.duration = duration;
		this.cash = cash;
		this.interest_rate = interest_rate;
		this.total_amount = total_amount;
		this.installment = installment;
		this.paid_installment = paid_installment;
		this.monthlypaid = monthlypaid;
		this.paid_amount = paid_amount;
		this.due = due;
		this.name = name;
		this.gender = gender;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.date = date;
		this.mar_status = mar_status;
		this.occupation = occupation;
	}

	public int getAccnumber() {
		return accnumber;
	}

	public void setAccnumber(int accnumber) {
		this.accnumber = accnumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public double getReq_amount() {
		return req_amount;
	}

	public void setReq_amount(double req_amount) {
		this.req_amount = req_amount;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public double getCash() {
		return cash;
	}

	public void setCash(double cash) {
		this.cash = cash;
	}

	public String getInterest_rate() {
		return interest_rate;
	}

	public void setInterest_rate(String interest_rate) {
		this.interest_rate = interest_rate;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	public int getInstallment() {
		return installment;
	}

	public void setInstallment(int installment) {
		this.installment = installment;
	}

	public int getPaid_installment() {
		return paid_installment;
	}

	public void setPaid_installment(int paid_installment) {
		this.paid_installment = paid_installment;
	}

	public double getMonthlypaid() {
		return monthlypaid;
	}

	public void setMonthlypaid(double monthlypaid) {
		this.monthlypaid = monthlypaid;
	}

	public double getPaid_amount() {
		return paid_amount;
	}

	public void setPaid_amount(double paid_amount) {
		this.paid_amount = paid_amount;
	}

	public double getDue() {
		return due;
	}

	public void setDue(double due) {
		this.due = due;
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

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "Loanapproval [accnumber=" + accnumber + ", password=" + password + ", nid=" + nid + ", loantype="
				+ loantype + ", req_amount=" + req_amount + ", duration=" + duration + ", cash=" + cash
				+ ", interest_rate=" + interest_rate + ", total_amount=" + total_amount + ", installment=" + installment
				+ ", paid_installment=" + paid_installment + ", monthlypaid=" + monthlypaid + ", paid_amount="
				+ paid_amount + ", due=" + due + ", name=" + name + ", gender=" + gender + ", mobile=" + mobile
				+ ", email=" + email + ", address=" + address + ", date=" + date + ", mar_status=" + mar_status
				+ ", occupation=" + occupation + ", getAccnumber()=" + getAccnumber() + ", getPassword()="
				+ getPassword() + ", getNid()=" + getNid() + ", getLoantype()=" + getLoantype() + ", getReq_amount()="
				+ getReq_amount() + ", getDuration()=" + getDuration() + ", getCash()=" + getCash()
				+ ", getInterest_rate()=" + getInterest_rate() + ", getTotal_amount()=" + getTotal_amount()
				+ ", getInstallment()=" + getInstallment() + ", getPaid_installment()=" + getPaid_installment()
				+ ", getMonthlypaid()=" + getMonthlypaid() + ", getPaid_amount()=" + getPaid_amount() + ", getDue()="
				+ getDue() + ", getName()=" + getName() + ", getGender()=" + getGender() + ", getMobile()="
				+ getMobile() + ", getEmail()=" + getEmail() + ", getAddress()=" + getAddress() + ", getDate()="
				+ getDate() + ", getMar_status()=" + getMar_status() + ", getOccupation()=" + getOccupation()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
