package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import entity.Account;

public class AddAccount {

	Account account;
	
	public AddAccount() {
		
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	@Override
	public String toString() {
		return "AddAccount [account=" + account + "]";
	}
	
	public int addAccount(Account account)  {
		this.account=account;
		String querry="insert into Account values(?,?,?,?)";
		Connection connection=ConnectWithDb.getConnection();
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(querry);
			pst.setString(1, account.getName());
			pst.setString(2, account.getMobile());
			pst.setString(3, account.getEmail());
			pst.setString(4, account.getPassword());
			int result=pst.executeUpdate(); 
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
		}

		
}
