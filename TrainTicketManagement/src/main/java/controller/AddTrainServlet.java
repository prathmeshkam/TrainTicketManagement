package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddTrainDao;
import dao.RegisterDao;
import dao.ValidateDao;
import model.AddTrain;
import model.User;

@WebServlet("/AddTrainServlet")
public class AddTrainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tnumber = request.getParameter("trainNumber");
        int tnum = Integer.parseInt(tnumber);
        String tname = request.getParameter("trainName");
        String ostation = request.getParameter("originStation");
        String dstation = request.getParameter("destinationStation");
        String date = request.getParameter("trainDate");
        Date sqlDate = Date.valueOf(date);
        String atime = request.getParameter("arrivalTime");
        String dtime = request.getParameter("departureTime");
        String sleeper = request.getParameter("sleeper");
        int sleeper1 = Integer.parseInt(sleeper);
        String secondSitting = request.getParameter("secondSitting");
        int secondSitting1 = Integer.parseInt(secondSitting);
        String thirdAC = request.getParameter("thirdAC");
        int thirdAC1 = Integer.parseInt(thirdAC);
        String secondAC = request.getParameter("secondAC");
        int secondAC1 = Integer.parseInt(secondAC);
        String firstAC = request.getParameter("firstAC");
        int firstAC1 = Integer.parseInt(firstAC);
        String numberOfSeats = request.getParameter("numberOfSeats");
        int numberOfSeats1 = Integer.parseInt(numberOfSeats);

        
        AddTrain t = new AddTrain(tnum, tname, ostation, dstation,
                atime, dtime, sleeper1, secondSitting1, 
                thirdAC1, secondAC1, firstAC1, numberOfSeats1, sqlDate);


        int res = 0;
        try {
            res = AddTrainDao.addTrain(t);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (res == 1) {
        	PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Train Added Successfully! Redirecting to add train...');");
            out.println("window.location.href = 'Admin/adminportal.jsp';");
            out.println("</script>");
        }
  
    }
}