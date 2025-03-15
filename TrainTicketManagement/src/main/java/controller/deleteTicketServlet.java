package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.deleteTicketDao;
import dao.deleteTrainDao;

@WebServlet("/deleteTicketServlet")

public class deleteTicketServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int id = Integer.parseInt(request.getParameter("bookingId"));

	     
	   
	            
	        int res = 0;
	            try {
	                res = deleteTicketDao.deleteTicket(id);
	            } catch (ClassNotFoundException e) {
	                e.printStackTrace();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }

	            if (res == 1) {
	            	PrintWriter out = response.getWriter();
	                out.println("<script type=\"text/javascript\">");
	                out.println("alert('Ticket canceled successfully! The payment will be refunded within 2 days.');");
	                out.println("window.location.href = 'user/showbookings.jsp';");
	                out.println("</script>");
	            }
	    }
}
