package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDA {
	
//	------------------------------Check balance by User ---------------

	public Createaccount checkBalancebyUser(double a_number, String password) {
		Createaccount e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from createaccount where a_number=? and password=?");

			ps.setDouble(1, a_number);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				e = new Createaccount(rs.getDouble(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12), rs.getDouble(13));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}
	

	// --------------- user application for create account----------

	public Applyaccount createaccount(Applyaccount s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("INSERT INTO applyaccount VALUES(?,?,?,?,?,?,?,?,?,?)");

			ps.setDouble(1, s.getNid());
			ps.setString(2, s.getAcctype());
			ps.setString(3, s.getName());
			ps.setString(4, s.getGender());
			ps.setString(5, s.getMobile());
			ps.setString(6, s.getEmail());
			ps.setString(7, s.getAddress());
			ps.setString(8, s.getDate());
			ps.setString(9, s.getMar_status());
			ps.setString(10, s.getOccupation());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

	// ------------------------------ show all customer data------------

	public List<Createaccount> showallCustomer() {
		
		List<Createaccount> slist = new ArrayList<>();
		
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from createaccount");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				slist.add(new Createaccount(rs.getDouble(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12), rs.getDouble(13)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist;
	}

//	--------------------------------- update user data ----------------------------

	public Createaccount update(Createaccount s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement(
					"update createaccount set password=?, nid=?, acctype=?, name=?, gender=?, mobile=?, email=?, address=?, date=?, mar_status=?, occupation=?, balance=? where a_number=?");

			ps.setString(1, s.getPassword());
			ps.setDouble(2, s.getNid());
			ps.setString(3, s.getAcctype());
			ps.setString(4, s.getName());
			ps.setString(5, s.getGender());
			ps.setString(6, s.getMobile());
			ps.setString(7, s.getEmail());
			ps.setString(8, s.getAddress());
			ps.setString(9, s.getDate());
			ps.setString(10, s.getMar_status());
			ps.setString(11, s.getOccupation());
			ps.setDouble(12, s.getBalance());
			ps.setDouble(13, s.getA_number());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

//	---------------------------------delete user data ----------------------------

	public Createaccount delete(Createaccount s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from createaccount where a_number=?");

			ps.setDouble(1, s.getA_number());
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}
	
//	---------------------------------delete just on click way ---------------------------- 

	public Createaccount deleteonclick(double a_number) {
		Createaccount e=null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from createaccount where a_number=?");

			ps.setDouble(1, a_number);
			ps.executeUpdate();

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}
	

}
