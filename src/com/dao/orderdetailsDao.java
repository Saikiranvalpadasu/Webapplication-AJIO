package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class orderdetailsDao {

	public static boolean insertOrderDetails(int order_id, int selectedpid, int selectedquantity) throws SQLException, ClassNotFoundException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("insert into order_details(order_id,product_id,quantity) values(?,?,?)");
		ps.setInt(1, order_id);
		ps.setInt(2, selectedpid);
	    ps.setInt(3, selectedquantity);
	    int i= ps.executeUpdate();
	    if(i>0){
	    	return true;
	    }
		return false;
	}

	
}
