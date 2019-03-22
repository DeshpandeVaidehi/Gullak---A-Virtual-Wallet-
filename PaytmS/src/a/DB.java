/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//sudo kill $(ps -aef | grep java | grep apache | awk '{print $2}')

package a;

import java.sql.*;
import java.util.ArrayList;

public class DB {

	// JDBC driver name and database URL
	 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	 static final String DB_URL = "jdbc:mysql://localhost/Paytm";

	 //  Database credentials
	 static final String USER = "root";
	 static final String PASS = "vaidi";
   
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs;
    
    public DB() throws Exception {
    	try {
                      
            Class.forName(JDBC_DRIVER);
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS); //, USER, PASS);
            System.out.println("Creating database...");
            stmt = conn.createStatement();
            conn.setAutoCommit(false);
    	}
    	catch(Exception e) {
    		System.out.println("Exception in DB.java constructor ----->" + e);
    	}
    }
    
    // insert, delete,update operation
    public void nonSelection(String sql) throws Exception {
        stmt.executeUpdate(sql);
        conn.commit();

    }

    //selection
    public ResultSet Selection(String sql) throws SQLException {
        return stmt.executeQuery(sql);
    }

    //close
    public void close() throws SQLException {
        conn.close();
    }

    public void sendMoney(double contact, float amount) throws Exception{
    	System.out.println("in sendMoney");
    	Login l = new Login();
    	double ewallet_balance = 0;
    	if(l.getLoginStatus() == true) {
    		 
    		 double from_mobile = l.getMobile();
    		 ewallet_balance = checkBalance(from_mobile);
    		 if(ewallet_balance >= amount && amount > 0) {
    			 //debit from sender's account
    			 nonSelection("update user_account set balance = balance - '"+amount+"' where mobile_no = '"+from_mobile+"' ");
    			
    			 // Reward
    			 float reward = (float) (amount/ (float)100);
    			 reward = Math.round(reward*100)/(float)100;
    			 
    			 System.out.println("Reward ---- >" + reward);

    			 nonSelection("update user_account set rewards_balance = rewards_balance + '"+reward+"' where mobile_no = '"+from_mobile+"' ");
    			 nonSelection("update user_account set balance = balance + '"+reward+"' where mobile_no = '"+from_mobile+"' ");
    			 
    			 //credit to receiver's account
    			 nonSelection("update user_account set balance = balance + '"+amount+"' where mobile_no = '"+contact+"' ");
    		 
    			 l.setBalance(ewallet_balance-amount);
    		 }
    		 else {
    			 System.out.println("Not enough balance... Please add money to wallet");
    		 }
    	}
    	else {
    		System.out.println("Please login");
    	}
    }
    
       
    public void setPassbook(Transaction t, int success_flag) throws Exception {
    	System.out.println("in setPasbook");
    	t.setSuccessFlag(success_flag);
    	System.out.println("success");
    	nonSelection("insert into passbook  (date_time, from_user, to_user, amount, success_flag, reward_amount, description) values('"+t.getTimeStamp()+"', '"+t.getFromUser()+"', '"+t.getToUser()+"', '"+t.getAmount()+ "', '" + t.isSuccessFlag()+ "', '"+ t.getRewardAmount()+"', '"+t.getDescription()+"'  )");
    	System.out.println("passbook updated");
        
    }
    
    public void setCardHistory(double mobile, String card_number, String currentTime, float amount) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("In setCardHistory");
		nonSelection("insert into add_history (mobile_no, card_number, date_time, amount) values( '"+mobile+"', '"+card_number+"', '"+currentTime+"', '"+amount+"')");
	}
    
    public ArrayList printcardHistory(double mobile_no) throws SQLException {
    	ArrayList ch = new ArrayList<>();
    	rs = Selection("select * from add_history where mobile_no = '"+ mobile_no +"' "); 
    	while(rs.next()) {
    		ch.add(rs.getDouble("t_id"));
    		ch.add(rs.getDouble("mobile_no"));
    		ch.add(rs.getDouble("card_number"));
    		ch.add(rs.getString("date_time"));
    		ch.add(rs.getFloat("amount"));
    	}
    	System.out.println(ch);
    	return ch;
    }
    
    //check available balance in wallet
    public float checkBalance(double mobile_no) throws SQLException {
    	float ewallet_balance = 0;
    	rs = Selection("select balance from user_account where mobile_no = '"+ mobile_no +"' ");
		 while(rs.next()) {
			 ewallet_balance = rs.getFloat("balance");
		 }
		 //System.out.println("ewallet_balance === " + ewallet_balance);
    	return ewallet_balance;
    }
    
    
    //called in Login
    public boolean verifyPassword(double mobile, String pass) {
    	boolean result = false;
    	String password = "";
    	try {
			rs = Selection("select password from user_account where mobile_no = '"+mobile+"' ");
			 while(rs.next()) {
		        	password = rs.getString("password");
		     }
			 if(password.equals(pass)) {
				 result = true;
			 }
			 else {
				 System.out.println("Wrong pass. please try again!");
				 result = false;
				 
			 }
				 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return result;
    }
    
    //register user
    public boolean addUser(String name, String email, double mobile, String pass) throws Exception {
    	boolean success = false;
    	Login l = new Login();
    	String hash_code = l.toHash(pass);
    	nonSelection("insert into user_account  (user_name, email, mobile_no, password) values('"+name+"', '"+email+"', '"+mobile+"', '"+hash_code+"' )");
    	return success;
    }
    
   
    
	public void addCard(Card currCard) throws Exception {
		int isDefalut = Integer.parseInt(currCard.getIsDefault());
		if(isDefalut==1) {
			//TODO reset all card's default values to 0
			//verify whether card is present or not
		}
		Login l = new Login();
		nonSelection("insert into user_card values('"+l.getMobile()+"', '"+currCard.getCardholder_name()+"', '"+currCard.getCard_type()+"', '"+currCard.getCard_number()+"', '"+currCard.getEx_date()+"', '"+currCard.getIsDefault()+"') ");
	}

	public static final float BANK_FAIL_PROBABLITY = 0f;

	public boolean bankAuthorization(){
		if(Math.random()>BANK_FAIL_PROBABLITY)
			return true;
		return false;
	}
	
	public void bankToWallet(float amount) throws Exception {
		if(bankAuthorization()) {
			Login l = new Login();
			nonSelection("update user_account set balance = balance + '" + amount +"' where mobile_no = " + l.getMobile());
			System.out.println("bank to wallet success ");
		}		
	}

	public void changePassword(double mobile_no, String new_pass, String old_pass) throws Exception {
		Login l = new Login();
    	String hash_code = l.toHash(old_pass);
		rs = Selection("select password from user_account where mobile_no = '" + mobile_no + "'");
		if(rs.getString("password").equals(hash_code)) {
			updatePassword(mobile_no, new_pass);
		}
		else {
			System.out.println("Old password is not correct");
		}
	}
	
	public void updatePassword(double mobile_no, String new_pass) throws Exception {
		Login l = new Login();
    	String hash_code = l.toHash(new_pass);
		nonSelection("update user_account set password = '"+hash_code+"' where mobile_no = '"+mobile_no+"' ");
		System.out.println("password updated successfully!!!");
	}

	
	public ArrayList showSavedCards() throws SQLException {
		ArrayList al = new ArrayList<>();
		Login l = new Login();
    	rs = Selection("select card_number from user_card where mobile_no = '"+ l.getMobile() +"' "); 
    	while(rs.next()) {
    		al.add(rs.getString("card_number"));
    	}
    	System.out.println("Added cards -- > ");
    	System.out.println(al);
    	return al;
		
	}

	public String getDefaultCard(double mobile) throws SQLException {
		// TODO Auto-generated method stub
		String card_no = null;
		Login l = new Login();
		rs = Selection("select card_number from user_card where mobile_no = '"+ l.getMobile() +"' and is_default = 1 "); 
    	while(rs.next()) {
    		card_no = rs.getString("card_number");
    	}
		return card_no;
	}

	public boolean isDefaultCardPresent(double mobile) throws SQLException {
		// TODO Auto-generated method stub
		rs = Selection("select count(*) from user_card where mobile_no = '"+mobile+"' and is_default = 1 ");
		rs.next();
		int count = rs.getInt("rowcount");
		if(count == 0)
			return false;
		else
			return true;
		
	}

	public void resetDefaultCard(double mobile) throws Exception {
		// TODO Auto-generated method stub
		nonSelection("update user_card set is_default = 0 where mobile_no = '"+mobile+"' ");
	}
	
	// Anurag Thrusday
	public void requestMoney(double from_contact, float amount, String note) throws Exception {
		System.out.println("in requestMoney");
    	Login l = new Login();
    	if(amount <= 0) {
    		System.out.println("request money can't be less than 0");
    		return;
    	}
    	
    	Transaction t = new Transaction(from_contact, l.getMobile(), amount, note);
    	nonSelection("insert into request_record (date_time, from_user, to_user, amount, description) values('"+t.getTimeStamp()+"', '"+t.getFromUser()+"', '"+t.getToUser()+"', '"+t.getAmount()+ "', '" + t.getDescription()+"'  )");
	}
	
	 public ArrayList getPendingRequest(double mobile_no) throws SQLException {
	    	ArrayList al = new ArrayList<>();
	    	rs = Selection("select * from passbook where from_user = '"+ mobile_no +"'  "); 
	    	while(rs.next()) {    		
	    		al.add(rs.getDouble("r_id"));
	    		al.add(rs.getDouble("from_user"));
	    		al.add(rs.getDouble("to_user"));
	    		al.add(rs.getFloat("amount"));
	    		al.add(rs.getString("description"));
	    		al.add(rs.getString("date_time"));
	    	}
	    	return al;
	    }
	 
	 public void approveRequest(double r_id) throws Exception{
	    	rs = Selection("select * from request_record where r_id = '"+ r_id +"'  ");
	    	double toUser =0;
	    	float amount =0f;
	    	String note = "";
	    	String date_time = "";
	    	
	    	while(rs.next()) {    
	    		toUser = rs.getDouble("to_user");
	    		amount = rs.getFloat("amount");
	    		note = rs.getString("description");
	    		date_time = rs.getString("date_time");
	    	}
		 	note  = "Requested by user " + toUser + " on " + date_time + " Comment: " + note;
	    	Login ln = new Login();
		 	sendMoney(toUser, amount);
	        Transaction t = new Transaction(ln.getMobile(), toUser, amount, note);
	        setPassbook(t, 1);
	        // Remove the request
	        nonSelection("delete from request_record where r_id = '"+ r_id +"' ");
	    }

	public void rejectRequest(double r_id) throws Exception {
		// TODO Auto-generated method stub
		java.util.Date dt = new java.util.Date();
    	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		rs = Selection("select * from request_record where r_id = '"+ r_id +"'  ");
    	double toUser =0;
    	float amount =0f;
    	String note = "";
    	String date_time = sdf.format(dt);
    	
    	while(rs.next()) {    
    		toUser = rs.getDouble("to_user");
    		amount = rs.getFloat("amount");
    		note = rs.getString("description");
    	}
    	Login ln = new Login();
	 	note  = "rejected request by user " + ln.getMobile() + " on " + date_time + " Comment: " + note;
    	
        Transaction t = new Transaction(ln.getMobile(), toUser, amount, note);
        setPassbook(t, 0);
        // Remove the request
        nonSelection("delete from request_record where r_id = '"+ r_id +"' ");
	}

	public boolean isUserValid() {
		// TODO Auto-generated method stub
		return false;
	}
	    
}











