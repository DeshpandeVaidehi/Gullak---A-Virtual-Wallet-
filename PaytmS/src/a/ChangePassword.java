package a;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
		
		double mobile_no = Double.parseDouble(request.getParameter("mobileno"));
		String old_pass = request.getParameter("old_pass");
		String new_pass = request.getParameter("new_pass");
		String confirm_pass = request.getParameter("confirm_pass");
		
		try {
			
			if(new_pass.equals(confirm_pass) && !new_pass.equals(old_pass)) {
				DB db = new DB();
				db.changePassword(mobile_no, new_pass, old_pass);
				db.close();
			}
			else {
				System.out.println("Password and confirm password does not match!!!");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 RequestDispatcher rd;
         rd = request.getRequestDispatcher("ChangePassword.jsp");
         rd.forward(request, response);
	}

}




















