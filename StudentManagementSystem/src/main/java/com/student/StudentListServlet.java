package com.student;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/StudentListServlet")
public class StudentListServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = new ArrayList<>();

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/studentmanagement"; // Replace with your database URL
        String username = "root"; // Replace with your database username
        String password = "ABab12@@"; // Replace with your database password

        try {
            // Load and register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // Query to fetch student data
            String query = "SELECT * FROM students";

            // Create a PreparedStatement
            PreparedStatement pstmt = conn.prepareStatement(query);

            // Execute the query
            ResultSet rs = pstmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("student_id"));
                student.setStudentName(rs.getString("student_name"));
                student.setEmail(rs.getString("email"));
                student.setPhoneNumber(rs.getString("phone_number"));
                student.setAddress(rs.getString("address"));
                student.setCourseId(rs.getInt("course_id"));
                student.setCourseName(rs.getString("course_name"));
                student.setCourseCode(rs.getString("course_code"));
                student.setGrade(rs.getString("grade"));
                // Add other student attributes as needed

                studentList.add(student);

                
                
            }

            // Close the ResultSet, PreparedStatement, and Connection
            rs.close();
            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getMessage());
        }
     // Set the studentList as an attribute in request scope to pass to the JSP
        request.setAttribute("studentList", studentList);
        
     // Store the fetched data in the session
        HttpSession session = request.getSession();
        session.setAttribute("studentList", studentList);

     // Redirect to the homepage.jsp
        response.sendRedirect("homepage.jsp");
       
//        // Forward the request to the JSP file for displaying the student data
//        RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
//        dispatcher.forward(request, response);
     
    }
}
