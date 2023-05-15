package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectWithDb {
	Connection connection;
	public static Connection getConnection() {
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/Amazon","root","1145"); 
			return connection;
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
