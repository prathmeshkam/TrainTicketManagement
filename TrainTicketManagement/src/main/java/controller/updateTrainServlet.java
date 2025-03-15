package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddTrainDao;
import dao.updateTrainDao;
import model.AddTrain;

@WebServlet("/updateTrainServlet")
public class updateTrainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            // Get parameters from the form
            int trainNumber = Integer.parseInt(request.getParameter("trainNumber"));
            String trainName = request.getParameter("trainName");
            String originStation = request.getParameter("originStation");
            String destinationStation = request.getParameter("destinationStation");
            String departureTime = request.getParameter("departureTime");
            String arrivalTime = request.getParameter("arrivalTime");
            int numberOfSeats = Integer.parseInt(request.getParameter("numberOfSeats"));
            int firstAC = Integer.parseInt(request.getParameter("firstAC"));
            int secondAC = Integer.parseInt(request.getParameter("secondAC"));
            int thirdAC = Integer.parseInt(request.getParameter("thirdAC"));
            int secondSitting = Integer.parseInt(request.getParameter("secondSitting"));
            int sleeper = Integer.parseInt(request.getParameter("sleeper"));
            java.sql.Date trainDate = java.sql.Date.valueOf(request.getParameter("trainDate"));

            // Create Train object
            AddTrain train = new AddTrain(trainNumber, trainName, originStation, destinationStation, departureTime, arrivalTime, numberOfSeats, firstAC, secondAC, thirdAC, secondSitting, sleeper, trainDate);
            
            // Call updateTrain function
            int res = 0;
            try {
                res = updateTrainDao.updateTrain(train);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (res == 1) {
            	PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Train Updated Successfully! Redirecting to add train...');");
                out.println("window.location.href = 'Admin/updatetrain.jsp';");
                out.println("</script>");
            }
        
    }
}
