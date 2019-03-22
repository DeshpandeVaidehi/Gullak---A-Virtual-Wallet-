package a;

public class Transaction {
	/*  t_id int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  		date_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  		from_user double NOT NULL,
  		to_user double NOT NULL,
  		amount float(15, 2) NOT NULL DEFAULT '0',
  		success_flag int(1) NOT NULL,
  		reward_amount float(15, 2) NOT NULL DEFAULT '0',
  		description varchar(200)  DEFAULT 'NA'
	 */
	private String timeStamp;
	private double fromUser;
	private double toUser;
	private float amount;
	private int successFlag = 0;
	private float rewardAmount = 0f;
	private String description;
	
	public Transaction(double mobile, double toUser, float amount, String note){
		// TODO Auto-generated constructor stub
		this.amount = amount;
		this.fromUser = mobile;
		this.toUser = toUser;
		this.description = note;
		float temp = (float) (amount/ (float)100);
		this.rewardAmount = Math.round(temp*100)/(float)100;

    	java.util.Date dt = new java.util.Date();
    	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	this.timeStamp = sdf.format(dt);
	}
	public String getTimeStamp() {
		return this.timeStamp;
	}
	public double getFromUser() {
		return this.fromUser;
	}
	public double getToUser() {
		return this.toUser;
	}
	public float getAmount() {
		return this.amount;
	}
	public int isSuccessFlag() {
		return this.successFlag;
	}
	public void setSuccessFlag(int b) {
		this.successFlag = b;
	}
	public float getRewardAmount() {
		return this.rewardAmount;
	}
	public String getDescription() {
		return this.description;
	} 
}

