package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Subscription 
{
	private int paymentid,amount;

	private String transactionid,mobileno;
	private String status;
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	
	public int getPaymentid() {
		return paymentid;
	}

	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}

	public String getTransactionid() {
		return transactionid;
	}

	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int addpayment() throws SQLException{
		DriverManager.deregisterDriver(new com.mysql.jdbc.Driver());
		String url="jdbc:mysql://localhost:3306/techtree_db";
		String user="root";
		String password="";
		Connection conn = DriverManager.getConnection(url,user,password);
		String sql="insert into subscription(mobileno,amount,status) values(?,?,?)";
		java.sql.PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, mobileno);
		ps.setInt(2, amount);
		ps.setString(3, "Pending");
		int row = ps.executeUpdate();
		conn.close();
		return row;
	}
	
	public int updatepayment(String transactionid,String mobileno) throws SQLException{
		DriverManager.deregisterDriver(new com.mysql.jdbc.Driver());
		String url="jdbc:mysql://localhost:3306/techtree_db";
		String user="root";
		String password="";
		Connection conn = DriverManager.getConnection(url,user,password);
		String sql="update subscription set transactionid=?, status=? where mobileno=?";
		java.sql.PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, transactionid);
		ps.setString(2, "Completed");
		ps.setString(3, mobileno);
		int row = ps.executeUpdate();
		conn.close();
		return row;
	}
}