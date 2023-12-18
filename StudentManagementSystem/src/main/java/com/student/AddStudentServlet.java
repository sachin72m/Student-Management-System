package com.student;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.PseudoColumnUsage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.CsrfPreventionFilter;

/**
 * Servlet implementation class AddStudentServlet
 */
@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form data
		String student_id = request.getParameter("student_id");
		String student_name = request.getParameter("student_name");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone_number");
		String address = request.getParameter("address");
		String course_id = request.getParameter("course_id");
		String course_name = request.getParameter("course_name");
		String course_code = request.getParameter("course_code");
		String grade = request.getParameter("grade");
		// Get other form fields

		// Database connection and insertion
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement",
					"root", "ABab12@@");
			System.out.println(conn);

			String sql = "INSERT INTO students (student_id, student_name, email, phone_number, address, course_id, course_name, course_code, grade) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, student_id);
			ps.setString(2, student_name);
			ps.setString(3, email);
			ps.setString(4, phone_number);
			ps.setString(5, address);
			ps.setString(6, course_id);
			ps.setString(7, course_name);
			ps.setString(8, course_code);
			ps.setString(9, grade);

			// Execute the prepared statement
			ps.executeUpdate();

			// Close the PreparedStatement and perform any necessary cleanup
			ps.close();

			// Handle success scenario or redirect to success page
			response.sendRedirect("StudentListServlet"); // Redirect to success page

		} catch (Exception e) {
			// Handle exceptions, rollback on error, and display error messages or redirect
			// to an error page
			System.out.println(e.getMessage()); // Handle error scenario
			response.sendRedirect("error.jsp"); // Redirect to error page
		} finally {
			// Close connections, statements, etc.

		}
	}

}