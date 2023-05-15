

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AddAccount;
import entity.Account;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		HttpSession session =request.getSession();
		
		String name=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		 
		Account account=new Account(name,mobile,email,password);
		AddAccount add=new AddAccount();
		int result=add.addAccount(account);
		if(result==1) {
		session.setAttribute("name", name);
		session.setAttribute("mobile",mobile);
		response.sendRedirect("products.jsp");
		//pw.println("Successfully Account Created");
		}
		else {
			response.sendRedirect("createAccountErrorPage.jsp");
		}
			
	
		
	}

}
