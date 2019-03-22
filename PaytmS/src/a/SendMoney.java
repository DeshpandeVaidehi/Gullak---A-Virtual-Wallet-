package a;





import a.DB;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class SendMoney
 */
@WebServlet("/SendMoney")
public class SendMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendMoney() {
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
		 try {
			 
//			 	//current date-time
//			 	java.util.Date dt = new java.util.Date();
//		    	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		    	String currentTime = sdf.format(dt);
			 	Login ln = new Login();
			 	System.out.println("login class balance before sending money == " +ln.getEwalletbalance());
	            //String s1 = request.getParameter("to_name");
	            double toUser = Double.parseDouble(request.getParameter("mobileno"));
	            float amount = Float.parseFloat(request.getParameter("amount"));
	            String note = request.getParameter("note");
	            System.out.println(toUser + amount);
	            DB db = new DB();
	            
	            //check for mobile number valid or not
	            boolean isvalid = db.isUserValid();
	            
	            if(isvalid == true) {
		            db.sendMoney(toUser, amount);
		            Transaction t = new Transaction(ln.getMobile(), toUser, amount, note);
		            db.setPassbook(t, 1);
		            db.close();
		            
		            System.out.println("login class balance after sending money== " +ln.getEwalletbalance());
//		            request.setAttribute("available_balance", Login.ewallet_balance);
		            
		            RequestDispatcher rd;
		            rd = request.getRequestDispatcher("pay.jsp");
		            rd.forward(request, response);
		           System.out.println("forwarded");
	            }
	            else {
	            	System.out.println("User is not valid ! Check mobile number again");
	            }
	            
	            

	        } catch (Exception e) {
	           // out.print(e);
	        }
	}

}
