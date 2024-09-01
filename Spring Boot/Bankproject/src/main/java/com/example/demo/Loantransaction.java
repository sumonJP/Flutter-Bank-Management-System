package com.example.demo;

public class Loantransaction {

	int tid;
	String ttype;
	int accnumber;
	String loantype;
	int totalinstallment;
	int payinstallment;
	double paidamount;
	double dueamount;
	String date;
	
	public Loantransaction() {
		super();
	}

	public Loantransaction(int tid, String ttype, int accnumber, String loantype, int totalinstallment,
			int payinstallment, double paidamount, double dueamount, String date) {
		super();
		this.tid = tid;
		this.ttype = ttype;
		this.accnumber = accnumber;
		this.loantype = loantype;
		this.totalinstallment = totalinstallment;
		this.payinstallment = payinstallment;
		this.paidamount = paidamount;
		this.dueamount = dueamount;
		this.date = date;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTtype() {
		return ttype;
	}

	public void setTtype(String ttype) {
		this.ttype = ttype;
	}

	public int getAccnumber() {
		return accnumber;
	}

	public void setAccnumber(int accnumber) {
		this.accnumber = accnumber;
	}

	public String getLoantype() {
		return loantype;
	}

	public void setLoantype(String loantype) {
		this.loantype = loantype;
	}

	public int getTotalinstallment() {
		return totalinstallment;
	}

	public void setTotalinstallment(int totalinstallment) {
		this.totalinstallment = totalinstallment;
	}

	public int getPayinstallment() {
		return payinstallment;
	}

	public void setPayinstallment(int payinstallment) {
		this.payinstallment = payinstallment;
	}

	public double getPaidamount() {
		return paidamount;
	}

	public void setPaidamount(double paidamount) {
		this.paidamount = paidamount;
	}

	public double getDueamount() {
		return dueamount;
	}

	public void setDueamount(double dueamount) {
		this.dueamount = dueamount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Loantransaction [tid=" + tid + ", ttype=" + ttype + ", accnumber=" + accnumber + ", loantype="
				+ loantype + ", totalinstallment=" + totalinstallment + ", payinstallment=" + payinstallment
				+ ", paidamount=" + paidamount + ", dueamount=" + dueamount + ", date=" + date + ", getTid()="
				+ getTid() + ", getTtype()=" + getTtype() + ", getAccnumber()=" + getAccnumber() + ", getLoantype()="
				+ getLoantype() + ", getTotalinstallment()=" + getTotalinstallment() + ", getPayinstallment()="
				+ getPayinstallment() + ", getPaidamount()=" + getPaidamount() + ", getDueamount()=" + getDueamount()
				+ ", getDate()=" + getDate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
