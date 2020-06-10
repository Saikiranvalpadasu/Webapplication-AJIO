package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.orderdetailsDao;
import com.dao.ordersdao;
import com.dao.productdao;
import com.dao.userdao;
import com.dto.productdto;

@WebServlet("/Appservlet")
public class Appservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession se = request.getSession();
		String button1 = request.getParameter("action");
		if (button1 == null) {
			try {
				List<String> clist = productdao.getallcategory();
				String option = request.getParameter("cat");
				se.setAttribute("option", option);
				List<productdto> plist = productdao.getallproductdetails(option);
				se.setAttribute("clist", clist);
				se.setAttribute("plist", plist);
				request.getRequestDispatcher("login.jsp").forward(request, response);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession se = request.getSession();
		String button = request.getParameter("bt");

		response.setContentType("text/html");

		if (button.equals("Register")) {
			String uname = request.getParameter("t1");
			String uemail = request.getParameter("t2");
			String upwd = request.getParameter("t3");
			try {
				boolean checkAdmin = userdao.checkAdminExistsOrNot(uemail);
				if (checkAdmin) {
					out.println("<head><script>alert('Account Already Exists')</script></head>");
				} else {
					boolean register = userdao.registerAdmin(uname, uemail, upwd);
					if (register) {
						request.getRequestDispatcher("register.jsp").include(request, response);
						out.println("<head><script>alert('scusessfull registration')</script></head>");
						se.setAttribute("uname", uname);
					} else {
						out.println("<head><script>alert('Unscusessfull registration')</script></head>");
					}
				}
			} catch (Exception e) {

			}
		} else if (button.equals("Login")) {
			String uemail = request.getParameter("f1");
			String Upassword = request.getParameter("f2");
			try {
				String Opassword = userdao.getPasswordWithEmail(uemail);
				if (Opassword.equals(Upassword)) {
					int uid = userdao.getUserId(uemail);
					String name = userdao.getusername(uemail);
					se.setAttribute("name", name);
					se.setAttribute("uid", uid);
					String option = (String) se.getAttribute("option");
					List<productdto> hlist = productdao.getallproductdetails(option);
					se.setAttribute("hlist", hlist);
					request.getRequestDispatcher("loginhome.jsp").include(request, response);
				} else {
					out.println("<head><script>alert('User not entry')</script></head>");
				}
			} catch (Exception e) {

			}

		} else if (button.equals("Go")) {
			String option = request.getParameter("select");
			try {
				List<productdto> plist = productdao.getinduvidualproductdetails(option);
				se.setAttribute("plist", plist);
				request.getRequestDispatcher("login.jsp").include(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (button.equals("go")) {
			String option = request.getParameter("select");
			try {
				List<productdto> hlist = productdao.getinduvidualproductdetails(option);
				se.setAttribute("hlist", hlist);
				request.getRequestDispatcher("loginhome.jsp").forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (button.equals("AddToCart")) {
			List<productdto> selectedItemsList = new ArrayList<productdto>();
			List<String> qList = new ArrayList<String>();
			int tp = 0;
			if (se.getAttribute("selectedItemsList") == null) {
				String[] id = request.getParameterValues("id");
				String[] quantity = request.getParameterValues("quantity");
				productdto pb = null;

				for (int i = 0; i < quantity.length; i++) {
					if (Integer.parseInt(quantity[i]) > 0) {
						try {
							pb = productdao.getItemWithId(Integer.parseInt(id[i]));
							tp += pb.getPrice() * Integer.parseInt(quantity[i]);
							selectedItemsList.add(pb);
							qList.add(quantity[i]);
						} catch (NumberFormatException | ClassNotFoundException | SQLException e) {

							e.printStackTrace();
						}
					}
				}
			} else {
				selectedItemsList = (List<productdto>) se.getAttribute("selectedItemsList");
				qList = (List<String>) se.getAttribute("qList");
				tp = (int) se.getAttribute("tp");
				String[] id = request.getParameterValues("id");
				String[] quantity = request.getParameterValues("quantity");

				productdto pb = null;

				for (int i = 0; i < quantity.length; i++) {
					if (Integer.parseInt(quantity[i]) > 0) {
						try {
							pb = productdao.getItemWithId(Integer.parseInt(id[i]));
							tp += pb.getPrice() * Integer.parseInt(quantity[i]);
							selectedItemsList.add(pb);
							qList.add(quantity[i]);
						} catch (NumberFormatException | ClassNotFoundException | SQLException e) {

							e.printStackTrace();
						}
					}

				}

			}
			se.setAttribute("selectedItemsList", selectedItemsList);
			se.setAttribute("qList", qList);
			se.setAttribute("tp", tp);
			request.getRequestDispatcher("cart.jsp").forward(request, response);

		} else if (button.equals("Place Order")) {
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		} else if (button.equals("continue")) {

			int tp = (int) se.getAttribute("tp");
			int uid = (int) se.getAttribute("uid");
			Date d = new Date();
			Timestamp t = new Timestamp(d.getTime());			
			try {
				boolean result = ordersdao.Generateorder(tp, uid, t);		
				if (result) {
					int c = 0;
					int order_id = ordersdao.getOrderId(uid,t);					
					List<productdto> selectedItemsList = (List<productdto>) se.getAttribute("selectedItemsList");
					List<String> qList = (List<String>) se.getAttribute("qList");
					for (int i = 0; i < selectedItemsList.size(); i++) {
						int selectedpid = selectedItemsList.get(i).getId();
						System.out.println(selectedItemsList.get(i).getId());
						int selectedquantity = Integer.parseInt(qList.get(i));
						boolean inserted = orderdetailsDao.insertOrderDetails(order_id, selectedpid, selectedquantity);
						if (inserted) {
							c++;
						}
					}
					if (c == selectedItemsList.size()) {
						request.getRequestDispatcher("final.jsp").forward(request, response);
					} else {
						out.print("Ordered failed . Please order again");
						request.getRequestDispatcher("loginhome.jsp").forward(request, response);
					}
				} 
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

	}
}
