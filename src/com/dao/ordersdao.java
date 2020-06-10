package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ordersdao {

	public static boolean Generateorder(int tp, int uid, Timestamp t) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("insert into orders(user_id,total_amount,order_date) values(?,?,?)");
		ps.setInt(1, uid);
		ps.setInt(2, tp);
		ps.setTimestamp(3, t);
		int b = ps.executeUpdate();
		if (b != 0) {
			return true;
		}
		return false;
	}

	public static int getOrderId(int uid, Timestamp t) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select id from orders  where user_id=? and  order_date=?");
		ps.setInt(1, uid);
		ps.setTimestamp(2, t);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {

			return rs.getInt(1);
		}

		return 0;
	}

	
}
