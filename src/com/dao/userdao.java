package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;

import com.dto.productdto;

public class userdao {

	public static boolean checkAdminExistsOrNot(String uemail) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select * from user where email=?");
		ps.setString(1, uemail);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return true;
		}
		return false;
	}

	public static boolean registerAdmin(String uname, String uemail, String upwd)
			throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("insert into user(name,email,pwd) values(?,?,aes_encrypt(?,'k1'))");
		ps.setString(1, uname);
		ps.setString(2, uemail);
		ps.setString(3, upwd);
		int r = ps.executeUpdate();
		if (r > 0)
			return true;

		return false;
	}

	public static String getPasswordWithEmail(String e) throws ClassNotFoundException, SQLException {

		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select aes_decrypt(pwd,'k1') from user where email=?;");
		ps.setString(1, e);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return rs.getString(1);
		}
		return null;
	}

	public static String getusername(String uemail) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select name from user where email=?;");
		ps.setString(1, uemail);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return rs.getString(1);
		}
		return null;
	}

	public static int getUserId(String uemail) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select id from user where email=?;");
		ps.setString(1, uemail);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}


	
}