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
 * Servlet implementation class UpdateStudentServlet
 */
@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve form data from the request
		int studentId = Integer.parseInt(request.getParameter("student_id"));
		String studentName = request.getParameter("student_name");
		String Email = request.getParameter("email");
		String phoneNumber = request.getParameter("phone_number");
		String Address = request.getParameter("address");
		String courseId = request.getParameter("course_id");
		String courseName = request.getParameter("course_name");
		String courseCode = request.getParameter("course_code");
		String Grade = request.getParameter("grade");
		
        // JDBC Connection parameters
        String dbUrl = "jdbc:mysql://localhost:3306/studentmanagement";
        String dbUsername = "root";
        String dbPassword = "ABab12@@";

        try {
            // Load and register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // Prepare the SQL query to update all student data
            String sql = "UPDATE students SET student_name=?, email=?, phone_number=?, address=?, "
                    + "course_id=?, course_name=?, course_code=?, grade=? WHERE student_id=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, studentName);
            statement.setString(2, Email);
            statement.setString(3, phoneNumber);
            statement.setString(4, Address);
            statement.setString(5, courseId);
            statement.setString(6, courseName);
            statement.setString(7, courseCode);
            statement.setString(8, Grade);
            statement.setInt(9, studentId);
            // Execute the update query
            int rowsUpdated = statement.executeUpdate();

            if (rowsUpdated > 0) {
                // Updated successfully, redirect to a success page or back to Update.jsp
                response.sendRedirect("StudentListServlet");
            } else {
                // Handle update failure
                response.getWriter().println("<h2 style=\"color: red;\">Error updating student information</h2>");
            }

            // Close connections and resources
            statement.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            // Handle exceptions
            System.out.println(e.getMessage());
        }
    }
}
