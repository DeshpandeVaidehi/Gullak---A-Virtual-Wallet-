package a;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddMoneyWithoutCard
 */
@WebServlet("/AddMoneyWithoutCard")
public class AddMoneyWithoutCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMoneyWithoutCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		java.util.Date dt = new java.util.Date();
    	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String currentTime = sdf.format(dt);
    	System.out.println(request.getParameter("amount"));
		float amount = Float.parseFloat(request.getParameter("amount"));
		
		String card_type = request.getParameter("default");
		String select_card = request.getParameter("select_card");
		
		RequestDispatcher rd;

		try {
			DB db = new DB();
			Login l = new Login();
			
			boolean is_present = db.isDefaultCardPresent(l.getMobile());
			//check whether default card is already present, if yes then reset all default cards
			if(card_type.equals("1") && is_present == true) {
				//reset default card and add new card as default
				db.resetDefaultCard(l.getMobile());
			}
			else if(card_type.equals("1") && is_present == false) {
				//no problem. set new one as default i.e. add first card
				
			}
			else if(card_type.equals("0") && is_present == true) {
				//no problem. do nothing
				
			}
			else if(card_type.equals("0") && is_present == false) {
				//need to set card as default as no previous card found
				System.out.println("show popup ---> no previous card found, please make this card as default");
			}
			
			if(card_type.equals("C")) {
				//add money to wallet using default card
				String default_card = db.getDefaultCard(l.getMobile());
				db.bankToWallet(amount);
				db.setCardHistory(l.getMobile(), default_card, currentTime, amount);
				db.close();
				rd = request.getRequestDispatcher("addMoneyWithoutCard.jsp");
			    rd.forward(request, response);
			}
			else if(card_type.equals("not_default")) {
				db.bankToWallet(amount);
				db.setCardHistory(l.getMobile(), select_card, currentTime, amount);
				db.close();
				rd = request.getRequestDispatcher("addMoneyWithoutCard.jsp");
			    rd.forward(request, response);
			}
			else {
				 
				 rd = request.getRequestDispatcher("AddMoneyToWallet.jsp");
			     rd.forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
       
		
	}

}


















