package com.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalculateGPAServlet")
public class CalculateGPAServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

//        int studentId = Integer.parseInt(request.getParameter("student_id"));
       
        String studentIdParam = request.getParameter("student_id");
        int studentId = 4; // Default value

        if (studentIdParam != null && !studentIdParam.isEmpty()) {
            studentId = Integer.parseInt(studentIdParam);
        } else {
            out.println();
        }
        
        // Database connection parameters
        String dbUrl = "jdbc:mysql://localhost:3306/studentmanagement";
        String dbUsername = "root";
        String dbPassword = "ABab12@@"; // Replace with your database password

        try {
            // Load and register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // Prepare SQL query to fetch grades based on student ID
            String sql = "SELECT grade FROM students WHERE student_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, studentId);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            List<Integer> studentGrades = new ArrayList<>();

            // Fetch grades for the specific student ID
            while (resultSet.next()) {
                int grade = resultSet.getInt("grade");
                studentGrades.add(grade);
            }

            if (!studentGrades.isEmpty()) {
                // Calculate GPA for the student
                double gpa = calculateGPA(studentGrades);

                // Display GPA for the specific student ID
                out.println("<h2>GPA for Student ID "+ gpa + "</h2>");
            } else {
                out.println(studentId);
            }
        

            // Close connections
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            out.println("Error: " + e.getMessage());
            System.out.println(e.getMessage());
        }
    }

    private double calculateGPA(List<Integer> studentGrades) {
        double totalGPA = 0.0;
        int totalGrades = studentGrades.size();

        // Define GPA scale mapping
        Map<Integer, Double> gradeToGPA = new HashMap<>();
        gradeToGPA.put(6, 2.5);
        gradeToGPA.put(7, 3.0);
        gradeToGPA.put(8, 3.5);
        gradeToGPA.put(9, 4.0);
        // Add more grade-to-GPA mappings as needed

        // Calculate total GPA
        for (int grade : studentGrades) {
            // Convert grade to GPA based on the scale
            double gpa = gradeToGPA.getOrDefault(grade, 0.0);
            totalGPA += gpa;
        }

        // Calculate average GPA
        double averageGPA = totalGPA / totalGrades;
        return averageGPA;
    }
}
