package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDA {
	
//	---------------- Flutter// search by account no. & get account info ----------------- 
	
	public List<Createaccount> searchaccnumber_getinfo(double a_number) {
		List<Createaccount> stlist = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abcd", "root", "nclc123456");
			PreparedStatement	pstmt = con.prepareStatement("select * from createaccount where a_number=" + a_number);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Createaccount ac=new Createaccount(rs.getDouble(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12), rs.getDouble(13));
				
				ac.setImg(rs.getString(14)); 
				
				stlist.add(ac);
			}
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return stlist;
	}
	
//	---------------- Flutter// search & get loan statement ----------------- 
	
	public List<Loantransaction> searchAndgetloanstate(int accnumber) {
		List<Loantransaction> stlist = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abcd", "root", "nclc123456");
			PreparedStatement	pstmt = con.prepareStatement("select * from loantransaction where accnumber=?");
			pstmt.setInt(1, accnumber);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				stlist.add(new Loantransaction(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getInt(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9)));
			}
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return stlist;
	}
	
//	------------------------------Check balance by User // flutter ---------------

	public List<Createaccount> getAndCheck(double a_number, String password) {
		List<Createaccount> stlist = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from createaccount where a_number=? and password=?");

			ps.setDouble(1, a_number);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Createaccount ac= new Createaccount(rs.getDouble(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12), rs.getDouble(13));
				ac.setImg(rs.getString(14)); 
				stlist.add(ac);
				
			}
			con.close();

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return stlist;
	}

//	-------------------- Admin login ---------------------- 

	public Admin login(int id, String password) {
		Admin e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from admin where id=? AND password=?");

			ps.setInt(1, id);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				e = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}
	
//	-------------------- Admin login // Flutter part---------------------- 
	
	public Admin adminSignin(int id, String password) {
		Admin s = new Admin();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement pstmt = con.prepareStatement("select * from admin where id="+id+" AND password='"+password+"'");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				s =new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}
			
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return s;
	}

//	public Admin adminSignin(int id, String password) {
//		Admin e = null;
//		try {
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
//			PreparedStatement ps = con.prepareStatement("select * from admin where id=? AND password=?");
//
//			ps.setInt(1, id);
//			ps.setString(2, password);
//			ResultSet rs = ps.executeQuery();
//
//			while (rs.next()) {
//				e = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
//						rs.getString(6), rs.getString(7));
//			}
//
//		} catch (Exception ex) {
//			// TODO: handle exception
//		}
//
//		return e;
//	}

