package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddTrainDao;
import dao.deleteTrainDao;

@WebServlet("/deleteTrainServlet")
public class deleteTrainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int trainNumber = Integer.parseInt(request.getParameter("trainNumber"));

     
   
            
        int res = 0;
            try {
                res = deleteTrainDao.deleteTrain(trainNumber);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (res == 1) {
            	PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Train Deleted Successfully! Redirecting to Train list...');");
                out.println("window.location.href = 'Admin/deletetrain.jsp';");
                out.println("</script>");
            }
    }
}
