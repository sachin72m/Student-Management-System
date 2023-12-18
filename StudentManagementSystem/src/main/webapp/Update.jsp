<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>

<style>
body {
	font-style:oblique;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Header styles */
header {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	text-align: center;
}

/* Main content styles */
main {
	padding: 20px;
}

/* Footer styles */
footer {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	background-color: #007bff;
	padding: 10px;
	text-align: center;
}

/* Styles for the search form */
        .search-form {
            text-align: center;
            margin-top: 20px;
        }
        .search-form input[type="number"] {
            padding: 8px;
            font-size: 16px;
        }
        .search-form input[type="submit2"] {
            padding: 8px 20px;
            font-size: 16px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        
	     
		/* Additional styling for Form */
		
.update-form-content {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding: 15px; /* Adjust padding */
    border: 1px solid #ccc;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
}

.form-group {
    width: 100%;
}

.form-left,
.form-right {
    width: 48%; /* Adjust width for left and right sections */
    padding: 0 10px; /* Adjust padding */
    box-sizing: border-box;
}

.form-left {
    float: left;
}

.form-right {
    float: right;
}

.form-left label,
.form-right label {
    display: block;
    margin-bottom: 3px; /* Adjust margin */
}

.form-left input,
.form-right input {
    width: 100%;
    padding: 5px; /* Adjust padding */
    margin-bottom: 8px; /* Adjust margin */
}
.form-group input[type="submit"] {
			background-color: lightseagreen;
			color: white;
			cursor: pointer;
			font-size: 20px;
            text-align:center;
            margin-top: 10px;    /* Adjust margin */
            
            
		}

</style>
</head>
<body>
	<header>
		<h2>Update Student</h2>
	</header>


	<main>
		 <div class="search-form">
            <form action="SearchStudentServlet" method="get"> 
                <input type="number" name="student_id" placeholder="Enter ID">
                <button type="submit" value="Search">Search</button>
            </form>
        </div>
        <p>
        
        <!-- Form for updating student information -->
        
         <div class="update-form">
        <form action="UpdateStudentServlet" method="post" class="update-form-content">
            <div class="form-group">
                <div class="form-left">
                    <label for="student_id">Student ID:</label>
                    <input type="number" id="student_id" name="student_id" value="${studentId}">
                    
                    <label for="student_name">Student Name:</label>
                    <input type="text" id="student_name" name="student_name" value="${studentName}">
                    
                    <label for="email">Email ID:</label>
                    <input type="email" id="email" name="email" value="${Email}">
                    
                    <label for="phone_number">Phone Number:</label>
                    <input type="number" id="phone_number" name="phone_number" value="${phoneNumber}">
            <div class="form-group">
                <input type="submit" value="Update">
            </div>
                </div>
                
                <div class="form-right">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${Address}">
                    
                    <label for="course_id">Course ID:</label>
                    <input type="number" id="course_id" name="course_id" value="${courseId}">
                    
                    <label for="course_name">Course Name:</label>
                    <input type="text" id="course_name" name="course_name" value="${courseName}">
                    
                    <label for="course_code">Course Code:</label>
                    <input type="text" id="course_code" name="course_code" value="${courseCode}">
                    
                    <label for="grade">Grade:</label>
                    <input type="number" id="grade" name="grade" value="${Grade}">
                </div>
            </div>
            
        </form>
    </div>
	</main>



	<footer>
		<h2>Student Management System</h2>
	</footer>
</body>
</html>