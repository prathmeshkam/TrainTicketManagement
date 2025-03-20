package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.bookTicketDao;

@WebServlet("/bookTicketServlet")
public class bookTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            String trainNumber = request.getParameter("trainNumber");
            String trainName = request.getParameter("trainName");
            String trainDate = request.getParameter("trainDate");
            Date sdate = Date.valueOf(trainDate);
            String paymentMode = request.getParameter("paymentMethod");

            int totalTickets = Integer.parseInt(request.getParameter("numTickets"));
            session.setAttribute("totalTickets", totalTickets);

            String name = request.getParameter("passengerName");
            int age = Integer.parseInt(request.getParameter("passengerAge"));
            String gender = request.getParameter("gender");
            String travelClass = request.getParameter("travelClass");

            boolean isBooked = bookTicketDao.bookTrain(trainNumber, trainName, sdate, name, age, gender, travelClass, paymentMode, 1, 100);

            int bookedPassengers = session.getAttribute("bookedPassengers") == null ? 0 : (int) session.getAttribute("bookedPassengers");

            if (isBooked) {
                bookedPassengers++;
                session.setAttribute("bookedPassengers", bookedPassengers);

                if (bookedPassengers < totalTickets) {
                    response.sendRedirect("bookingpopup.jsp"); // Stay on the same page
                } else {
                    session.removeAttribute("bookedPassengers");
                    session.removeAttribute("totalTickets");
                    response.sendRedirect("user/searchresult.jsp");
                }
            } else {
                response.sendRedirect("user/searchresult.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
