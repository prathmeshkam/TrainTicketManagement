package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ValidateDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("LoginServlet is executing...");
    	HttpSession session = request.getSession(); 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            boolean check = ValidateDao.validateDetails(username, password, role);

            if (check && role.equals("admin")) {
            	session.setAttribute("username", username);
            	System.out.println("Logged-in Username: " + username);
            	response.sendRedirect(request.getContextPath() + "/Admin/adminportal.jsp");

            } else if (check && role.equals("user")) {
            	session.setAttribute("username", username);
            	System.out.println("Logged-in Username: " + username);
            	response.sendRedirect(request.getContextPath() + "/user/userportal.jsp");

            } else {
                request.setAttribute("login", "failed");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}