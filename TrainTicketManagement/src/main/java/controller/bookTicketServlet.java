package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.bookTicketDao;

@WebServlet("/bookTicketServlet")
public class bookTicketServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieve form data
	        String trainNumber = request.getParameter("trainNumber");
	        String trainName = request.getParameter("trainName");
	        String trainDate = request.getParameter("trainDate");
	        Date sdate = Date.valueOf(trainDate);
	        String passengerName = request.getParameter("passengerName");
	        int passengerAge = Integer.parseInt(request.getParameter("passengerAge"));
	        String gender = request.getParameter("gender");
	        String travelClass = request.getParameter("class");
	        String paymentMode = request.getParameter("paymentMethod");
	        int noOfTickets = Integer.parseInt(request.getParameter("numTickets"));
	        int totalpay = 100 * noOfTickets;
	        // Use DAO to book train
	       
	        boolean isBooked = bookTicketDao.bookTrain(trainNumber, trainName, sdate, passengerName, passengerAge, gender, travelClass, paymentMode,noOfTickets , totalpay);

	        // Redirect based on booking result
	        if (isBooked) {
	        	PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Train Booked Successfully!');");
                out.println("window.location.href = 'user/searchresult.jsp';");
                out.println("</script>");
	        } else {
	            
	        }
	    }
}