//	--------------------  search by admin Id and get ----------------------

	public Admin searchAdmin(int id) {
		Admin e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from admin where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				e = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

	// ------------- show application for account/ admin page ya --------

	public List<Applyaccount> showapplyaccount() {
		List<Applyaccount> applydata = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from applyaccount");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				applydata.add(new Applyaccount(rs.getDouble(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return applydata;
	}

	// ---------------------- search and get bank statement -------------------

	public List<Transaction> serachbankstatement(double a_number, String predate, String curdate) {
		List<Transaction> slist1 = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from transaction where a_number=? and date BETWEEN '"
					+ predate + "' AND '" + curdate + "'");

			ps.setDouble(1, a_number);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				slist1.add(new Transaction(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDate(8), rs.getString(9),
						rs.getDouble(10)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist1;
	}

//	------------------------ show all admin info ---------------------

	public List<Admin> show_admin() {
		List<Admin> slist = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from admin");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				slist.add(new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist;
	}
	
//	------------------------ show all Customer transaction---------------------

	public List<Transaction> showalltransaction() {
		List<Transaction> slist = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from transaction");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				slist.add(new Transaction(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDate(8), rs.getString(9),
						rs.getDouble(10)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist;
	}
	
//	------------------------ show all Customer Loan transaction---------------------

	public List<Loantransaction> showallloantransaction() {
		List<Loantransaction> slist = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from loantransaction");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				slist.add(new Loantransaction(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getInt(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist;
	}

//--------------------------------- update Admin account----------------------------

	public Admin update(Admin s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement(
					"update admin set password=?, name=?, gender=?, email=?, phone=?, address=? where id=?");

			ps.setString(1, s.getPassword());
			ps.setString(2, s.getName());
			ps.setString(3, s.getGender());
			ps.setString(4, s.getEmail());
			ps.setString(5, s.getPhone());
			ps.setString(6, s.getAddress());
			ps.setInt(7, s.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

	// --------------------------------- delete loan
	// account----------------------------

	public Loanapproval deleteloanaccount(int accnumber) {
		Loanapproval s = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from loanapproval where accnumber=?");

			ps.setInt(1, accnumber);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

//--------------------------------- delete Admin account----------------------------

	public Admin delete(Admin s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from admin where id=?");

			ps.setInt(1, s.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

	// ---------------------- delete Admin account by id same page ya----------

	public Admin deleteAdminbyId(int id) {
		Admin e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from admin where id=?");

			ps.setInt(1, id);
			ps.executeUpdate();

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

//-------------------- Get user By Nid from applyaccount table ----------------------

	public Applyaccount searchByNid(double nid) {
		Applyaccount e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from applyaccount where nid=?");
			ps.setDouble(1, nid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				e = new Applyaccount(rs.getDouble(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

	// ----------- Get loan user By Nid --------------------------------

	public Applyforloan searchloanByNid(int nid) {
		Applyforloan e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from applyforloan where nid=?");

			ps.setInt(1, nid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				e = new Applyforloan(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getDouble(11), rs.getString(12));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

	// -------- delete Apply for loan by nid ---------------------

	public Applyforloan deleteloanapply(int nid) {

		Applyforloan e = null;

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from applyforloan where nid=?");

			ps.setInt(1, nid);
			ps.executeUpdate();

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

	// ---------- delete Apply for new account by nid --------------------

	public Applyaccount deleteaccountapply(double nid) {

		Applyaccount e = null;

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from applyaccount where nid=?");

			ps.setDouble(1, nid);
			ps.executeUpdate();

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

	// ---------------Admin Reject application for account-----------------

	public Applyaccount rejectaccount(Applyaccount s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("delete from applyaccount where nid=?");

			ps.setDouble(1, s.getNid());
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

//-------------------------- admin add ==>> customer account----------

	public Createaccount adduseraccount(Createaccount s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("insert into createaccount VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

			ps.setDouble(1, s.getA_number());
			ps.setString(2, s.getPassword());
			ps.setDouble(3, s.getNid());
			ps.setString(4, s.getAcctype());
			ps.setString(5, s.getName());
			ps.setString(6, s.getGender());
			ps.setString(7, s.getMobile());
			ps.setString(8, s.getEmail());
			ps.setString(9, s.getAddress());
			ps.setString(10, s.getDate());
			ps.setString(11, s.getMar_status());
			ps.setString(12, s.getOccupation());
			ps.setDouble(13, s.getBalance());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

//	------------------------------ search an user account and get details ---------------

	public Createaccount searchByAccountnumber(double a_number) {
		Createaccount e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from createaccount where a_number=?");

			ps.setDouble(1, a_number);
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

//	------------------------------ search and get loan statement ---------------

	public List<Loantransaction> searchloanstatement(int accnumber) {
		List<Loantransaction> slist = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from loantransaction where accnumber=?");
			ps.setInt(1, accnumber);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				slist.add(new Loantransaction(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getInt(5), rs.getInt(6), rs.getDouble(7), rs.getDouble(8), rs.getString(9)));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return slist;
	}

//	------------------------------Deposit by admin/transection table ya o add ---------------

	public Createaccount deposit(double a_number, double deposit) {
		Createaccount e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from createaccount where a_number=?");

			ps.setDouble(1, a_number);

			ResultSet rs = ps.executeQuery();

			double prebalance = 0;
			double newbalance = 0;
			String accType = "";

			while (rs.next()) {
				prebalance = rs.getDouble(13);
				accType = rs.getString(4);
				newbalance = prebalance + deposit;

				e = new Createaccount(rs.getDouble(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12), newbalance);
			}

			PreparedStatement ps1 = con.prepareStatement("update createaccount set balance=? where a_number=?");
			ps1.setDouble(1, newbalance);
			ps1.setDouble(2, a_number);
			ps1.executeUpdate();

			PreparedStatement ps2 = con.prepareStatement(
					"insert into transaction(ttype,a_number, a_type,prebalance,tamount,curbalance,date,time)  values(?,?,?,?,?,?,CURRENT_DATE(),CURRENT_TIME())");
			ps2.setString(1, "deposit");
			ps2.setDouble(2, a_number);
			ps2.setString(3, accType);
			ps2.setDouble(4, prebalance);
			ps2.setDouble(5, deposit);
			ps2.setDouble(6, newbalance);

//			note:CURRENT_DATE()/CURRENT_TIME()/NOW()-->(D&T)/current_date()/current_time()/now()/----- table ya date hoba varchar---

//------------ ababe date & time set kora hoi auto ------

			ps2.executeUpdate();

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

	// --------------- data add to loan account----------

	public Loanapproval dataaddloanaccount(Loanapproval s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO loanapproval VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			ps.setInt(1, s.getAccnumber());
			ps.setString(2, s.getPassword());
			ps.setInt(3, s.getNid());
			ps.setString(4, s.getLoantype());
			ps.setDouble(5, s.getReq_amount());
			ps.setString(6, s.getDuration());
			ps.setDouble(7, s.getCash());
			ps.setString(8, s.getInterest_rate());
			ps.setDouble(9, s.getTotal_amount());
			ps.setInt(10, s.getInstallment());
			ps.setInt(11, s.getPaid_installment());
			ps.setDouble(12, s.getMonthlypaid());
			ps.setDouble(13, s.getPaid_amount());
			ps.setDouble(14, s.getDue());
			ps.setString(15, s.getName());
			ps.setString(16, s.getGender());
			ps.setString(17, s.getMobile());
			ps.setString(18, s.getEmail());
			ps.setString(19, s.getAddress());
			ps.setString(20, s.getDate());
			ps.setString(21, s.getMar_status());
			ps.setString(22, s.getOccupation());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

//	------------------------ show loan account---------------------

	public List<Loanapproval> showloanaccount() {
		List<Loanapproval> sloan = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from loanapproval");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sloan.add(new Loanapproval(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getDouble(5), rs.getString(6), rs.getDouble(7), rs.getString(8), rs.getDouble(9),
						rs.getInt(10), rs.getInt(11), rs.getDouble(12), rs.getDouble(13), rs.getDouble(14),
						rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19),
						rs.getString(20), rs.getString(21), rs.getString(22)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return sloan;
	}

//	------------------------------pay loan installment by admin ------------------- 

	public Loanapproval payinstallment(int accnumber, double amount) {
		Loanapproval e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from loanapproval where accnumber=?");

			ps.setInt(1, accnumber);
			ResultSet rs = ps.executeQuery();

			int paidinstallment = 0;
			int finalpaidinstallment = 0;
			double prepaidamount = 0;
			double finalpaidamount = 0;
			double predue = 0;
			double newdue = 0;

			String loantype = "";
			int totalinstallment = 0;

			while (rs.next()) {

				paidinstallment = rs.getInt(11);
				finalpaidinstallment = paidinstallment + 1;
				prepaidamount = rs.getDouble(13);
				finalpaidamount = prepaidamount + amount;
				predue = rs.getDouble(14);
				newdue = predue - amount;

				loantype = rs.getString(4);
				totalinstallment = rs.getInt(10);

				e = new Loanapproval(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5),
						rs.getString(6), rs.getDouble(7), rs.getString(8), rs.getDouble(9), rs.getInt(10),
						rs.getInt(11), rs.getDouble(12), rs.getDouble(13), rs.getDouble(14), rs.getString(15),
						rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20),
						rs.getString(21), rs.getString(22));

			}

			if (amount <= predue) {

				PreparedStatement ps1 = con.prepareStatement(
						"update loanapproval set paid_installment=?, paid_amount=?, due=? where accnumber=?");
				ps1.setInt(1, finalpaidinstallment);
				ps1.setDouble(2, finalpaidamount);
				ps1.setDouble(3, newdue);
				ps1.setInt(4, accnumber);
				ps1.executeUpdate();

				PreparedStatement ps2 = con.prepareStatement(
						"insert into loantransaction(ttype,accnumber, loantype,totalinstallment,payinstallment,paidamount,dueamount,date)  values(?,?,?,?,?,?,?,NOW())");
				ps2.setString(1, "Installment");
				ps2.setInt(2, accnumber);
				ps2.setString(3, loantype);
				ps2.setInt(4, totalinstallment);
				ps2.setInt(5, finalpaidinstallment);
				ps2.setDouble(6, finalpaidamount);
				ps2.setDouble(7, newdue);

				ps2.executeUpdate();
			} else if (0 == predue) {
				e.setMsg("Dear Customer, your installment has finished");
			} else if (amount > predue) {
				e.setMsg("Dear Customer, please enter correct amount");

			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

//----------------------------- Balance withdraw by admin/transection table ya o add --------------- 

	public Createaccount withdrawbalance(double a_number, double withdraw, String password) {
		Createaccount e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from createaccount where a_number=? and password=?");

			ps.setDouble(1, a_number);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			double prebalance = 0;
			double newbalance = 0;
			String accType = "";

			while (rs.next()) {
				prebalance = rs.getDouble(13);
				accType = rs.getString(4);
				newbalance = prebalance - withdraw;

				e = new Createaccount(rs.getDouble(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12), rs.getDouble(13));
			}
			// ------ if(!(withdraw>prebalance)){} ------- ababe o deya jai ------

			if (withdraw <= prebalance) {
				PreparedStatement ps1 = con
						.prepareStatement("update createaccount set balance=? where a_number=? and password=?");
				ps1.setDouble(1, newbalance);
				ps1.setDouble(2, a_number);
				ps1.setString(3, password);
				ps1.executeUpdate();

				PreparedStatement ps2 = con.prepareStatement(
						"insert into transaction(ttype,a_number, a_type,prebalance,tamount,curbalance,date,time)  values(?,?,?,?,?,?,current_date(),current_time())");
				ps2.setString(1, "withdraw");
				ps2.setDouble(2, a_number);
				ps2.setString(3, accType);
				ps2.setDouble(4, prebalance);
				ps2.setDouble(5, withdraw);
				ps2.setDouble(6, newbalance);

				// -
				// note:CURRENT_DATE()/CURRENT_TIME()/NOW()-->(D&T)/current_date()/current_time()/now()/-----
				// table ya date hoba varchar---
				// ------ ababe date & time set kora hoi auto ------

				ps2.executeUpdate();

			} else {
				e.setMsg("you have no sufficient balance");

				// System.out.println("you have no sufficient balance");

			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

	// -----------------------------/ Money Transfer by admin/---------------

	public Createaccount moneytransfer(double fromaccount, double toaccount, double transfer, String password) {
		Createaccount e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/abcd", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from createaccount where a_number=?");
			PreparedStatement ps1 = con.prepareStatement("select * from createaccount where a_number=? and password=?");

			ps.setDouble(1, toaccount);

			ps1.setDouble(1, fromaccount);
			ps1.setString(2, password);

			ResultSet rs = ps.executeQuery();
			ResultSet rs1 = ps1.executeQuery();

			double prebalance = 0;
			double newbalance = 0;

			double primarybalance = 0;
			double nextbalance = 0;

			String accType = "";

			final double securityamount = 500;

			while (rs.next()) {
				prebalance = rs.getDouble(13);
				accType = rs.getString(4);
				newbalance = prebalance + transfer;

				e = new Createaccount(rs.getDouble(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12), rs.getDouble(13));
			}

			while (rs1.next()) {
				primarybalance = rs1.getDouble(13);
				nextbalance = primarybalance - transfer;

				e = new Createaccount(rs1.getDouble(1), rs1.getString(2), rs1.getDouble(3), rs1.getString(4),
						rs1.getString(5), rs1.getString(6), rs1.getString(7), rs1.getString(8), rs1.getString(9),
						rs1.getString(10), rs1.getString(11), rs1.getString(12), rs1.getDouble(13));
			}

			if (transfer <= (primarybalance - securityamount)) {

				// -------- to account ------------

				PreparedStatement ps2 = con.prepareStatement("update createaccount set balance=? where a_number=?");
				ps2.setDouble(1, newbalance);
				ps2.setDouble(2, toaccount);
				ps2.executeUpdate();

				// ------------- from account --------

				PreparedStatement ps3 = con
						.prepareStatement("update createaccount set balance=? where a_number=? and password=?");
				ps3.setDouble(1, nextbalance);
				ps3.setDouble(2, fromaccount);
				ps3.setString(3, password);

				ps3.executeUpdate();

				PreparedStatement ps4 = con.prepareStatement(
						"insert into transaction(ttype,a_number, a_type,prebalance,tamount,curbalance,toacc_number,date,time)  values(?,?,?,?,?,?,?,current_date(),current_time())");
				ps4.setString(1, "Transfer");
				ps4.setDouble(2, fromaccount);
				ps4.setString(3, accType);
				ps4.setDouble(4, primarybalance);
				ps4.setDouble(5, transfer);
				ps4.setDouble(6, nextbalance);
				ps4.setDouble(7, toaccount);

				ps4.executeUpdate();

			} else {
				e.setMsg("you have no sufficient balance");

			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}

}
