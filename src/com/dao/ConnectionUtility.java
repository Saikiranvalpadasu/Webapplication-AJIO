package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtility {

	public static Connection getgetConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		return (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ajio", "root", "123456");
	}

}
