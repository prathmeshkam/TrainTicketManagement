package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AddTrainDao;
import dao.searchTrainDao;
import model.AddTrain;
import model.Train;

@WebServlet("/searchTrainServlet")
public class searchTrainServlet extends HttpServlet{
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false); // Don't create a new session
		    if (session == null || session.getAttribute("username") == null) {
		        response.sendRedirect("login.jsp?error=sessionExpired");
		        return;
		    }
	        String ostation = request.getParameter("from");
	        String dstation = request.getParameter("to");
	        String ppdate = request.getParameter("date");
	        Date sdate = Date.valueOf(ppdate);
	        List<Train> trainList = new ArrayList<>();
	        try {
	            ResultSet rs = searchTrainDao.display(ostation, dstation, sdate);
	            while (rs.next()) {
	                Train train = new Train();
	                train.setTrainNumber(rs.getInt("trainnumber"));
	                train.setTrainName(rs.getString("trainname"));
	                train.setOriginStation(rs.getString("originstation"));
	                train.setDestinationStation(rs.getString("destinationstation"));
	                train.setDepartureTime(rs.getString("departuretime"));
	                train.setArrivalTime(rs.getString("arrivaltime"));
	                train.setNumberOfSeats(rs.getInt("numberofseats"));
	                train.setFirstac(rs.getInt("firstac"));
	                train.setSecondac(rs.getInt("secondac"));
	                train.setThirdac(rs.getInt("thirdac"));
	                train.setSecondsitting(rs.getInt("secondsitting"));
	                train.setSleeper(rs.getInt("sleeper"));
	                train.setTraindate(rs.getDate("traindate"));

	                trainList.add(train);
	            }
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	 
	     


	        request.setAttribute("trainList", trainList);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("user/searchresult.jsp");
	        dispatcher.forward(request, response);
	  
	      
	    }
}
