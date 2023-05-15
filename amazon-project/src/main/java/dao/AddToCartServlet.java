package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCartServlet
 */
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		
		String type=request.getParameter("type");
		String name=request.getParameter("name");
		int price=Integer.parseInt(request.getParameter("price"));
		String mobile=request.getParameter("mobile");
		String imageAddress=request.getParameter("imageAddress");
		String querry="insert into Cart(type,productName,price,mobile,imageAddress) values(?,?,?,?,?)";
		Connection connection=ConnectWithDb.getConnection();
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(querry);
			pst.setString(1, type);
			pst.setString(2, name);
			pst.setInt(3, price);
			pst.setString(4, mobile);
			pst.setString(5, imageAddress);
			int result=pst.executeUpdate(); 
			if(result>0) {
				response.sendRedirect("products.jsp");
			}
			else {
				response.getWriter().println("Sorry not inserted");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
