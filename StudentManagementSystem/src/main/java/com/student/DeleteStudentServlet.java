package com.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int studentId = Integer.parseInt(request.getParameter("studentID2"));

	        // JDBC Connection parameters (modify these according to your database setup)
	        String dbUrl = "jdbc:mysql://localhost:3306/studentmanagement";
	        String dbUsername = "root";
	        String dbPassword = "ABab12@@";

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

	            // Prepare SQL statement for deletion
	            String sql = "DELETE FROM students WHERE student_id = ?";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setInt(1, studentId);

	            // Execute the deletion query
	            int rowsDeleted = statement.executeUpdate();

	            if (rowsDeleted > 0) {
	                // Deletion successful
	                response.sendRedirect("StudentListServlet"); // Redirect to homepage after deletion
	            } else {
	                // No rows deleted (student not found)
	                response.getWriter().println("<h2 style=\"color: red;\">No student found with the entered ID</h2>");
	            }

	            // Close connections and statements
	            statement.close();
	            conn.close();
	        } catch (SQLException | ClassNotFoundException e) {
	            System.out.println(e.getMessage());
	            response.sendRedirect("error.jsp"); // Redirect to error page on exception
	        }
	    }
	}