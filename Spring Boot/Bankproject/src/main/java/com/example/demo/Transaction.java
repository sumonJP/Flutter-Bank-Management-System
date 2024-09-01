package com.example.demo;

import java.util.Date;

public class Transaction {
	
	int tid;
	String ttype;
	double a_number;
	String a_type;
	double prebalance;
	double tamount;
	double curbalance;
	Date date;
	String time;
	double toacc_number;
	
	public Transaction() {
		super();
	}

	public Transaction(int tid, String ttype, double a_number, String a_type, double prebalance, double tamount,
			double curbalance, Date date, String time, double toacc_number) {
		super();
		this.tid = tid;
		this.ttype = ttype;
		this.a_number = a_number;
		this.a_type = a_type;
		this.prebalance = prebalance;
		this.tamount = tamount;
		this.curbalance = curbalance;
		this.date = date;
		this.time = time;
		this.toacc_number = toacc_number;
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

	public double getA_number() {
		return a_number;
	}

	public void setA_number(double a_number) {
		this.a_number = a_number;
	}

	public String getA_type() {
		return a_type;
	}

	public void setA_type(String a_type) {
		this.a_type = a_type;
	}

	public double getPrebalance() {
		return prebalance;
	}

	public void setPrebalance(double prebalance) {
		this.prebalance = prebalance;
	}

	public double getTamount() {
		return tamount;
	}

	public void setTamount(double tamount) {
		this.tamount = tamount;
	}

	public double getCurbalance() {
		return curbalance;
	}

	public void setCurbalance(double curbalance) {
		this.curbalance = curbalance;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getToacc_number() {
		return toacc_number;
	}

	public void setToacc_number(double toacc_number) {
		this.toacc_number = toacc_number;
	}

	@Override
	public String toString() {
		return "Transaction [tid=" + tid + ", ttype=" + ttype + ", a_number=" + a_number + ", a_type=" + a_type
				+ ", prebalance=" + prebalance + ", tamount=" + tamount + ", curbalance=" + curbalance + ", date="
				+ date + ", time=" + time + ", toacc_number=" + toacc_number + ", getTid()=" + getTid()
				+ ", getTtype()=" + getTtype() + ", getA_number()=" + getA_number() + ", getA_type()=" + getA_type()
				+ ", getPrebalance()=" + getPrebalance() + ", getTamount()=" + getTamount() + ", getCurbalance()="
				+ getCurbalance() + ", getDate()=" + getDate() + ", getTime()=" + getTime() + ", getToacc_number()="
				+ getToacc_number() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
		

}
