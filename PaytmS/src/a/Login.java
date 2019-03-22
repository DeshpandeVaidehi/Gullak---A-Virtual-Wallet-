package a;

import java.security.MessageDigest;

/**
 *
 * @author Sam
 */
public class Login {
	
	private static double mobile;
	private static String password;
	private static float ewallet_balance;
	private static String name;
	private static String email;
	private static boolean result=false;
	
    /**
     *
     * @param bits_id
     * @param password
     * @throws Exception 
     */
	public Login() {
		
	}
	
    @SuppressWarnings("static-access")
	public Login(double mobile, String password) throws Exception{
		this.mobile=mobile;
		this.password=toHash(password);
		this.result = resultLogin();
		this.ewallet_balance= balanceCheck();
		System.out.println("login status " + this.result);
		System.out.println("Wallet balance " + this.ewallet_balance);
	}
	
    public float getEwalletbalance() {
		return this.ewallet_balance;
	}
    
    public double getMobile() {
		return this.mobile;
	}
    
    public String getName() {
		return this.name;
	}
    
    public String getEmail() {
		return this.email;
	}
    
    public void setBalance(double d) {
    	this.ewallet_balance = (float) d;
    }
    
    public boolean getLoginStatus() {
    	boolean result = this.result;
    	return result;
	}
    
static final String STATIC_SALT = "CT6/c+0AAmU=c2Vj";
	
	public static String toHash(String data){
		data = data + STATIC_SALT;
	    StringBuffer sb = new StringBuffer();
	    try{
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(data.getBytes());
	        byte byteData[] = md.digest();

	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	    } catch(Exception e){
	        e.printStackTrace();
	    }
	    return sb.toString();
	}
   
    public float balanceCheck() throws Exception {
    	float ewallet_balance = 0;
    	DB db = new DB();
    	ewallet_balance = db.checkBalance(mobile);
    	db.close();
    	return ewallet_balance;
    }
    public boolean resultLogin() throws Exception{
		try{
		DB db = new DB();
		if(db.verifyPassword(mobile, password) == true){
			result = true;
			db.close();
		}
		else {
			System.out.println("Can't login");
			result = false;
		}
		}catch(NullPointerException e){
			return false;
		}
		
		return result;
	}
	
}
