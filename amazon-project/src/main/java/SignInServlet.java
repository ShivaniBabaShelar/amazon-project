

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectWithDb;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		HttpSession session =request.getSession();
		
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("password");
		
		String querry="select * from Account where mobile=?";
		Connection connection=ConnectWithDb.getConnection();
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(querry);
			pst.setString(1, mobile);
			ResultSet rs=pst.executeQuery();
			rs.next();
			String P=rs.getString(2);
			if(rs.getString(4).equals(password)) {
				session.setAttribute("name", rs.getString(1));
				session.setAttribute("mobile",mobile);
				response.sendRedirect("products.jsp");
				}
			else {
				response.sendRedirect("signInErrorPage.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//response.sendRedirect("products.jsp");
	}

}
