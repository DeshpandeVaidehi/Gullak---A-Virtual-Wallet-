package a;

public class Card {

	private String cardholder_name, card_type, ex_date, isDefault="0", card_number;
	
	
	public Card(String cardholder_name, String card_type, String card_number, String ex_date, String isDefault) {
		// TODO Auto-generated constructor stub
		this.setCardholder_name(cardholder_name);
		this.card_type = card_type;
		this.card_number = card_number;
		this.ex_date = ex_date;
		this.isDefault = isDefault;		
	}

	public String getCardholder_name() {
		return cardholder_name;
	}

	public void setCardholder_name(String cardholder_name) {
		this.cardholder_name = cardholder_name;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public String getEx_date() {
		return ex_date;
	}

	public void setEx_date(String ex_date) {
		this.ex_date = ex_date;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	public String getCard_number() {
		return card_number;
	}

	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
}
