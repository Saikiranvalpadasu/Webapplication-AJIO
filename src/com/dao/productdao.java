package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.productdto;
import com.dto.productdto;


public class productdao {

	public static List<String> getallcategory() throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select  distinct category from product; ");
		ResultSet rs=ps.executeQuery();
		List<String> clist=new ArrayList<String>();
		while(rs.next()) {
			clist.add(rs.getString(1));
		}
		return clist;
	}
	

	public static List<productdto> getallproductdetails(String option) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select * from product;");	
		
		List<productdto> plist=new ArrayList<productdto>();
		ResultSet rs=ps.executeQuery();
		productdto p=null;
		while(rs.next()) {
			plist.add(new productdto(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5)));
		}
		return plist ;
	}
	public static List<productdto> getinduvidualproductdetails(String option) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("select * from product where category=?;");	
		ps.setString(1, option);
		List<productdto> plist=new ArrayList<productdto>();
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			plist.add(new productdto(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5)));
		}
		return plist ;
	}


	


	public static productdto getItemWithId(int parseInt) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getgetConnection();
		PreparedStatement ps = c.prepareStatement("Select * from product where id= ? ;");
		ps.setInt(1,parseInt);
		ResultSet rs = ps.executeQuery();
		 productdto p=null;
		 while(rs.next()){
			 p=new productdto(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
			 return p;
			 
		 }
		return null;
	}

}
