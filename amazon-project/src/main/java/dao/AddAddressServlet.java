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

import entity.Address;

/**
 * Servlet implementation class AddAddressServlet
 */
public class AddAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAddressServlet() {
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
		HttpSession session =request.getSession();
		String name=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String country=request.getParameter("country");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String landMark=request.getParameter("landMark");
		String area=request.getParameter("area");
		Address address=new Address(name,mobile,country,city,state,landMark,area);
		String querry="insert into Address(name,mobile,country,city,state,landMark,area) values(?,?,?,?,?,?,?)";
		Connection connection=ConnectWithDb.getConnection();
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(querry);
			pst.setString(1, name);
			pst.setString(2, mobile);
			pst.setString(3, country);
			pst.setString(4, city);
			pst.setString(5, state);
			pst.setString(5, landMark);
			pst.setString(5, area);
			int result=pst.executeUpdate(); 
			if(result>0) {
				session.setAttribute("address", address);
				response.sendRedirect("yourOrders.jsp");
			}
			else {
				response.sendRedirect("addressErrorPage.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

