package a;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddMonetToWallet
 */
@WebServlet("/AddMoneyToWallet")
public class AddMoneyToWallet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMoneyToWallet() {
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
		
    	
		String cardholder_name = request.getParameter("lname");
		float amount = Float.parseFloat(request.getParameter("amount"));
		String card_type = request.getParameter("cardtype");
		String card_number = request.getParameter("cnum");
		String ex_date = request.getParameter("ex_date");
		String isDefault = request.getParameter("default");
		if(isDefault == null)
			isDefault = "0";
		//System.out.println( cardholder_name+  "   "  + amount+"   "+card_type +  "   " + ex_date + "   " + check);
		
		try {
			DB db = new DB();
			Login l = new Login();
			Card currCard = new Card(cardholder_name, card_type, card_number,ex_date, isDefault);
			db.addCard(currCard);
			db.bankToWallet(amount);
			db.setCardHistory(l.getMobile(), card_number, currentTime, amount);
			db.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd;
        rd = request.getRequestDispatcher("AddMoneyToWallet.jsp");
        rd.forward(request, response);
	}
}
