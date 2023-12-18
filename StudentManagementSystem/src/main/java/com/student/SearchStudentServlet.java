package com.student;

import java.awt.Color;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchStudentServlet
 */
@WebServlet("/SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Retrieve the student ID from the request
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        

        // JDBC Connection parameters (modify these according to your database setup)
        String dbUrl = "jdbc:mysql://localhost:3306/studentmanagement";
        String dbUsername = "root";
        String dbPassword = "ABab12@@";

        try {
            // Load and register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the database connection
            Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            
            // Prepare the SQL query to fetch student data based on ID
            String sql = "SELECT * FROM students WHERE student_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, studentId);
            
            
            // Execute the query
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                // Retrieve data from the ResultSet
                // Set retrieved data in request attributes to use in JSP
                request.setAttribute("studentId", resultSet.getInt("student_id"));
                request.setAttribute("studentName", resultSet.getString("student_name"));
                request.setAttribute("Email", resultSet.getString("email"));
                request.setAttribute("phoneNumber", resultSet.getString("phone_number"));
                request.setAttribute("Address", resultSet.getString("address"));
                request.setAttribute("courseId", resultSet.getString("course_id"));
                request.setAttribute("courseName", resultSet.getString("course_name"));
                request.setAttribute("courseCode", resultSet.getString("course_code"));
                request.setAttribute("Grade", resultSet.getString("grade"));
                // Add other retrieved fields similarly
                
                System.out.println("Student ID:"+ studentId);
                
                // Forward the request to Update.jsp to populate the form
                RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle case when no student found with entered ID
                // Redirect to an error page or display a message
            	response.setContentType("text/html");
                response.getWriter().println("<h2 style=\"color: red;\">No student found with the entered ID</h2>");
            }
            
            // Close connections
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
    }
}
	