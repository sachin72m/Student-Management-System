<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.student.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <link rel="icon" href="https://gdm-catalog-fmapi-prod.imgix.net/ProductLogo/6565bd61-0fe6-459e-9ae4-69ead84c1fc4.png"
          type="png">
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
  <style>
/* Styles for the header section */
header {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	text-align: center;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	max-width: 1200px;
	margin: 0 auto;
}

.left-section a {
	text-decoration: none;
	color: #fff;
	font-size: 20px;
	font-style: oblique;
	font-weight: bold;
}

.right-section {
	display: flex;
	align-items: center;
	font-size: 20px;
	font-style: oblique;
	font-weight: bold;
}

.right-section a {
	text-decoration: none;
	color: #fff;
	margin-left: 20px;
	transition: color 0.3s ease;
}

.right-section a:hover {
	color: #f0f0f0; /* Change color on hover */
}

/* Student button styling... */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: wheat;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	cursor: pointer;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content button {
	display: block;
	width: 100%;
	padding: 10px;
	text-align: left;
	border: none;
	background-color: inherit;
	cursor: pointer;
	font-size: 18px;
}

.dropdown-content button:hover {
	background-color: red;
}

form {
	display: flex;
	align-items: center;
	margin-bottom: 0;
}

input[type="text"] {
	margin-right: 10px;
	padding: 6px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-style: oblique;
	font-weight: bold;
}

input[type="submit"] {
	padding: 6px 12px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 20px;
	font-style: oblique;
	font-weight: bold;
}

.navbar a, .navbar form {
	margin-right: 20px;
}

/* Styles for the footer section */
footer {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	background-color: #007bff;
	padding: 10px;
	text-align: center;
}

/* Dark Mode */
body.dark-mode {
	background-color: #333;
	color: #fff;
}

.dark-mode footer {
	background-color: #111;
}

/* Toggle Button Style */
.toggle {
	position: relative;
	display: inline-block;
	width: 40px;
	height: 20px;
	margin-left: 15px;
}

.toggle input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	transition: 0.4s;
	border-radius: 20px;
}

.slider:before {
	position: absolute;
	content: "";
	height: 16px;
	width: 16px;
	left: 2px;
	bottom: 2px;
	background-color: white;
	transition: 0.4s;
	border-radius: 50%;
}

input:checked+.slider {
	background-color: #007bff;
}

input:checked+.slider:before {
	transform: translateX(20px);
}

/* End Toggle Button Style */



/* Add Student Styling */
 #dialog-overlay {
			display: none;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.5);
			justify-content: center;
			align-items: center;
			z-index: 9999;
		}

#dialog-box {
			display: none;
			background-color: #fff;
			padding: 40px;
			border-radius: 5px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			width: 70%;
			max-width: 500px;
			max-height: 80vh;
			overflow-y: auto;
			display: grid;
			grid-template-columns: repeat(2, 1fr);
			/* Split into two columns */
			gap: 20px;
			/* Gap between columns */
		}

.form-section {
			grid-column: span 1;
			/* Span the entire width of a column */
		}

		.form-group {
			margin-bottom: 20px;
		}

		.form-group label {
			display: block;
			margin-bottom: 5px;
			font-weight: normal;
		}

		.form-group input,
		.form-group textarea {
			width: 100%;
			padding: 10px;
			border-radius: 5px;
			border: 1px solid #ccc;
			font-size: 16px;
			box-sizing: border-box;
		}
		.form-group input[type="submit"] {
			background-color: lightseagreen;
			color: white;
			cursor: pointer;
			font-size: 16px;
		}
		
		
		/* Style for Student List form section.  */
		 table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 3px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #007bff;
            color:white;
        }

        tr:nth-child() {
            background-color: white;
        }
        
        
        footer{
        font-style:oblique;
        }
        main{
        font-style:oblique;
        }
        
        
	 /* FOR AFTER CLICKING ON Delete Student BUTTON ACTION  */
	/* Style for the dialog box */
	#dialog-overlay3 {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    justify-content: center;
	    align-items: center;
	    z-index: 9999;
	}
	
	#dialog-box3 {
	    background-color: blueviolet;
	    padding: 20px;
	    border-radius: 5px;
	    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}
	
	#studentID2 {
	    width: 250px; /* Adjust the width as needed */
	    padding: 10px;
	    font-size: 16px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    margin-bottom: 15px;
	}
	
	/* Style for the buttons */
	#dialog-box3 button {
	    padding: 12px 20px; /* Adjust padding for larger buttons */
	    font-size: 13px;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer; 
	}
	
	/* Calculate GPA Button Styling  */
	.GPA button {
        background-color: #007bff; /* Red background */
         color: white !important; /* White text */
        border: none;
        padding: 10px 20px; /* Adjust padding as needed */
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        border-radius: 5px; /* Rounded corners */
        cursor: pointer;
        margin-top:35px;
        font-style:oblique;
        font-weight:bold;
        
    }
    .GPA {
        display: flex;
        justify-content: center; /* Align items to the right */
       
    }

    .GPA button:hover {
        background-color: black; /* Darker red on hover */
    }
</style>
</head>
<body>
    <!-- Header section -->
    <header>
    <nav>
        <div class="navbar">
            <div class="left-section">
                <a href="homepage.jsp">Student Management System</a>
            </div>
            <div class="right-section">
                <div class="dropdown">
                    <form>Students</form>
                    <div class="dropdown-content">
            <button class="add-button" id="open-dialog-button">Add</button>
            <button id="updateButton" >Update</button>
            
            <button class="delete-button" id="open-dialog-button2">Delete</button>
        </div>
        </div>
                  <form action="StudentListServlet" method="get">
                    <input type="submit" value="Students List">
                  </form> 
                  <form onsubmit="return false;">
                      <input type="text" placeholder="Search.." name="searchInput" id="searchInput" onkeyup="performSearch()">
                      <div id="suggestionBox"></div>
                     <input type="button" value="Search" onclick="performSearch()">
                  </form>
                
                <!-- Toggle button for light/dark mode -->
                <label class="toggle">
                    <input type="checkbox" id="modeToggle">
                    <span class="slider"></span>
                </label>
            </div>
        </div>
    </nav>
</header>
    
    <!--  My dialog box form for Add Student -->
    <!--Adding Students Details -->
    
    <form id="employee-details-form" action="AddStudentServlet" method="post">
	 <div id="dialog-overlay">
		<div id="dialog-box">
			<div class="form-section">
				<h2>Add Student Details</h2>
				
					
					<div class="form-group">
						<label for="student_id">Student ID:</label>
						<input type="number" id="student_id" name="student_id" required>
					</div>
					<div class="form-group">
					    <label for="student_name">Student Name:</label>
					    <input type="text" id="student_name" name="student_name" required>
					</div>
					<div class="form-group">
						<label for="email">Student Email:</label>
						<input type="email" id="email" name="email" required>
					</div>
					<div class="form-group">
						<label for="phone_number">Phone Number:</label>
						<input type="number" id="phone_number" name="phone_number">
					</div>
					<div class="form-group">
						<label for="address">Address:</label>
						<input type="text" id="address" name="address">
					</div>
					<div class="form-group">
						<label for="course_id">Course ID:</label>
						<input type="number" id="course_id" name="course_id">
					</div>
					<div class="form-group">
						<label for="course_name">Course Name:</label>
						<input type="text" id="course_name" name="course_name">
					</div>
					<div class="form-group">
						<label for="course_code">Course Code:</label>
						<input type="text" id="course_code" name="course_code">
					</div>
					<div class="form-group">
						<label for="grade">Grade:</label>
						<input type="number" id="grade" name="grade">
					</div>
					<div class="form-group">
						<input type="submit" value="Submit">
					</div>
				
			</div>
		</div>
	 </div>
	 </form>
    
    
     
        
        
    
    <!-- Main content section -->
    <main>
        <div id="studentTable">
        <h1 style="color:red ; text-align:center">Students List</h1>
    
        <table>
            <thead>
			<tr>
				<th>Student ID</th>
				<th>Student Name</th>
				<th>Email ID</th>
				<th>Phone Number</th>
				<th>Address</th>
				<th>Course ID</th>
				<th>Course Name</th>
				<th>Course Code</th>
				<th>Grade</th>
				<!-- Add other table headers for student attributes -->
			</tr>
		</thead>
            <tbody>
			<!-- Iterate through the studentList passed from the servlet -->
            <c:forEach var="student" items="${sessionScope.studentList}">
				<tr>
					<td>${student.studentId}</td>
					<td>${student.studentName}</td>
					<td>${student.email}</td>
					<td>${student.phoneNumber}</td>
					<td>${student.address}</td>
					<td>${student.courseId}</td>
					<td>${student.courseName}</td>
					<td>${student.courseCode}</td>
					<td>${student.grade}</td>
					<!-- Add other table cells for student attributes -->
				</tr>
			</c:forEach>
		</tbody>
        </table>
    </div>
    <div class="GPA">   
    <form id="calculateGPAForm" action="CalculateGPAServlet" method="post">
    <button style="color: red;" id="student_id">Calculate GPA</button>
   </form>
   </div>
    </main>
    
    
    <!-- For deleting button -->
    <div id="dialog-overlay3" style="display: none;">
          <div id="dialog-box3">
            <h2>Delete Student</h2>
            <form action="DeleteStudentServlet" method="post">
              <input type="text" id="studentID2" name="studentID2" placeholder="Enter Student ID">
              <p>
              <button type="button" onclick="searchStudent()">OK</button>
              <button type="button" onclick="closeDialog()">Cancel</button>
            </form>
          </div>
        </div>
    
    
    
    
    <!-- ************** Script Tag ****************** -->
    
     <!-- JavaScript for toggling dark mode -->
    <script>
        const toggleSwitch = document.querySelector('#modeToggle');
        toggleSwitch.addEventListener('change', switchTheme, false);

        function switchTheme(e) {
            if (e.target.checked) {
                document.body.classList.add('dark-mode');
            } else {
                document.body.classList.remove('dark-mode');
            }
        }
        
        
        
        <!-- FOR ADD NEW EMPLOYEE   -->
    	
    		// JavaScript to open and close dialog box
    		document.getElementById('open-dialog-button').addEventListener('click', function () {
    			document.getElementById('dialog-overlay').style.display = 'flex';
    			document.getElementById('dialog-box').style.display = 'block';
    		});

    		// Close dialog box when clicking outside the box
    		document.getElementById('dialog-overlay').addEventListener('click', function (event) {
    			if (event.target === this) {
    				document.getElementById('dialog-overlay').style.display = 'none';
    			}
    		});

        
    		//For performing Search button....
    		
    function performSearch() {
    const searchText = document.getElementById("searchInput").value.toLowerCase().trim();
    const table = document.getElementById("studentTable");
    const rows = table.getElementsByTagName("tr");

    for (let i = 1; i < rows.length; i++) {
        const studentNameCell = rows[i].getElementsByTagName("td")[1]; // Assuming Name is in the second column

        if (studentNameCell) {
            const studentNameText = studentNameCell.textContent.toLowerCase().trim();

            if (studentNameText.includes(searchText)) {
                rows[i].style.display = ""; // Show the row if search matches
            } else {
                rows[i].style.display = "none"; // Hide the row if search doesn't match
            }
        }
    }
}

        
	    		//For Update button
	    	// Function to redirect to Update.jsp when the button is clicked
	// Function to redirect to Update.jsp when the button is clicked
	document.getElementById("updateButton").addEventListener("click", function() {
	    window.location.href = "Update.jsp"; // Redirect to Update.jsp
	});

        
	    		
		 /* Delete Student By ID*/
    	// Function to open the dialog when the "Delete" button is clicked
document.getElementById('open-dialog-button2').addEventListener('click', function () {
    document.getElementById('dialog-overlay3').style.display = 'block';
});

// Function to close the dialog when clicking outside of it
document.getElementById('dialog-overlay3').addEventListener('click', function (event) {
    if (event.target === this) {
        document.getElementById('dialog-overlay3').style.display = 'none';
    }
});




//For Calculate GPA Button... 
// New function to handle the click event for the "Calculate GPA" button
document.querySelector('#calculateGPAForm').addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent the default form submission

    const studentID = prompt("Enter Student ID:");

    if (studentID && studentID.trim() !== '') {
        const form = document.getElementById('calculateGPAForm');
        const formData = new FormData(form);
        formData.append('student_id', studentID); // Add the student ID to the form data

        fetch('CalculateGPAServlet', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                return response.text();
            }
            throw new Error('Network response was not ok.');
        })
        .then(data => {
            alert('GPA for Student ID ' + studentID + ' is: ' + data);
        })
        .catch(error => {
            console.error('There has been a problem with your fetch operation:', error);
            alert('Error: Unable to calculate GPA.');
        });
    } else {
        alert('Please enter a valid Student ID.');
    }
});


        
    </script>

    <footer>
		<marquee><h3>Student Management System</h3></marquee>
	</footer>
</body>
</html>
